package controller.servlets;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import controller.dbconnection.DbConnection;
import model.Customer;
import model.product_detail;
import resources.MyConstants;

/**
 * Servlet implementation class addProduct
 */

@WebServlet(asyncSupported = true, urlPatterns = { "/addProduct" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50)
public class addProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addProduct() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String product_name = request.getParameter("pname");
		String cost = request.getParameter("cost");
		String brand = request.getParameter("brand");
		String description = request.getParameter("description");
		String  product_category = request.getParameter("category");
		String  cloth = request.getParameter("clothing");
		String  quantity = request.getParameter("quantity");
		Part imagePart = request.getPart("image1");	
		
		
		String savePath = request.getServletContext().getRealPath("/")+"uploads/product/";
	    String fileName = product_name+"_"+imagePart.getSubmittedFileName();
	    product_detail producta = new product_detail(product_name, cost, brand, description, product_category, cloth, quantity, imagePart);
	    if(!fileName.isEmpty() && fileName != null) {
	    	Files.copy(imagePart.getInputStream(), Paths.get(savePath + fileName), StandardCopyOption.REPLACE_EXISTING);
	    }
	    HttpSession session = request.getSession();
		session.setAttribute("user", product_name);
		//setting session to expiry in 30 mins
		session.setMaxInactiveInterval(30*60);

		Cookie userName = new Cookie("user", product_name);
		userName.setMaxAge(30*60);
		response.addCookie(userName);
	    
		DbConnection con = new DbConnection();
		int result1 = con.insertProduct(MyConstants.INSERT_PRODUCT, producta);
		
		if(result1 == 1) {
			request.setAttribute("registerMessage", "Successfully Registered");
			request.getRequestDispatcher("/pages/view.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher("/pages/view.jsp").forward(request, response);
		}
		
	}
	

}
