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
import uuu.vgb.entity.OwnerQa;
import uuu.vgb.entity.Product;
import uuu.vgb.entity.VGBException;
import uuu.vgb.service.CustomerService;
import uuu.vgb.service.OwnerQaService;
import uuu.vgb.service.ProductSelectService;

/**
 * Servlet implementation class QAowner
 */
@WebServlet({"/ownerBy/QaInert.do" })
public class QAownerServervler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QAownerServervler() {
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
		String question= request.getParameter("question");
		String owner= request.getParameter("owner");
		String user= request.getParameter("user");
		//2.若無誤，呼叫商業邏輯
				if(errors.isEmpty()) {
					OwnerQa o = new OwnerQa();
					Customer c= new Customer();
					Customer c2= new Customer();
					try {
						o.setOwnerQA(question);
						c.setId(owner);
						c2.setId(user);
						o.setOwnerId(c);
						o.setCustomerId(c2);
						
						OwnerQaService service = new OwnerQaService();
						service.register(o);
						//3.1forward (內部轉交)to註冊成功畫面
						
						
						
						
						
					
						response.sendRedirect("ownerQA.jsp?buyIDOwner="+owner);
						
						
						
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
							request.getRequestDispatcher("ownerQA.jsp?buyIDOwner=<"+owner);
					
					dispatcher.forward(request,response);
					}

				
			}
