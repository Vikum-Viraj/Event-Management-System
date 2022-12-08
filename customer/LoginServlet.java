package customer;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

 
@WebServlet("/LoginServlet1")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		String name3 = request.getParameter("username");  // get username from user
		String password3 = request.getParameter("passowrd"); // get password from user
		
		
		
	
		try {
			List<customer> customer = CustomerDButil.validate(name3, password3); // call validate method in CustomerDButil class assign to customer list object
			request.setAttribute("customer",customer); // pass customer object and set a attribute name
			
			if(customer.isEmpty())
			{
				response.sendRedirect("Login.jsp?id=error");	
			}else {
				RequestDispatcher dis = request.getRequestDispatcher("useraccount.jsp");
				dis.forward(request, response);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
			// redirect to useraccount page

           
		
		
	}

}
