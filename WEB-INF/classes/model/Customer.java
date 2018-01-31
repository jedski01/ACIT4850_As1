package model;

public class Customer{

    String lastName;
    String firstName;
    String address;
    String phone;
    String email;

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

    
}