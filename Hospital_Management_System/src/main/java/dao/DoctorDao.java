package dao;

import entity.Doctor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import static db.DBConnect.con;

public class DoctorDao {
    private Connection con;

    public DoctorDao(Connection con) {
        super();
        this.con = con;
    }
    public boolean registerDoctor(Doctor d) {
        boolean f = false;
        try
        {
            String sql = "INSERT INTO doctor(fullname, dob, qualification, specialist, mobno, email, password) VALUES(?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, d.getFullName());
            ps.setString(2, d.getDob());
            ps.setString(3, d.getQualification());
            ps.setString(4, d.getSpecialist());
            ps.setString(5, d.getMobno());
            ps.setString(6, d.getEmail());
            ps.setString(7, d.getPassword());

            int i = ps.executeUpdate();

            if(i > 0) {
                f = true;
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

        return f;
    }
    public List<Doctor> getAllDoctor()
    {
        List<Doctor> list = new ArrayList<Doctor>();
        Doctor d = null;

        try
        {
            String sql = "SELECT * FROM doctor order by id desc";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while(rs.next())
            {
                d = new Doctor();
                d.setId(rs.getInt("id"));
                d.setFullName(rs.getString("fullname"));
                d.setDob(rs.getString("dob"));
                d.setQualification(rs.getString("qualification"));
                d.setSpecialist(rs.getString("specialist"));
                d.setMobno(rs.getString("mobno"));
                d.setEmail(rs.getString("email"));
                d.setPassword(rs.getString("password"));

                list.add(d);
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

        return list;
    }

    public Doctor getDoctorById(int id)
    {
        Doctor d = null;

        try
        {
            String sql = "SELECT * FROM doctor where id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while(rs.next())
            {
                d = new Doctor();
                d.setId(rs.getInt("id"));
                d.setFullName(rs.getString("fullname"));
                d.setDob(rs.getString("dob"));
                d.setQualification(rs.getString("qualification"));
                d.setSpecialist(rs.getString("specialist"));
                d.setMobno(rs.getString("mobno"));
                d.setEmail(rs.getString("email"));
                d.setPassword(rs.getString("password"));

            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

        return d;
    }

    public boolean UpdateDoctor(Doctor d) {
        boolean f = false;
        try
        {
            String sql = "UPDATE doctor set fullname=?, dob=?, qualification=?, specialist=?, mobno=?, email=?, password=? where id=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, d.getFullName());
            ps.setString(2, d.getDob());
            ps.setString(3, d.getQualification());
            ps.setString(4, d.getSpecialist());
            ps.setString(5, d.getMobno());
            ps.setString(6, d.getEmail());
            ps.setString(7, d.getPassword());
            ps.setInt(8, d.getId());

            int i = ps.executeUpdate();

            if(i > 0) {
                f = true;
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }

    public  boolean deleteDoctor(int id)
    {
        boolean f = false;
        try
        {
            String sql = "DELETE FROM doctor WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            int i = ps.executeUpdate();

            if(i > 0) {
                f = true;
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

        return f;
    }

    public Doctor login(String email, String password)
    {
        Doctor d = null;

        try
        {
            String sql = "SELECT * FROM doctor where email =? and password =?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            while(rs.next())
            {
                d = new Doctor();
                d.setId(rs.getInt("id"));
                d.setFullName(rs.getString("fullname"));
                d.setDob(rs.getString("dob"));
                d.setQualification(rs.getString("4"));
                d.setSpecialist(rs.getString("5"));
                d.setMobno(rs.getString("6"));
                d.setEmail(rs.getString("7"));
                d.setPassword(rs.getString("8"));
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return d;
    }

    public int countDoctor()
    {
        int i = 0;

        try
        {
            String sql = "SELECT * FROM doctor";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            if(rs.next())
            {
                i++;
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

        return i;
    }


    public int countAppointment()
    {
        int i = 0;

        try
        {
            String sql = "SELECT * FROM appointment";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            if(rs.next())
            {
                i++;
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return i;
    }

    public int countAppointmentByDoctorId(int did)
    {
        int i = 0;

        try
        {
            String sql = "SELECT * FROM appointment where doctor_id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, did);

            ResultSet rs = ps.executeQuery();

            if(rs.next())
            {
                i++;
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return i;
    }

    public int countUser()
    {
        int i = 0;

        try
        {
            String sql = "SELECT * FROM user_details";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            if(rs.next())
            {
                i++;
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return i;
    }

    public int countSpecialist()
    {
        int i = 0;

        try
        {
            String sql = "SELECT * FROM specialist";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            if(rs.next())
            {
                i++;
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return i;
    }

    public boolean checkOldPassword(int userid, String oldPassword)
    {
        boolean f = false;

        try
        {
            String sql = "select * from doctor where id = ? AND password = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userid);
            ps.setString(2, oldPassword);

            ResultSet rs = ps.executeQuery();

            while (rs.next())
            {
                f = true;
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }

    public boolean changePassword(int userid, String newPassword)
    {
        boolean f = false;

        try
        {
            String sql = "update doctor set password = ? WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, newPassword);
            ps.setInt(2, userid);

            int i = ps.executeUpdate();

            if (i > 0)
            {
                f = true;
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }

    public boolean editDoctorProfile(Doctor d) {
        boolean f = false;
        try
        {
            String sql = "UPDATE doctor set fullname=?, dob=?, qualification=?, specialist=?, mobno=?, email=? where id=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, d.getFullName());
            ps.setString(2, d.getDob());
            ps.setString(3, d.getQualification());
            ps.setString(4, d.getSpecialist());
            ps.setString(5, d.getMobno());
            ps.setString(6, d.getEmail());
            ps.setInt(7, d.getId());

            int i = ps.executeUpdate();

            if(i > 0) {
                f = true;
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
}

