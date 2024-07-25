package doctor_servlet;

import dao.DoctorDao;
import db.DBConnect;
import entity.Doctor;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "DoctorEditProfile", value = "/DoctorEditProfile")
public class DoctorEditProfile extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try
        {
            String fullname = req.getParameter("fullname");
            String dob = req.getParameter("dob");
            String qualification = req.getParameter("qualification");
            String specialist = req.getParameter("specialist");
            String mobno = req.getParameter("mobno");
            String email = req.getParameter("email");

            int id = Integer.parseInt(req.getParameter("id"));

            Doctor d = new Doctor(id,fullname,dob,qualification,specialist,mobno,email,"");
            DoctorDao dao = new DoctorDao(DBConnect.getCon());
            HttpSession session = req.getSession();

            if (dao.editDoctorProfile(d))
            {
                Doctor updateDoctor = dao.getDoctorById(id);
                session.setAttribute("doctorObj", updateDoctor);
                session.setAttribute("SuccessMsgd", "Doctor Updated Successfully");
                resp.sendRedirect("doctor/edit_profile.jsp");
            }
            else
            {
                session.setAttribute("errorMsgd", "Doctor not Update. Please try again");
                resp.sendRedirect("doctor/edit_profile.jsp");
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
