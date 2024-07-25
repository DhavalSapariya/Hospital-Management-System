package user.servlet;

import dao.UserDao;
import db.DBConnect;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "UserChangePassword", value = "/UserChangePassword")
public class UserChangePassword extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int uid = Integer.parseInt(req.getParameter("uid"));
        String oldPassword = req.getParameter("oldPassword");
        String newPassword = req.getParameter("newPassword");

        UserDao dao = new UserDao(DBConnect.getCon());
        HttpSession session = req.getSession();

        if(dao.checkOldPassword(uid, oldPassword))
        {
            if(dao.changePassword(uid, newPassword))
            {
                session.setAttribute("SuccessMsg", "Password Changed Successfully");
                resp.sendRedirect("change_password.jsp");
            }
            else
            {
                session.setAttribute("errorMsg", "Oops... Something wrong on server");
                resp.sendRedirect("change_password.jsp");
            }
        }
        else
        {
            session.setAttribute("errorMsg", "Old Password is incorrect");
            resp.sendRedirect("change_password.jsp");
        }
    }
}
