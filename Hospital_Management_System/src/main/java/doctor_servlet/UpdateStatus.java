package doctor_servlet;

import dao.AppointmentDao;
import db.DBConnect;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "UpdateStatus", value = "/UpdateStatus")
public class UpdateStatus extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try
        {
            int id = Integer.parseInt(req.getParameter("id"));
            int did = Integer.parseInt(req.getParameter("did"));
            String comment = req.getParameter("comment");

            AppointmentDao dao = new AppointmentDao(DBConnect.getCon());

            HttpSession session = req.getSession();

            if(dao.updateCommentStatus(id, did, comment))
            {
                session.setAttribute("SuccessMsg", "Comment Updated");
                resp.sendRedirect("doctor/patient.jsp");
            }
            else
            {
                session.setAttribute("errorMsg", "Something wrong on server, Comment not Updated");
                resp.sendRedirect("doctor/patient.jsp");
            }

        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
