package customer;

import java.sql.Connection;
import java.sql.ResultSet;


import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CustomerDButil {

	
	private static boolean isSucces;
	private static Connection con = null; // class only have a one instance provide a global point to it
	private static Statement stmt =  null;
	private static ResultSet rs = null;
	
	
	//Login validate method
	public static List<customer> validate(String name1, String password1)
	{
		ArrayList<customer> customer  = new ArrayList<>(); // Create arraylist object
		
		try
		{
			con = DBConnect.getConnection(); // get database connection
			stmt = con.createStatement();
			String sql = "select * from customer where name ='"+name1+"' and password ='"+password1+"'"; // query for get user details
			rs  = stmt.executeQuery(sql);
			
			while(rs.next())  // get user record from database
			{
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String email = rs.getString(3);
				String phone = rs.getString(4);
				String usern = rs.getString(5);
				String passn = rs.getString(6);
				
				customer cus = new customer(id,name,email,phone,usern,passn); // create customer object and add details to constructor
				customer.add(cus); // pass customer object to arraylist object
			}
			
		}catch(Exception e)
		{
			
		}
		
		
		return customer; // return customer arraylist
	}
	
	
	// insert method with parameters
	public static boolean insertCustomer(String name ,String email,String phone,String username,String password)
	{
		
		boolean isSucces  = false; // declare boolean value
		
	  
		
         try
         {
        		//Class.forName("com.mysql.cj.jdbc.Driver");
        		
        		con = DBConnect.getConnection();
        		Statement stmt  = con.createStatement(); // create a statement
        		
        		String sql  = "insert into customer values(0,'"+name+"','"+email+"','"+phone+"','"+username+"','"+password+"')";
        		
        		int rs = stmt.executeUpdate(sql); // use executeupdate method for update and modify data
        		
        		if(rs > 0) // check query execution is successful or not
        		{
        			isSucces = true;
        		}
        		else
        		{
        			isSucces = false;
        		}
        		
         }
         catch(Exception e) // handle exception
         {
        	 e.printStackTrace();
         }
		
		
		
		
		
		return isSucces; // return boolean value
		
	}
	
	
	//get customer details by id
	public static List<customer> getCustomerDetails(String id)
	{
		int convertID = Integer.parseInt(id);
		ArrayList<customer> cus  =  new ArrayList<>();
		
		
		
		
		try
		{
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from customer where id = '"+convertID+"'";
			rs  = stmt.executeQuery(sql);
			
			while(rs.next())
			{
				int ids       = rs.getInt(1);
				String name   = rs.getString(2);
				String email   = rs.getString(3);
				String phone   = rs.getString(4);
				String username  = rs.getString(5);
				String password  =  rs.getString(6);
				
				customer c  = new customer(ids,name,email,phone,username,password);
				cus.add(c);
				
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return cus;
	}
	
	
	
	//Update method
	
	
	public static boolean updateCustomer(String id,String name,String email,String phone,String username,String password)
	{
		
		try
		{
			con = DBConnect.getConnection(); //get database connection from database file
			stmt = con.createStatement(); 
			String sql = "update customer set name='"+name+"',email='"+email+"',phone='"+phone+"',username='"+username+"',password='"+password+"'"+ "where id='"+id+"'";
			int rs = stmt.executeUpdate(sql); // execute sql query method and assign to return value to rs variable
			
			if(rs > 0)
			{
				
				isSucces = true;  // check whether update is succesfull
			}
			else
			{
				isSucces = false;
			}
			
			
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		return isSucces;  // return boolean value
		
	}
	
	//delete method 
	public static boolean removecustomer(String id )
	{
		
		int conID = Integer.parseInt(id);  //convert String id into int data type using wrapper class
		
		try
		{
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "delete from customer where id='"+conID+"' "; // delete query 
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0)
			{
				isSucces = false;
			}
			else
			{
				isSucces = true;
			}
			
		}
		catch(Exception e)
		{
			
		}
		
		return isSucces;  //return boolean value
		
	}
	
	
	
	
}
