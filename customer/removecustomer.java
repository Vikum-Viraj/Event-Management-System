package customer;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class removecustomer
 */
@WebServlet("/removecustomer")
public class removecustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //get id
		String id = request.getParameter("cusid");
		
		boolean isTRue;
		
		isTRue = CustomerDButil.removecustomer(id); // return boolean value if delete is successful
		// when successfully delete user account redirect to create user page
		if(isTRue == true)
		{
			RequestDispatcher dispatch = request.getRequestDispatcher("Register.jsp");
			dispatch.forward(request, response);
			
		}
		else
		{
			
		    
			
			List<customer> customer = CustomerDButil.getCustomerDetails(id);
			request.setAttribute("customer", customer);
			

			RequestDispatcher dispatch = request.getRequestDispatcher("Register.jsp");
			dispatch.forward(request, response);
		}
		
	}

}
