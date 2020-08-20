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

import uuu.vgb.entity.Customer;
import uuu.vgb.entity.DataInvalidException;
import uuu.vgb.entity.Product;
import uuu.vgb.entity.VGBException;
import uuu.vgb.service.CustomerService;
import uuu.vgb.service.ProductService;

/**
 * Servlet implementation class changeProductServervler
 */
@WebServlet("/member/myproduct/delete.do")
public class DeleteProductServervler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public  DeleteProductServervler() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> errors=new ArrayList<>();
		request.setCharacterEncoding("utf-8");
		//1.讀取資料
		
		String owner=request.getParameter("owner");
	
		String id=request.getParameter("productId");	
	

		
		
		
		//2.若無誤，呼叫商業邏輯
		if(errors.isEmpty()) {
			ProductService service =new ProductService();
			try {
				Product p = service.login(id, owner);
				
				service.deleteProduct(p);
				
				//3.1forward (內部轉交)to註冊成功畫面
				request.setAttribute("product", p);
				RequestDispatcher dispatcher = 
						request.getRequestDispatcher("down.jsp");
				
			dispatcher.forward(request,response);
			return;
			}catch(DataInvalidException e) {
				errors.add("刪除失敗"+e.getMessage());
				this.log("刪除發生錯誤",e);//開發者
			}catch(VGBException e) {
				errors.add("刪除失敗"+e.getMessage());//user
				this.log("刪除發生錯誤",e);//開發者
			}catch(Exception e) {
				errors.add("刪除發生錯誤"+e.getMessage());//user
				this.log("會員發生刪除非預期錯誤",e);
			}
		
				
			
				
				
		}
		
		//3.2顯示失敗畫面
		request.setAttribute("errors", errors);
		RequestDispatcher dispatcher = 
				request.getRequestDispatcher("down.jsp");
		
		dispatcher.forward(request,response);
}
	}