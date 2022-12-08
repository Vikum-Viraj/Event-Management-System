package customer;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

 
@WebServlet("/CustomerRegister1")
public class CustomerRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");  // get user input values from form
		String email = request.getParameter("email");
		String phone  = request.getParameter("phone");
		String username = request.getParameter("userid"); 
		String passwd  = request.getParameter("passwd");
		
        boolean isTRue; // declare boolean value
		
        isTRue  = CustomerDButil.insertCustomer(name, email, phone, username, passwd); // call insertcustomer method where in DButil class
		
        //check data insert is successful or not if success redirect to Login page 
        if(isTRue == true )
        {
        	RequestDispatcher dis = request.getRequestDispatcher("Login.jsp");
        	dis.forward(request, response);


        }
        else   // if unsuccessful redirect to unsucess page
        {
        	RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
        	dis.forward(request, response);
        }
	}

}
