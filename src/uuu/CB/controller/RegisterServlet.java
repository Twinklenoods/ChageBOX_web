package uuu.CB.controller;

import java.io.IOException;
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
		response.setCharacterEncoding("utf-8");
		//讀取資料
		String id= request.getParameter("id");
		if("pwd1"=="pwd2"){
		String pwd=request.getParameter("pwd");
		}
		if(id==null || !Customer.checkId(id)) {
			errors.add("必須輸入正確的id");
		}
		
		//2.若無誤，呼叫商業邏輯
		if(errors.isEmpty()) {
			Customer c = new Customer();
			try {
				c.setId(id);
				//TODO: c.setXXX(xxx)
				
				CustomerService service = new CustomerService();
				service.register(c);
				//3.1
			}catch(DataInvalidException e) {
				errors.add(e.getMessage());
			}catch(VGBException e) {
				//TODO:
			}catch(Exception e) {
				//TODO:
			}
		}
		
		//3.2
		
	}

}