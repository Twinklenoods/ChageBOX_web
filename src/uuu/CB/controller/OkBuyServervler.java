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

import uuu.vgb.entity.DataInvalidException;
import uuu.vgb.entity.Order;
import uuu.vgb.entity.Product;
import uuu.vgb.entity.VGBException;
import uuu.vgb.service.OrderService;
import uuu.vgb.service.ProductService;

/**
 * Servlet implementation class changeProductServervler
 */
@WebServlet("/member/ok_buy/buyok.do")
public class OkBuyServervler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public  OkBuyServervler() {
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
		
		int buyID=Integer.parseInt(request.getParameter("buyID"));
		//String yes=request.getParameter("yes");
	
		int proID=Integer.parseInt(request.getParameter("proID"));
		int listrating=Integer.parseInt(request.getParameter("listrating"));
		
		
		
		//2.若無誤，呼叫商業邏輯
		if(errors.isEmpty()) {
			OrderService service =new OrderService();
			ProductService service2 =new ProductService();
			try {
				Order o= new Order();
				Product p =new Product();
				o.setId(buyID);
				o.setPay_fee(5);
				
				service.update(o);
				
				
				//寫入買家
				
				p.setListrating(listrating);
				p.setId(proID);
				
				service2.listrating(p);
				
				
				//3.1forward (內部轉交)to註冊成功畫面
				
				RequestDispatcher dispatcher = 
						request.getRequestDispatcher("QAll.jsp");
				
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
				request.getRequestDispatcher("QAll.jsp");
		
		dispatcher.forward(request,response);
}
	}