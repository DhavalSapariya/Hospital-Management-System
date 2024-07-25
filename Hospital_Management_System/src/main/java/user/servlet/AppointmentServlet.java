package user.servlet;

import dao.AppointmentDao;
import db.DBConnect;
import entity.Appointment;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "AppointmentServlet", value = "/AppointmentServlet")
public class AppointmentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userId = Integer.parseInt(req.getParameter("userid"));
        String fullname = req.getParameter("fullname");
        String gender = req.getParameter("gender");
        String age = req.getParameter("age");
        String appoinDate = req.getParameter("appoint_date");
        String email = req.getParameter("email");
        String phoneno = req.getParameter("phoneno");
        String diseases = req.getParameter("diseases");
        int doctorId = Integer.parseInt(req.getParameter("doctor"));
        String address = req.getParameter("address");


        Appointment ap = new Appointment();
        AppointmentDao dao = new AppointmentDao(DBConnect.getCon());

        HttpSession session = req.getSession();

        if(dao.addAppointment(ap)) {
            session.setAttribute("SuccessMsg", "Appointment Booked Successfully");
            resp.sendRedirect("user_appointment.jsp");
        } else {
            session.setAttribute("errorMsg", "Appointment not Booked, Try again");
            resp.sendRedirect("user_appointment.jsp");
        }
    }
}

