package admin_servlet;

import dao.DoctorDao;
import db.DBConnect;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "DeleteDoctor", value = "/DeleteDoctor")
public class DeleteDoctor extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));

        DoctorDao dao = new DoctorDao(DBConnect.getCon());
        HttpSession session = req.getSession();

        if (dao.deleteDoctor(id))
        {
            session.setAttribute("SuccessMsg", "Doctor Deleted Successfully");
            resp.sendRedirect("admin/viewdoctor.jsp");
        }
        else
        {
            session.setAttribute("errorMsg", "Doctor not Deleted. Please try again");
            resp.sendRedirect("admin/viewdoctor.jsp");
        }
    }
}
