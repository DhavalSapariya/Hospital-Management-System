package user.servlet;

import dao.UserDao;
import db.DBConnect;
import entity.User;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;

@WebServlet(name = "UserLogin", value = "/UserLogin")
public class UserLogin extends HttpServlet
{
    @Override
    protected void doPost(javax.servlet.http.HttpServletRequest req, javax.servlet.http.HttpServletResponse resp) throws javax.servlet.ServletException, java.io.IOException
    {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        HttpSession session = req.getSession();

        UserDao dao = new UserDao(DBConnect.getCon());
        User user = dao.login(email, password);

        if(user!=null)
        {
            session.setAttribute("userObj", user);
            resp.sendRedirect("index.jsp");
        }
        else
        {
            session.setAttribute("errorMsg", "invalid email & password");
            resp.sendRedirect("user_login.jsp");
        }
    }
}


