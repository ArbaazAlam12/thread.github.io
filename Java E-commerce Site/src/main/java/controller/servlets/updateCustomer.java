package controller.servlets;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import controller.dbconnection.DbConnection;
import model.Customer;
import resources.MyConstants;

/**
 * Servlet implementation class updateCustomer
 */
@WebServlet("/updateCustomer")
public class updateCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateCustomer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String username = request.getParameter("username");
		String  cotanct_number = request.getParameter("num");
		String  password = request.getParameter("password");
		String  role = request.getParameter("role");
		Part imagePart = request.getPart("image");	
		
	    String savePath = request.getServletContext().getRealPath("/")+"uploads/users/";
	    String fileName = username+"_"+imagePart.getSubmittedFileName();
		Customer userModel = new Customer(name, username, cotanct_number, password, role, imagePart);

	    if(!fileName.isEmpty() && fileName != null) {
	    	Files.copy(imagePart.getInputStream(), Paths.get(savePath + fileName), StandardCopyOption.REPLACE_EXISTING);
	    }
	    	
//    		imagePart.write(savePath + fileName);
		
		DbConnection con = new DbConnection();
		int result = con.updateCus(MyConstants.UPDATE_USER_INFO, userModel);
		if(result == 1) {
			request.setAttribute("registerMessage", "Successfully Registered");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}else if(result == -1) {
			request.setAttribute("registerMessage", "User Already Exists");
			request.getRequestDispatcher("/pages/register.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher("/pages/register.jsp").forward(request, response);
		}
		
		doGet(request, response);
	}

}
