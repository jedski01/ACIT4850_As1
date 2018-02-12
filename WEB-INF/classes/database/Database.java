package database;
import  java.sql.*;
import java.util.*;

public class Database{

    private Statement stmt = null;
    private Connection dbconn = null;

    private String result   = "OK";
    private String query    = "";
    private String dburl    = "";
    private String dbdriver = "net.ucanaccess.jdbc.UcanaccessDriver" ;

    public Database(){
        //since we're using ucanaccess, it needs absolute file path forthe db.
        //get the file path of this class, wacko.accdb needs to be on
        // the same path as the as this class
        String path = this.getClass().getResource(".").getPath();
        path = path.substring(1).replace("%20", " ");
        System.out.println("The path is" + path);
        dburl = "jdbc:ucanaccess://"+path+"Wacko.accdb";
    }
    
	
    //more methods  ...


	// You will need to add some parameters
    public String saveCustomer(String lName, String fName,String phone, String email, String address){ 

        System.out.println("Saving Customer");
        System.out.println(System.getProperty("user.dir"));
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
    
    public int getCustomerId(String lastName, String firstName,String phone) {

        int result = -1;

        connect();

        query = String.format("select customerId from customer where lastname='%s' and firstName='%s' and phone='%s'", lastName, firstName, phone);

        try {
            stmt = dbconn.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            if(rs.next()){
                result = rs.getInt(1);
            } else {
                return -1;
            }
            rs.close();
            
        }
        catch(SQLException e) {
            System.out.println(e.toString());
            return result;
        }
        finally {
            close();
        }
        return result;
    }

    public String getProductInfo() {
        String result = "";

        connect();

        String query = "select * from ProductCatalog";

        try {
            stmt = dbconn.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            ResultSetMetaData  metadata = rs.getMetaData();
            
            int cols = metadata.getColumnCount();

            //add the headers
            for(int i = 1 ; i <= cols ; i++) {
                result += metadata.getColumnLabel(i) + ",";
            }
            result+="\n";

             //add the contents afterwards
             while(rs.next()) {
                
                for(int i = 1; i <= cols ; i++) {
                    result += rs.getObject(i).toString()+",";
                }
                result+="\n";
            }
           
        }
        catch(SQLException e) {
            System.out.println("Error getting products");
            System.out.println(e.toString());
        }
        finally {
            close();
        }
        return result;
    }
	

/*--------------------------------Private ---------------------------------------*/

private String connect(){

   
    try {
        Class.forName(dbdriver).newInstance();
        System.out.println("Connecting to database");
        dbconn=(Connection) DriverManager.getConnection(dburl, "", "");
        System.out.println("Connected!");
    } 
    catch (Exception e) {
        System.out.println("not connected");
        System.out.println(e.toString());
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
