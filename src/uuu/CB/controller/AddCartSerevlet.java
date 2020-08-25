package uuu.CB.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uuu.vgb.entity.Product;
import uuu.vgb.entity.ShoppingCart;
import uuu.vgb.entity.VGBException;
import uuu.vgb.service.ProductSelectService;

/**
 * Servlet implementation class AddCartServlet
 */
@WebServlet("/add_cart.do")
public class AddCartSerevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCartSerevlet() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	//protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//	doPost(request,response);
	//}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> errors = new ArrayList<>();		
		//1.取得request的Form Data
		String productId = request.getParameter("productId");
		//String color = request.getParameter("color");
		//String quantity = request.getParameter("quantity");
		
		//2.執行商業邏輯
		ProductSelectService service = new ProductSelectService();
		
		try {
			Product p = service.getProduct(productId);
			if(p!=null) {				
				//if(quantity!=null && quantity.matches("\\d+")) {					
					//從session找出購物車，若無則建立購物車並加入session
					HttpSession session = request.getSession();
					ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
					if(cart==null) {
						cart = new ShoppingCart();
						session.setAttribute("cart", cart);
					}
					
					//加入購物車
					cart.add(p);
				//}else{
					errors.add("加入購物車失敗，根本沒這個產品吧:");
				//}
				
			}else {
				errors.add("加入購物車失敗，查無此產品:" + productId);
			}
		} catch (VGBException e) {		
			this.log("加入購物車失敗",e);
			errors.add(e.getMessage());
		} catch(Exception ex) {
			this.log("加入購物車發生非預期錯誤",ex);
			errors.add("加入購物車發生非預期錯誤"+ex);
		}
		
		System.out.println(errors);
		
		//3.forward to cart.jsp(在此不恰當)
		//request.getRequestDispatcher("cart.jsp").forward(request, response);
		
		//3.redirect to cart.jsp
		response.sendRedirect(request.getContextPath() + "/cart.jsp");
	}

}
