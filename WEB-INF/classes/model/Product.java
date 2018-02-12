package model;

public class Product{

    int productId;
    String type;
    String color;
    String size;
    float price;

    public Product(int productId, String type, String color, 
                    String size, float price) 
    {
        this.productId = productId;
        this.type = type;
        this.color = color;
        this.size = size;
        this.price = price;
    }

    public int getProductId(){
        return this.productId;
    }

    public String getType() {
        return this.type;
    }

    public String getColor() {
        return this.color;
    }

    public String getSize() {
        return this.size;
    }

    public float getPrice() {
        return this.price;
    }
}