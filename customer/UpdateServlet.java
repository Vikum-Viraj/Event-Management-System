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
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      String id     = request.getParameter("cusid");
      String name   = request.getParameter("name");
      String email  = request.getParameter("email");
      String phone  = request.getParameter("phone");
      String userN  = request.getParameter("uname");
      String passw  = request.getParameter("pass");
      
      boolean isTrue;
      
      isTrue = CustomerDButil.updateCustomer(id, name, email, phone, userN, passw); // call update method 
      
	  if(isTrue == true) // if update is successfull again rediect to useraccount page
	  {
		  List<customer> customer = CustomerDButil.getCustomerDetails(id); // get updated details calling getcustomerdetails method from database
		  request.setAttribute("customer", customer);
		  
		  RequestDispatcher dis = request.getRequestDispatcher("useraccount.jsp"); 
		  dis.forward(request, response);
	  }
	  else  
	  {
		  List<customer> customer = CustomerDButil.getCustomerDetails(id);
		  request.setAttribute("customer", customer); // set a attribute name
		  
		  RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");// if unsuccessfull redirect to unsuccess page
		  dis.forward(request, response);
	  }
		
	}
	
	

}
