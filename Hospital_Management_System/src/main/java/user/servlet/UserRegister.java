package user.servlet;

import dao.UserDao;
import db.DBConnect;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "UserRegister", value = "/UserRegister")
public class UserRegister extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        try
        {
            String fullname = req.getParameter("fullname");
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            System.out.println(fullname + " " + email + " " + password);

            User u = new User(fullname, email, password);

            UserDao dao = new UserDao(DBConnect.getCon());

            HttpSession session = req.getSession();

            boolean f = dao.register(u);

            if (f)
            {
                session.setAttribute("SuccessMsg", "Register Successfully");
                resp.sendRedirect("signup.jsp");
            }
            else
            {
                session.setAttribute("errorMsg", "Registration Failed, Something is wrong on server");
                resp.sendRedirect("signup.jsp");

            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
