package paymentweb;



import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import paymentdao.PaymentDAO;
import paymentmodel.payment;


/**
 * Servlet implementation class Paymentupdatedelete
 */
@WebServlet("/")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private PaymentDAO paynow;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentServlet() {
        super();
        this.paynow  = new PaymentDAO();
        
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String action = request.getServletPath();

		switch (action) {
		case "/new":
			showNewForm(request,response);
			break;
		case "/insert":
			try {
				insertPayment(request,response);
			} catch (SQLException e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			} catch (IOException e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			}
			
			break;
		case "/delete":
			try {
				deletepayment(request,response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "/edit":
			try {
				showUpdateForm(request,response);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (ServletException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			break;
		case "/update":
			
			try {
				updatepayment(request,response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		default:
			try {
				selectAllpays(request,response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		}
		
		
	}
		
	//delete servlet
	private void deletepayment(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		paynow.deletepayment(id);
		response.sendRedirect("list");

	}
	
	//insert servlet
	private void insertPayment(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		String cardhol = request.getParameter("holdername");
		String cardno  = request.getParameter("cardnumber");
		String cardtype = request.getParameter("cardtype");
		String cardcv   = request.getParameter("cardcvv");
		String expdate  = request.getParameter("expdate");
		String amnt     = request.getParameter("nic");
		
		
		
		payment newpay = new payment(cardhol,cardno,cardtype,cardcv,expdate,amnt);
		paynow.insertPayment(newpay);
		response.sendRedirect("list");
	}
	
	
	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("pay-form.jsp");
		dispatcher.forward(request, response);
	}

	private void showUpdateForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		payment differpayment = paynow.getpaymentmethodsbyid(id);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("pay-form.jsp");
		
		request.setAttribute("paysdoc", differpayment);
		dispatcher.forward(request, response);

	}
	
	//update servlet
	private void updatepayment(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		
		
        String cardhol  = request.getParameter("holdername");
        String cardnum  = request.getParameter("cardnumber");
        String cardtyp  = request.getParameter("cardtype");
        String cardcv   = request.getParameter("cardcvv");
        String cardexp  = request.getParameter("expdate");
        String cardamt  = request.getParameter("nic");
        
		payment pays = new payment(id,cardhol,cardnum,cardtyp,cardcv,cardexp,cardamt);
		paynow.updatepayment(pays);
		response.sendRedirect("list");
	}
	
	
     //select all payments servlet
	private void selectAllpays(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<payment> paylist = paynow.selectAllpays();
		
		System.out.println(paylist.get(1).getCardNo());
		
		request.setAttribute("paylist", paylist);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("pay-list.jsp");
		dispatcher.forward(request, response);
	}
	
	
	
	
	
	
	
	
	
	
	}







