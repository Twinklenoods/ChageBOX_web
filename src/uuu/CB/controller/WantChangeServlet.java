package uuu.CB.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uuu.vgb.entity.remind;
import uuu.vgb.entity.Customer;
import uuu.vgb.entity.DataInvalidException;
import uuu.vgb.entity.Product;
import uuu.vgb.entity.WantChange;
import uuu.vgb.entity.VGBException;
import uuu.vgb.service.QuestionService;
import uuu.vgb.service.RemindService;
import uuu.vgb.service.WantChangeService;

/**
 * Servlet implementation class QuestionServlet
 */
@WebServlet("/WantChange.do")
public class WantChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WantChangeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> errors=new ArrayList<>();
		request.setCharacterEncoding("utf-8");
		//1讀取資料
		String user =request.getParameter("user");
		int productId =Integer.parseInt(request.getParameter("productId"));
		String owner =request.getParameter("owner");
		String remind =request.getParameter("remind");
		//2.若無誤，呼叫商業邏輯
		if(errors.isEmpty()) {
			WantChange w =new WantChange();
			Product p = new Product();
			Customer c= new Customer();
			Customer c2= new Customer();
			remind r = new remind();//忘記取大寫 請忽略
			try {
				//set w
			
				c.setId(user);
				w.setUser(c);
				p.setId(productId);
				w.setProductID(p);
				
				c2.setId(owner);
				w.setOwnerID(c2);
				
				WantChangeService service = new WantChangeService();
				
				service.register(w);
				//set r
			
				
				//3.1forward (內部轉交)to註冊成功畫面
				
				response.sendRedirect("change.jsp");
			
				
				return;
			}catch(DataInvalidException e) {
				errors.add("新增申請失敗"+e.getMessage());
				this.log("新增申請發生錯誤",e);//開發者
			}catch(VGBException e) {
				errors.add("新增申請失敗"+e.getMessage());//user
				this.log("新增申請發生錯誤",e);//開發者
			}catch(Exception e) {
				errors.add("新增申請發生錯誤"+e.getMessage());//user
				this.log("新增申請發生非預期錯誤",e);
			}	
		}
		
		//3.2顯示失敗畫面
		request.setAttribute("errors", errors);
		RequestDispatcher dispatcher = 
				request.getRequestDispatcher("change.jsp");
		
		dispatcher.forward(request,response);
		}

	
}

