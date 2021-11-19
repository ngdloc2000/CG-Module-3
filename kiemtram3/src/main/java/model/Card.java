package model;

public class Card {
    private int id;
    private int idBook;
    private Book book;
    private int idStudent;
    private Student student;
    private boolean status;
    private String borrowedDate;
    private String payDate;

    public Card(int id, Book book, Student student, boolean status, String borrowedDate, String payDate) {
        this.id = id;
        this.book = book;
        this.student = student;
        this.status = status;
        this.borrowedDate = borrowedDate;
        this.payDate = payDate;
    }

    public Card(int id, int idBook, int idStudent, boolean status, String borrowedDate, String payDate) {
        this.id = id;
        this.idBook = idBook;
        this.idStudent = idStudent;
        this.status = status;
        this.borrowedDate = borrowedDate;
        this.payDate = payDate;
    }

    public Card(Book book, Student student, boolean status, String borrowedDate, String payDate) {
        this.book = book;
        this.student = student;
        this.status = status;
        this.borrowedDate = borrowedDate;
        this.payDate = payDate;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Card(int idBook, int idStudent, boolean status, String borrowedDate, String payDate) {
        this.idBook = idBook;
        this.idStudent = idStudent;
        this.status = status;
        this.borrowedDate = borrowedDate;
        this.payDate = payDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdBook() {
        return idBook;
    }

    public void setIdBook(int idBook) {
        this.idBook = idBook;
    }

    public int getIdStudent() {
        return idStudent;
    }

    public void setIdStudent(int idStudent) {
        this.idStudent = idStudent;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getBorrowedDate() {
        return borrowedDate;
    }

    public void setBorrowedDate(String borrowedDate) {
        this.borrowedDate = borrowedDate;
    }

    public String getPayDate() {
        return payDate;
    }

    public void setPayDate(String payDate) {
        this.payDate = payDate;
    }
}
