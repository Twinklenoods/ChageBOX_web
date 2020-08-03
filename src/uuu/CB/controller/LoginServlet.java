package uuu.CB.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> errors=new ArrayList<>();//import java util
		String id= request.getParameter("id");
		String pwd=request.getParameter("pwd");
		//1.取的request請求中的FormDate(第10章),並檢查之
		
		if(id==null || id.length()==0) {
		errors.add("必須輸入帳號");				
		}
		
		if(pwd==null || id.length()==0) {
			errors.add("必須輸入密碼");
		}
	
		//2.若無誤，則呼叫商業邏輯
		if(errors.isEmpty()) {
			CustomerService service= new CustomerService();
			try {
				Customer c= service.login(id,pwd);
				//3.1顯示(第9章)登入成功畫面
				response.setContentType("text/html");
				response.setCharacterEncoding("utf-8");
				try(
				PrintWriter out = response.getWriter()
				){
				out.println("<html>");
				out.println("<body>");
				out.println("<p>登入成功!"+c.getName());
				out.println("</body>");
				out.println("</html>");
				
				}	
				return;
			} catch (VGBException e) {
				errors.add(e.getMessage());
				
			}
			
		}
	
		//3.2顯示登入失敗
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		try(PrintWriter out = response.getWriter()){
			out.println("<html>");
			out.println("<body>");
			out.println("<p>登入失敗!"+errors+"</P>");
			out.println("</body>");
			out.println("</html>");
		}	
		
	}

}
