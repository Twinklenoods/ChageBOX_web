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
import uuu.vgb.entity.WantChange;
import uuu.vgb.service.CustomerService;
import uuu.vgb.service.ProductService;
import uuu.vgb.service.WantChangeService;

/**
 * Servlet implementation class changeProductServervler
 */
@WebServlet("/member/mychange/delet.do")
public class DeChangeServervler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public  DeChangeServervler() {
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
		
		int ChangesID=Integer.parseInt(request.getParameter("ChangesID"));
	
			
	

		
		
		
		//2.若無誤，呼叫商業邏輯
		if(errors.isEmpty()) {
			WantChangeService service =new WantChangeService();
			try {
				WantChange w = new WantChange();
				w.setChangesID(ChangesID);
				
				w.setCheack(3);
				service.update(w);
				
				//3.1forward (內部轉交)to註冊成功畫面
				
				RequestDispatcher dispatcher = 
						request.getRequestDispatcher("QAup.jsp");
				
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
				request.getRequestDispatcher("QAup.jsp");
		
		dispatcher.forward(request,response);
}
	}