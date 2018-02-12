package model;

import database.Database;
import java.util.ArrayList;

public class Catalog{

    ArrayList<Product> catalog;
    String[] headers;

    public Catalog(){

        catalog = new ArrayList<Product>();

        updateCatalog();
    }

    public void updateCatalog() {
        
        Database db = new Database();
        String stringified = db.getProductInfo();   
        
        String[] rows = stringified.split("\n");

        //set the headers
        headers = rows[0].split(",");

        for(int row = 1; row < rows.length ; row++) {
            System.out.println(rows[row]);
            String[] items = rows[row].split(",");

            int productId = (int)Float.parseFloat(items[0]);
            String type = items[1];
            String color = items[2];
            String size = items[3];
            float price = Float.parseFloat(items[4]);

            Product pr = new Product(productId, type, color, size, price);
            catalog.add(pr);
        }
    }

    public ArrayList<Product> getProducts(){
        return catalog;
    }

    public String[] getHeaders() {
        return headers;
    }

    public Product getProductById(int id) {

        for(Product pr : catalog) {
            if(pr.getProductId() == id) {
                return pr;
            }
        }        
        return null;
    }

}