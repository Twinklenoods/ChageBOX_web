package uuu.CB.controller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uuu.vgb.entity.CartItem;
import uuu.vgb.entity.DataInvalidException;
import uuu.vgb.entity.Order;
import uuu.vgb.entity.PaymentType;
import uuu.vgb.entity.Product;
import uuu.vgb.entity.ShoppingCart;
import uuu.vgb.entity.VGBException;
import uuu.vgb.service.OrderService;
import uuu.vgb.service.ProductService;

/**
 * Servlet implementation class changeProductServervler
 */
@WebServlet("/member/buyYes.do")
public class YesBuyServervler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public  YesBuyServervler() {
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
		
		
		
		

		
		
		
		//2.若無誤，呼叫商業邏輯
		if(errors.isEmpty()) {
			HttpSession session = request.getSession();
			ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
			
			OrderService service1 =new OrderService();
			ProductService service2 =new ProductService();
			
			try {
				for(CartItem item:cart.getCartItemSet()) {
					Product p = item.getProduct();
					String USER=request.getParameter("USER"+item.hashCode());
					int proID=Integer.parseInt(request.getParameter("proID"+item.hashCode()));	
					
					//寫入買家
					
					p.setCustomer(USER);
					p.setId(proID);
			
					
					
				}
					for(CartItem item:cart.getCartItemSet()) {
						Product p = item.getProduct();
						Order o =new Order();
						
						
						String USER=request.getParameter("USER"+item.hashCode());
						String proName=request.getParameter("proName"+item.hashCode());
						String ownerID=request.getParameter("ownerID"+item.hashCode());
						int proID=Integer.parseInt(request.getParameter("proID"+item.hashCode()));	
						int chash=Integer.parseInt(request.getParameter("chash"+item.hashCode()));	
						
						//訂單的值
						String name=request.getParameter("name");
						String phone=request.getParameter("phone");
						String email=request.getParameter("email");
						String address=request.getParameter("address");
						String pay=request.getParameter("pay");
						String use=request.getParameter("use");
						
						//寫入訂單
						
						o.setProductID(proID);
						o.setUniprice(chash);
						o.setName(name);
						o.setEmail(email);
						o.setPhone(phone);
						o.setAddress(address);
						o.setPay(pay);
						o.setUse(use);
						o.setName(proName);
						o.setUserID(USER);
						o.setOwnerID(ownerID);
						service2.BUY(p);
						service1.register(o);
					}
					
					
				
					
					
					
					
					//丟入垃圾桶
					if(cart!=null) {
						Set<CartItem>trashCan=new HashSet<>();
						for(CartItem item:cart.getCartItemSet()) {
							//String delete= request.getParameter("delete"+item.hashCode());
							String USER=request.getParameter("USER"+item.hashCode());
							if(USER!=null) {//將待刪除的購物明細加入trashCan
								//cart.remove
								trashCan.add(item);//當不是Remove可能發生ConcurrentModificationException
						
							}
						}
						for(CartItem item:trashCan) {
							cart.remove(item);
						}
					}
					
				//3.1forward (內部轉交)to註冊成功畫面
				
				RequestDispatcher dispatcher = 
						request.getRequestDispatcher("cart.jsp");
				
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
				request.getRequestDispatcher("cart.jsp");
		
		dispatcher.forward(request,response);
}
	}