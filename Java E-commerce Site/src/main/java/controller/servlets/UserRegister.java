package controller.servlets;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import controller.dbconnection.DbConnection;
import model.Customer;
import resources.MyConstants;


@WebServlet(asyncSupported = true, urlPatterns = { "/UserRegister" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
	maxFileSize = 1024 * 1024 * 10, // 10MB
	maxRequestSize = 1024 * 1024 * 50)
public class UserRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
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
		int result = con.registerUser(MyConstants.USER_REGISTER, userModel);
		if(result == 1) {
			request.setAttribute("registerMessage", "Successfully Registered");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}else if(result == -1) {
			request.setAttribute("registerMessage", "User Already Exists");
			request.getRequestDispatcher("/pages/register.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher("/pages/register.jsp").forward(request, response);
		}
		
	}

}
