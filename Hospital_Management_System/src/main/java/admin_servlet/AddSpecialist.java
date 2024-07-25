package admin_servlet;

import dao.SpecialistDao;
import db.DBConnect;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "AddSpecialist", value = "/AddSpecialist")
public class AddSpecialist extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String specName = req.getParameter("specName");

        SpecialistDao dao = new SpecialistDao(DBConnect.getCon());
        boolean f = dao.addSpecialist(specName);
        
        HttpSession session = req.getSession();

        if(f)
        {
            session.setAttribute("SuccessMsg", "Specialists Added Successfully");
            resp.sendRedirect("admin/index.jsp");
        }
        else
        {
            session.setAttribute("errorMsg", "Something went wrong on the server");
            resp.sendRedirect("admin/index.jsp");
        }
    }
}
