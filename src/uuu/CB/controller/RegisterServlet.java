package uuu.CB.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

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
@WebServlet("/register.do")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> errors=new ArrayList<>();
		request.setCharacterEncoding("utf-8");
		//讀取資料
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
		
		if(p1==null||p2==null|| !p1.equals(p2)){
			errors.add("必須輸入相同密碼");
		}

		
		if(id==null || !Customer.checkId(id)) {
			errors.add("必須輸入正確的id");
		}
		
		if(birthday==null) {
			errors.add("必須輸入正確的生日");
		}
		
		//2.若無誤，呼叫商業邏輯
		if(errors.isEmpty()) {
			Customer c = new Customer();
			try {
				c.setId(id);
				c.setName(name);
				c.setBirthday(birthday);
				c.setEmail(email);
				c.setPassword(p1);
				c.setAddress(address);
				c.setGender((gender).charAt(0));
				c.setPhone(phone);
				
				
				CustomerService service = new CustomerService();
				service.register(c);
				
				//3.1顯示(第9章)登入成功畫面
				response.setContentType("text/html");
				response.setCharacterEncoding("utf-8");
				try(
				PrintWriter out = response.getWriter();){
				out.println("<html>");
				out.println("<body>");
				out.println("<p>註冊成功!"+c.getName());
				out.println("<p>"+"<input type='button' onclick='history.back()' value='回上一頁'>"+"</P>");
				out.println("</body>");
				out.println("</html>");
				
				}	
				return;
			}catch(DataInvalidException e) {
				errors.add("註冊失敗"+e.getMessage());
				this.log("註冊發生錯誤",e);//開發者
			}catch(VGBException e) {
				errors.add("註冊失敗"+e.getMessage());//user
				this.log("註冊發生錯誤",e);//開發者
			}catch(Exception e) {
				errors.add("註冊發生錯誤"+e.getMessage());//user
				this.log("會員發生非預期錯誤",e);
			}
		
				
			
				
				
		}
		
		//3.2
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		try(PrintWriter out = response.getWriter()){
			out.println("<html>");
			out.println("<body>");
			out.println("<p>"+"<input type='button' onclick='history.back()' value='回上一頁'>"+"</P>");
			out.println("<p>"+errors+"</P>");
			out.println("</body>");
			out.println("</html>");
		
			}

		}
}