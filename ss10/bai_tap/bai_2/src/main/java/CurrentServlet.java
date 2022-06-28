import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.io.IOException;

@WebServlet(name = "CurrentServlet", urlPatterns = "/")
public class CurrentServlet extends HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

            float firstOperand = Integer.parseInt(request.getParameter("first-operand"));
            float secondOperand = Integer.parseInt(request.getParameter("second-operand"));
            char operator = request.getParameter("operator").charAt(0);
            float result = calculator(firstOperand, secondOperand, operator);

            request.setAttribute("firstOperand", firstOperand);
            request.setAttribute("secondOperand", secondOperand);
            request.setAttribute("operator", operator);
            request.setAttribute("result", result);

        request.getRequestDispatcher("display.jsp").forward(request, response);
    }

    public float calculator(float firstOperand, float secondOperand, char operator) {
        switch (operator) {
            case '+':
                return firstOperand + secondOperand;
            case '-':
                return firstOperand - secondOperand;
            case '*':
                return firstOperand * secondOperand;
            case '/':
                if (secondOperand != 0)
                    return firstOperand / secondOperand;
                else
                    throw new RuntimeException("Khong the chia cho 0");
            default:
                throw new RuntimeException("Khong hop le");
        }
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {


    }
}
