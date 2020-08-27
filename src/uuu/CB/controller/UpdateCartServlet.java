package uuu.CB.controller;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uuu.vgb.entity.CartItem;
import uuu.vgb.entity.ShoppingCart;

/**
 * Servlet implementation class UpdateCartServlet
 */
@WebServlet("/member/update_cart.do")
public class UpdateCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		ShoppingCart cart =(ShoppingCart)session.getAttribute("cart");
		
		//1.取得request的form data
		if(cart!=null) {
			Set<CartItem>trashCan=new HashSet<>();
			for(CartItem item:cart.getCartItemSet()) {
				String delete= request.getParameter("delete"+item.hashCode());
				if(delete!=null) {//將待刪除的購物明細加入trashCan
					//cart.remove
					trashCan.add(item);//當不是Remove可能發生ConcurrentModificationException
			
				}
			}
			for(CartItem item:trashCan) {
				cart.remove(item);
			}
		}
		
		//3.redirect to cart.jsp
		response.sendRedirect("cart.jsp");
	}

}
