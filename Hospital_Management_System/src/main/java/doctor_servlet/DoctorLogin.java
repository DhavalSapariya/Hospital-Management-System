package doctor_servlet;

import dao.DoctorDao;
import dao.UserDao;
import db.DBConnect;
import entity.Doctor;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "DoctorLogin", value = "/DoctorLogin")
public class DoctorLogin extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        HttpSession session = req.getSession();
        HttpSession s2 = req.getSession();

        DoctorDao dao = new DoctorDao(DBConnect.getCon());
        Doctor doctor = dao.login(email, password);

        if(doctor != null)
        {
            session.setAttribute("doctorObj", doctor);
            s2.setAttribute("em",email);
            resp.sendRedirect("doctor/index.jsp");
        }
        else
        {
            session.setAttribute("errorMsg", "Invalid Email & Password");
            resp.sendRedirect("doctor_login.jsp");
        }
    }
}
