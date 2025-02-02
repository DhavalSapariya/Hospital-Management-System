package doctor_servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "DoctorLogout", value = "/DoctorLogout")
public class DoctorLogout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        HttpSession session = req.getSession();
        session.removeAttribute("doctorObj");
        session.setAttribute("SuccessMsg", "Doctor Logout Successfully");
        resp.sendRedirect("doctor_login.jsp");
    }
}
