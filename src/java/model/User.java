/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;
import java.text.SimpleDateFormat;

/**
 *
 * @author DELL-Laptop
 */
public class User {
    private int id;
    private String name;
    private String password;
    private String email;
    private String role;
    private Date createAt;
    private Date updateAt;

    public User() {
    }

    public User(String name, String password, String email, String role) {
        this.name = name;
        this.password = password;
        this.email = email;
        this.role = role;
    }

    public User(String name, String password, String email, String role, Date createAt, Date updateAt) {
        this.name = name;
        this.password = password;
        this.email = email;
        this.role = role;
        this.createAt = createAt;
        this.updateAt = updateAt;
    }

    public User(int id, String name, String password, String email) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.email = email;
    }

 

    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }
    public void setUpdateAt(Date updateAt) {
        this.updateAt = updateAt;
    }

 
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
    public String getCreateAt() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return dateFormat.format(createAt);
    }

    public String getUpdateAt() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return dateFormat.format(updateAt);
    }
    
}
