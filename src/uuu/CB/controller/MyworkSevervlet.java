package uuu.CB.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uuu.vgb.entity.Customer;
import uuu.vgb.entity.DataInvalidException;
import uuu.vgb.entity.VGBException;
import uuu.vgb.service.CustomerService;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/member/mywork.do")//http://localhost8080/CB/register.do
public class MyworkSevervlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyworkSevervlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> errors=new ArrayList<>();
		request.setCharacterEncoding("utf-8");
		//1.讀取資料
		String id= request.getParameter("id");
		
		String name=request.getParameter("name");
		String birthday=request.getParameter("birthday");
		String email=request.getParameter("email");
		String address=request.getParameter("address");
		String phone=request.getParameter("phone");
		String gender=request.getParameter("gender");
		//todo
		//String captcha=request.getParameter("captcha");
		String p1=request.getParameter("pwd1");
		String p2=request.getParameter("pwd2");
		
		

		
		if(id==null || !Customer.checkId(id)) {
			errors.add("必須輸入正確的id");
		}
		
		if(birthday==null) {
			errors.add("必須輸入正確的生日");
		}
		
		//2.若無誤，呼叫商業邏輯
		if(errors.isEmpty()) {
			CustomerService service =new CustomerService();
			try {
				Customer c = service.login(id,p1);
		
				
				c.setName(name);
				c.setBirthday(birthday);
				c.setEmail(email);
				c.setPassword(p2);
				c.setAddress(address);
				c.setGender((gender).charAt(0));
				c.setPhone(phone);
				
				
				
				service.update(c);
				
				//3.1forward (內部轉交)to註冊成功畫面
				request.setAttribute("customer", c);
				RequestDispatcher dispatcher = 
						request.getRequestDispatcher("mywork.jsp");
				
			dispatcher.forward(request,response);
			return;
			}catch(DataInvalidException e) {
				errors.add("修改失敗"+e.getMessage());
				this.log("修改發生錯誤",e);//開發者
			}catch(VGBException e) {
				errors.add("修改失敗"+e.getMessage());//user
				this.log("修改發生錯誤",e);//開發者
			}catch(Exception e) {
				errors.add("修改發生錯誤"+e.getMessage());//user
				this.log("會員發生非預期錯誤",e);
			}
		
				
			
				
				
		}
		
		//3.2顯示失敗畫面
		request.setAttribute("errors", errors);
		RequestDispatcher dispatcher = 
				request.getRequestDispatcher("mywork.jsp");
		
		dispatcher.forward(request,response);
}
	}