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
import uuu.vgb.entity.Question;
import uuu.vgb.entity.VGBException;
import uuu.vgb.service.QuestionService;
import uuu.vgb.service.RemindService;

/**
 * Servlet implementation class QuestionServlet
 */
@WebServlet("/question.do")
public class QuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionServlet() {
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
		String question =request.getParameter("question");
		String owner =request.getParameter("owner");
		String remind =request.getParameter("remind");
		//2.若無誤，呼叫商業邏輯
		if(errors.isEmpty()) {
			Question q =new Question();
			Product p = new Product();
			Customer c= new Customer();
			remind r = new remind();//忘記取大寫 請忽略
			try {
				//set q
				q.setQuestion(question);
				c.setId(user);
				q.setUser(c);
				p.setId(productId);
				q.setProductId(p);
				
				QuestionService service = new QuestionService();
				
				service.register(q);
				//set r
				c.setId(owner);
				r.setUser(remind);
			
				r.setOwner(c);
				RemindService servic2 = new RemindService();
				
				 servic2.register(r);
				
				//3.1forward (內部轉交)to註冊成功畫面
				
				response.sendRedirect("buy.jsp");
			
				
				return;
			}catch(DataInvalidException e) {
				errors.add("新增問題失敗"+e.getMessage());
				this.log("新增問題發生錯誤",e);//開發者
			}catch(VGBException e) {
				errors.add("新增問題失敗"+e.getMessage());//user
				this.log("新增問題發生錯誤",e);//開發者
			}catch(Exception e) {
				errors.add("新增問題發生錯誤"+e.getMessage());//user
				this.log("新增問題發生非預期錯誤",e);
			}	
		}
		
		//3.2顯示失敗畫面
		request.setAttribute("errors", errors);
		RequestDispatcher dispatcher = 
				request.getRequestDispatcher("buy.jsp");
		
		dispatcher.forward(request,response);
		}

	
}
