package model;

import database.Database;

public class Customer{

    String lastName;
    String firstName;
    String address;
    String phone;
    String email;
    int id;

    Database db = new Database();

    public void setLastName(String value){ 
        lastName = value;
    }

    public void setFirstName(String value) {
        firstName = value;
    }

    public void setAddress(String value){ 
        address = value;
    }

    public void setPhone(String value) {
        phone = value;
    }

    public void setEmail(String value){ 
        email = value;
    }

    public String getLastName() {
        return lastName;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getAddress() {
        return address;
    }

    public String getPhone() {
        return phone;
    }

    public String getEmail() {
        return email;
    }

    public String save() {
        
        String result = db.saveCustomer(lastName, firstName, phone, email, address);
        
        return result;    
    }

    public void setId() {
        
        int result = db.getCustomerId(lastName, firstName, phone);
        this.id = result;
    }

    public int getId() {
        return this.id;
    }

    
}