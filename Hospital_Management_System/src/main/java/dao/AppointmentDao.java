package dao;

import entity.Appointment;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AppointmentDao", value = "/AppointmentDao")
public class AppointmentDao extends HttpServlet {
    private Connection con;

    public AppointmentDao(Connection con) {
        super();
        this.con = con;
    }

    public boolean addAppointment(Appointment ap)
    {
        boolean f = false;
        try
        {
            String sql = "insert into appointment(user_id, fullname, gender, age, appoint_date, email, phoneno, diseases, doctor_id, address, status) values(?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, ap.getUserId());
            ps.setString(2, ap.getFullname());
            ps.setString(3, ap.getGender());
            ps.setString(4, ap.getAge());
            ps.setString(5, ap.getAppoinDate());
            ps.setString(6, ap.getEmail());
            ps.setString(7, ap.getPhoneno());
            ps.setString(8, ap.getDiseases());
            ps.setInt(9, ap.getDoctorId());
            ps.setString(10, ap.getAddress());
            ps.setString(11, ap.getStatus());

            int i = ps.executeUpdate();

            if (i > 0)
            {
                f = true;
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }

    public List<Appointment> getAllAppointmentByLoginUser(int userId)
    {
        List<Appointment> list = new ArrayList<Appointment>();
        Appointment ap = null;

        try
        {
            String sql = "select * from appointment where user_id = ?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while(rs.next())
            {
                ap = new Appointment();
                ap.setId(rs.getInt("id"));
                ap.setUserId(rs.getInt("user_id"));
                ap.setFullname(rs.getString("fullname"));
                ap.setGender(rs.getString("gender"));
                ap.setAge(rs.getString("age"));
                ap.setAppoinDate(rs.getString("appoint_date"));
                ap.setEmail(rs.getString("email"));
                ap.setPhoneno(rs.getString("phoneno"));
                ap.setDiseases(rs.getString("diseases"));
                ap.setDoctorId(rs.getInt("doctor_id"));
                ap.setAddress(rs.getString("address"));
                ap.setStatus(rs.getString("status"));

                list.add(ap);

            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return list;
    }


    public List<Appointment> getAllAppointmentByDoctorLogin(int doctorid)
    {
        List<Appointment> list = new ArrayList<Appointment>();
        Appointment ap = null;

        try
        {
            String sql = "select * from appointment where doctor_id = ?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, doctorid);

            ResultSet rs = ps.executeQuery();

            while(rs.next())
            {
                ap = new Appointment();
                ap.setId(rs.getInt("id"));
                ap.setUserId(rs.getInt("user_id"));
                ap.setFullname(rs.getString("fullname"));
                ap.setGender(rs.getString("gender"));
                ap.setAge(rs.getString("age"));
                ap.setAppoinDate(rs.getString("appoint_date"));
                ap.setEmail(rs.getString("email"));
                ap.setPhoneno(rs.getString("phoneno"));
                ap.setDiseases(rs.getString("diseases"));
                ap.setDoctorId(rs.getInt("doctor_id"));
                ap.setAddress(rs.getString("address"));
                ap.setStatus(rs.getString("status"));

                list.add(ap);

            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return list;
    }

    public Appointment getAppointmentById(int id)
    {
        Appointment ap = null;

        try
        {
            String sql = "select * from appointment where id = ?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            while(rs.next())
            {
                ap = new Appointment();
                ap.setId(rs.getInt("id"));
                ap.setUserId(rs.getInt("user_id"));
                ap.setFullname(rs.getString("fullname"));
                ap.setGender(rs.getString("gender"));
                ap.setAge(rs.getString("age"));
                ap.setAppoinDate(rs.getString("appoint_date"));
                ap.setEmail(rs.getString("email"));
                ap.setPhoneno(rs.getString("phoneno"));
                ap.setDiseases(rs.getString("diseases"));
                ap.setDoctorId(rs.getInt("doctor_id"));
                ap.setAddress(rs.getString("address"));
                ap.setStatus(rs.getString("status"));
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return ap;
    }

    public boolean updateCommentStatus(int id, int doctor_Id, String commentStatus)
    {
        boolean f = false;
        try
        {
            String sql = "UPDATE appointment SET status = ? WHERE  id = ? AND doctor_id = ? ";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, commentStatus);
            ps.setInt(2, id);
            ps.setInt(3, doctor_Id);


            int i = ps.executeUpdate();

            if (i > 0)
            {
                f = true;
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }

    public List<Appointment> getAllAppointment()
    {
        List<Appointment> list = new ArrayList<Appointment>();
        Appointment ap = null;

        try
        {
            String sql = "select * from appointment order by id desc";
            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while(rs.next())
            {
                ap = new Appointment();
                ap.setId(rs.getInt("id"));
                ap.setUserId(rs.getInt("user_id"));
                ap.setFullname(rs.getString("fullname"));
                ap.setGender(rs.getString("gender"));
                ap.setAge(rs.getString("age"));
                ap.setAppoinDate(rs.getString("appoint_date"));
                ap.setEmail(rs.getString("email"));
                ap.setPhoneno(rs.getString("phoneno"));
                ap.setDiseases(rs.getString("diseases"));
                ap.setDoctorId(rs.getInt("doctor_id"));
                ap.setAddress(rs.getString("address"));
                ap.setStatus(rs.getString("status"));

                list.add(ap);

            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return list;
    }
}



