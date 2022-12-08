package paymentdao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import paymentmodel.payment;


public class PaymentDAO {

	private static Connection con = null;
 
	//declare sql queries as static variables
	private static final String INSERT_payment = "INSERT INTO payment" + "  (cardholder, cardnumber, cardtype,cardcvv,expiredate,amount) VALUES "+ " (?, ?, ?, ?, ?, ?);";

	
	//private static final String selectpaymentid  = "select id,cardholder,cardnumber,cardtype,cardcvv,expiredate,amount where id =?";
	private static final String selectallpayment = "select * from payment";
	private static final String updateuser       = "update payment set cardholder = ?,cardnumber = ?,cardtype = ?,cardcvv = ?,expiredate = ?,amount = ? where id =?";
	private static final String deletepayment    = "delete from payment where id = ?;";
	
	// method for insert data insert
	public void insertPayment(payment pays) throws SQLException {
		System.out.println(INSERT_payment);
		// try-with-resource statement will auto close the connection.
		try (Connection connection = DBConnect.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_payment)) {
			preparedStatement.setString(1, pays.getCardHolder());
			preparedStatement.setString(2, pays.getCardNo());
			preparedStatement.setString(3, pays.getCardType());
			preparedStatement.setString(4, pays.getCardCvv());
			preparedStatement.setString(5, pays.getExpireDate());
			preparedStatement.setString(6, pays.getAmount());
			
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate(); // execute insert method
		} catch (SQLException e) {
			printSQLException(e);
		}
	}

		
	//method for get payment details by id 
	
	public  payment getpaymentmethodsbyid(int id)
	{
		payment paymnt = null; // create a payment object and assign to null
		
		
		try(Connection connection  = DBConnect.getConnection();
				
				PreparedStatement preparedStatement  = connection.prepareStatement("select id,cardholder,cardnumber,cardtype,cardcvv,expiredate,amount from payment where id =?");)
		{
			preparedStatement.setInt(1, id);
			
			System.out.println(preparedStatement);
			
			ResultSet rs  = preparedStatement.executeQuery();
			// get payment details from payment table using while loop
			while(rs.next())
			{
				
				String cardholder = rs.getString(2);
				String cardnum    = rs.getString(3);
				String cardtype   = rs.getString(4);
				String cardcvv    = rs.getString(5);
				String expire     = rs.getString(6);
				String amount     = rs.getString(7);
				
				paymnt  = new payment(id,cardholder,cardnum,cardtype,cardcvv,expire,amount);
				// create new object from payment class and and assign to parameterized constructor with id  
			}
			
		} // catch SQL Exception and return
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		return paymnt; //return payment object
	}
	
	// Update payment details method 
	public boolean updatepayment(payment paym) throws SQLException
	{
		boolean updatesuccess;
		
     try(Connection connection  = DBConnect.getConnection(); // getConnection from DBConnnect file
				
				PreparedStatement statement  = connection.prepareStatement(updateuser);)
		{
    	    
    	    statement.setString(1, paym.getCardHolder()); // call getters by payment object
    	    statement.setString(2, paym.getCardNo());
    	    statement.setString(3, paym.getCardType());
    	    statement.setString(4, paym.getCardCvv());
    	    statement.setString(5, paym.getExpireDate());
    	    statement.setString(6, paym.getAmount());
    	    statement.setInt(7, paym.getId());
		
    	    updatesuccess = statement.executeUpdate() > 0; // check whether update is success or not
    	    
	    }
	
     return updatesuccess; // return boolean value
	
	}
	
	// delete payment methods by id
	public boolean deletepayment(int id) throws SQLException
	{
		
		boolean rowdeletd; //declare boolean variable
		
		try(Connection connection = DBConnect.getConnection();
				PreparedStatement preparestatement = connection.prepareStatement(deletepayment);)
		{
			preparestatement.setInt(1, id);
			
			rowdeletd = preparestatement.executeUpdate() >0; //Check whether deleted successfully or not
		}
		
		
		return rowdeletd; // return boolean value
	}
	
	// get all payment methods from database 
	public List<payment> selectAllpays() {

		// using try-with-resources to avoid closing resources 
		List<payment> payes = new ArrayList<>();
		// Step 1: Establishing a Connection
		try (Connection connection = DBConnect.getConnection();

				// Step 2:Create a statement using connection object
			PreparedStatement preparedStatement = connection.prepareStatement(selectallpayment);) {
			
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				
				int     id            =  rs.getInt("id");
				String cardholder     =  rs.getString("cardholder");
				String cardnumber     =  rs.getString("cardnumber");
				String cardtype       =  rs.getString("cardtype");
				String cardcvv        =  rs.getString("cardcvv");
				String expiredate     =  rs.getString("expiredate");
				String nic            =  rs.getString("amount");
				
				
				// add data to the pays list
				payes.add(new payment(id,cardholder,cardnumber,cardtype,cardcvv,expiredate,nic)); 
				
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return payes; // return payment  list
	}
	
    //handle SQL Exception
	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			
			if (e instanceof SQLException) {
				
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				
				System.err.println("Message: " + e.getMessage());
				
				Throwable t = ex.getCause();
				
				while (t != null) {
					System.out.println("Cause: " + t);
					
					t = t.getCause();
					
				}
			}
		}
	}
	
	
	
	
}
	
	