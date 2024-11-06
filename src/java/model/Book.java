/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Tran Phong Hai - CE180803
 */
public class Book {
    private String book_id;
    private String title;
    private String author;
    private int year_published;
    private int quantity_available;
    private int total_quantity;
    private String image_url;

    public Book() {
    }

    public Book(String book_id, String title, String author, int year_published, int quantity_available, int total_quantity, String image_url) {
        this.book_id = book_id;
        this.title = title;
        this.author = author;
        this.year_published = year_published;
        this.quantity_available = quantity_available;
        this.total_quantity = total_quantity;
        this.image_url = image_url;
    }

    public String getBook_id() {
        return book_id;
    }

    public void setBook_id(String book_id) {
        this.book_id = book_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public int getYear_published() {
        return year_published;
    }

    public void setYear_published(int year_published) {
        this.year_published = year_published;
    }

    public int getQuantity_available() {
        return quantity_available;
    }

    public void setQuantity_available(int quantity_available) {
        this.quantity_available = quantity_available;
    }

    public int getTotal_quantity() {
        return total_quantity;
    }

    public void setTotal_quantity(int total_quantity) {
        this.total_quantity = total_quantity;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }

    @Override
    public String toString() {
        return "Book{" + "book_id=" + book_id + ", title=" + title + ", author=" + author + ", year_published=" + year_published + ", quantity_available=" + quantity_available + ", total_quantity=" + total_quantity + ", image_url=" + image_url + '}';
    }
    
    
}
