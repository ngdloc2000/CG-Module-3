package controller;

import dao.book.BookDAO;
import dao.card.CardDAO;
import model.Book;
import model.Card;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CartServlet", value = "/cards")
public class CartServlet extends HttpServlet {
    CardDAO cardDAO = new CardDAO();
    BookDAO bookDAO = new BookDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {

            default:
                listCard(request, response);
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
            case "pay":
                payBook(request, response);
                break;
            default:
                break;
        }
    }

    private void listCard(HttpServletRequest request, HttpServletResponse response) {
        List<Card> cardList = this.cardDAO.findAll();
        request.setAttribute("cardList", cardList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("card/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void payBook(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int idCard = Integer.parseInt(request.getParameter("idCard"));
        Card card = cardDAO.findCardById(idCard);
        card.setStatus(true);
        int idBook = card.getIdBook();
        Book book = bookDAO.findById(idBook);
        book.setQuantity(book.getQuantity() + 1);
        cardDAO.update(idCard, card);
        bookDAO.update(idBook, book);
        response.sendRedirect("/cards");
    }
}
