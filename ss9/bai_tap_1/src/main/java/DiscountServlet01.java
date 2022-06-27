import jdk.nashorn.internal.ir.RuntimeNode;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DiscountServlet01", urlPatterns = "/discount")
public class DiscountServlet01 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int price = Integer.parseInt(request.getParameter("price"));
        int discount =Integer.parseInt(request.getParameter("discount")) ;
        String description =request.getParameter("description");

        double discountAmount = price * discount * 0.01;
        double discountPrice = price - discountAmount;

        request.setAttribute("discountAmount",discountAmount);
        request.setAttribute("discountPrice", discountPrice);
        request.setAttribute("description", description);
        request.setAttribute("discount", discount);
        request.setAttribute("price", price);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("display.jsp");
        requestDispatcher.forward(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
