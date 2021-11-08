import model.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ServletTest", value = "/servlet")
public class Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList = new ArrayList<>();
        Customer c1 = new Customer("Mai Văn Hoàn", "1983-08-20", "Hà Nội");
        Customer c2 = new Customer("Nguyễn Văn Nam", "1983-08-21", "Bắc Giang");
        Customer c3 = new Customer("Nguyễn Thái Hoà", "1983-08-22", "Nam Định");
        Customer c4 = new Customer("Trần Đăng Khoa", "1983-08-20", "Hà Tây");

        customerList.add(c1);
        customerList.add(c2);
        customerList.add(c3);
        customerList.add(c4);

        request.setAttribute("list",customerList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("test.jsp");
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}