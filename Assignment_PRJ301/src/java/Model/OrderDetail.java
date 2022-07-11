/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.text.DecimalFormat;

/**
 *
 * @author ROG STRIX
 */
public class OrderDetail {
    private String dogID;
    private String sex;
    private int quantity;
    private float total;
    
    DecimalFormat df = new DecimalFormat("#.00");

    public OrderDetail() {
    }

    public OrderDetail(String dogID, String sex, int quantity, float total) {
        this.dogID = dogID;
        this.sex = sex;
        this.quantity = quantity;
        this.total = Float.parseFloat(df.format(total));
    }

    public String getDogID() {
        return dogID;
    }

    public void setDogID(String dogID) {
        this.dogID = dogID;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = Float.parseFloat(df.format(total));
    }
}
