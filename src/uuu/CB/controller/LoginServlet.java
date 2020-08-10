package uuu.CB.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uuu.vgb.entity.Customer;
import uuu.vgb.entity.VGBException;
import uuu.vgb.service.CustomerService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @param captcha 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> errors=new ArrayList<>();//import java util
		
		//1.取的request請求中的FormDate(第10章),並檢查之
		String id= request.getParameter("id");
		String pwd=request.getParameter("pwd");
		String captcha=request.getParameter("captcha");
		
		if(id==null || id.length()==0) {
		errors.add("必須輸入帳號");				
		}
		
		if(pwd==null || pwd.length()==0) {
			errors.add("必須輸入密碼");
		}
		if(captcha==null || captcha.length()==0) {
			errors.add("必須輸入驗證碼");
		}
	
		//2.若無誤，則呼叫商業邏輯
		if(errors.isEmpty()) {
			CustomerService service= new CustomerService();
			try {
				Customer c= service.login(id,pwd);
				//3.1顯示(第9章)登入成功畫面
				request.setAttribute("customer", c);
				RequestDispatcher dispatcher = 
						request.getRequestDispatcher("/");
				
			dispatcher.forward(request,response);
				return;
			} catch (VGBException e) {
				errors.add("登入失敗"+e.getMessage());//user
				this.log("會員登入發生錯誤",e);//開發者
			} catch (Exception e) {
				errors.add("登入失敗"+e.getMessage());//user
				this.log("會員發生非預期錯誤",e);
			}
			
		}
	
		//3.2顯示登入失敗
		request.setAttribute("errors", errors);
		RequestDispatcher dispatcher = 
				request.getRequestDispatcher("index.jsp");
		
		dispatcher.forward(request,response);
		}	
		
	}


