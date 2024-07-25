package admin_servlet;

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

@WebServlet(name = "UpdateDoctor", value = "/UpdateDoctor")
public class UpdateDoctor extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try
        {
            String fullname = req.getParameter("fullname");
            String dob = req.getParameter("dob");
            String qualification = req.getParameter("qualification");
            String specialist = req.getParameter("specialist");
            String mobno = req.getParameter("mobno");
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            int id = Integer.parseInt(req.getParameter("id"));

            Doctor d = new Doctor(id,fullname,dob,qualification,specialist,mobno,email,password);
            DoctorDao dao = new DoctorDao(DBConnect.getCon());
            HttpSession session = req.getSession();

            if (dao.UpdateDoctor(d))
            {
                session.setAttribute("SuccessMsg", "Doctor Updated Successfully");
                resp.sendRedirect("admin/viewdoctor.jsp");
            }
            else
            {
                session.setAttribute("errorMsg", "Doctor not Update. Please try again");
                resp.sendRedirect("admin/viewdoctor.jsp");
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
