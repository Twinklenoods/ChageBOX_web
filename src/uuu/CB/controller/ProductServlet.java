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
import uuu.vgb.entity.Product;
import uuu.vgb.entity.VGBException;

import uuu.vgb.service.ProductService;

/**
 * Servlet implementation class ProductServlet
 */
@WebServlet("/member/Product.do")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductServlet() {
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
		
		String host=request.getParameter("host");
		String buy=request.getParameter("buy");
		String changebox=request.getParameter("change");
		String name=request.getParameter("name");
		String description=request.getParameter("comment1");
		String photoUrl=request.getParameter("img");
		String origin=request.getParameter("origin");
		double unitPrice=Double.parseDouble(request.getParameter("BuyPrice")+0);
		String wantChange=request.getParameter("WantChange");
		String owner=request.getParameter("owner");
		String ownerN=request.getParameter("ownerN");	
		
		
		
		
		
		//2.若無誤，呼叫商業邏輯
		if(errors.isEmpty()) {
			Product c = new Product();
			try {
				c.setHost(host);
				c.setBuy(buy);
				c.setChangebox(changebox);
				c.setName(name);
				c.setDescription(description);
				c.setPhotoUrl(photoUrl);
				c.setOrigin(origin);
				c.setUnitPrice(unitPrice);
				c.setWantChange(wantChange);
				c.setOwner(owner);
				c.setOwnerN(ownerN);
				ProductService service = new ProductService();
				service.register(c);
				
				//3.1forward (內部轉交)to註冊成功畫面
				request.setAttribute("product", c);
				RequestDispatcher dispatcher = 
						request.getRequestDispatcher("Product.jsp");
				
			dispatcher.forward(request,response);
			return;
			}catch(DataInvalidException e) {
				errors.add("新增商品失敗"+e.getMessage());
				this.log("新增商品發生錯誤",e);//開發者
			}catch(VGBException e) {
				errors.add("新增商品失敗"+e.getMessage());//user
				this.log("新增商品發生錯誤",e);//開發者
			}catch(Exception e) {
				errors.add("新增商品發生錯誤"+e.getMessage());//user
				this.log("新增商品發生非預期錯誤",e);
			}
		
				
			
				
				
		}
		
		//3.2顯示失敗畫面
		request.setAttribute("errors", errors);
		RequestDispatcher dispatcher = 
				request.getRequestDispatcher("Prodcut.jsp");
		
		dispatcher.forward(request,response);
		}
}
