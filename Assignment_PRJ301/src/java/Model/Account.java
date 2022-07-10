/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author ROG STRIX
 */
public class Account {

    private int accountID;
    private String username, password, role, email;

    public Account() {
    }

    public Account(int accountID, String username, String password, String role, String email) {
        this.accountID = accountID;
        this.username = username;
        this.password = password;
        this.role = role;
        this.email = email;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "Account{" + "accountID=" + accountID + ", username=" + username + ", password=" + password + ", role=" + role + ", email=" + email + '}';
    }
}
