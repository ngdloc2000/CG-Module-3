package controller;

import dao.book.BookDAO;
import dao.card.CardDAO;
import dao.student.StudentDAO;
import model.Book;
import model.Card;
import model.Student;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet(name = "BookServlet", value = "/books")
public class BookServlet extends HttpServlet {
    BookDAO bookDAO = new BookDAO();
    StudentDAO studentDAO = new StudentDAO();
    CardDAO cardDAO = new CardDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "borrow":
                showBorrowForm(request, response);
                break;
            default:
                listBook(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "borrow":
                borrowBook(request, response);
                break;
            default:
                break;
        }
    }

    private void listBook(HttpServletRequest request, HttpServletResponse response) {
        List<Book> bookList = this.bookDAO.findAll();
        request.setAttribute("bookList", bookList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("book/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showBorrowForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idBook = Integer.parseInt(request.getParameter("idBook"));
        String borrowDate = LocalDate.now().toString();
        Book book = bookDAO.findById(idBook);
        List<Student> studentList = studentDAO.findAll();
        request.setAttribute("studentList", studentList);
        request.setAttribute("book", book);
        request.setAttribute("borrowDate", borrowDate);
        RequestDispatcher dispatcher = request.getRequestDispatcher("book/borrow.jsp");
        dispatcher.forward(request, response);
    }

    private void borrowBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idBook = Integer.parseInt(request.getParameter("idBook"));
        String borrowDate = request.getParameter("borrowDate");
        String payDate = request.getParameter("payDate");
        int idStudent = Integer.parseInt(request.getParameter("idStudent"));
        Student student = studentDAO.findById(idStudent);
        Book book = bookDAO.findById(idBook);
        book.setQuantity(book.getQuantity()-1);
        Card card = new Card(book, student, false, borrowDate, payDate);
        cardDAO.insertCart(card);
        bookDAO.update(idBook,book);
        response.sendRedirect("/books");
    }
}
