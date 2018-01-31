package database;
import  java.sql.*;
import java.util.*;

public class Database{

    private Statement stmt = null;
    private Connection dbconn = null;

    private String result   = "OK";
    private String query    = "";
    private String dburl    = "jdbc:mysql://localhost/wacko";
    private String dbdriver = "com.mysql.jdbc.Driver" ;

    public Database(){}
    
	
    //more methods  ...


	// You will need to add some parameters
    public String saveCustomer(String lName, String fName,String phone, String email, String address){ 

        result = connect();

        query  = " insert into Customer (lastName,firstName,phone,address,email)";
        query += " values (";
        query += "'" + lName + "',";
        query += "'" + fName + "',";
        query += "'" + phone + "',";
        query += "'" + address + "',";
        query += "'" + email + "')";
        try{
            stmt = dbconn.createStatement();
            stmt.execute(query);
        }
        catch (SQLException e){   
            result  = " Save Customer:  Error processing the SQL!";
            result += " <br/>" +  e.toString();
        }
        finally{
            close();
        }
        return result;
    }
    
	

/*--------------------------------Private ---------------------------------------*/

private String connect(){

   
    try {
        Class.forName(dbdriver).newInstance();
        System.out.println("Connecting to database");
        dbconn=(Connection) DriverManager.getConnection(dburl, "root", "root");
        System.out.println("Connected!");
    } 
    catch (Exception e) {
        System.out.println("not connected");
    }
    
    
	return result;
  }

  private String close(){
        try
        {   if (dbconn != null)
            {
			stmt.close();
            dbconn.close(); 
            }
        }
        catch (SQLException e)
        {   result  = "Error in closing connection.";
            result += " <br/>" +  e.toString();
        }
		return result;
    }

  }
