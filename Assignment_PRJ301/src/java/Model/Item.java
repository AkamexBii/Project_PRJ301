/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.io.Serializable;
import java.text.DecimalFormat;

/**
 *
 * @author ROG STRIX
 */
public class Item implements Serializable{
    private Account account;
    private Product product;
    private String colour;
    private String size;
    private int quantity;
    private float price;
    
    DecimalFormat df = new DecimalFormat("#.00");

    public Item() {
    }

    public Item(Account account, Product product, String colour, String size, int quantity, float price) {
        this.account = account;
        this.product = product;
        this.colour = colour;
        this.size = size;
        this.quantity = quantity;
        this.price = price;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public String getColour() {
        return colour;
    }

    public void setColour(String colour) {
        this.colour = colour;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public DecimalFormat getDf() {
        return df;
    }

    public void setDf(DecimalFormat df) {
        this.df = df;
    }
    
   
    @Override
    public String toString() {
        return "Item{" + product + ", size=" + size + ", quantity=" + quantity + ", price=" + price + '}';
    }
}
