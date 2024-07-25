package dao;

import entity.Doctor;
import entity.Specialist;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class SpecialistDao
{
    private Connection con;

    public SpecialistDao(Connection con) {
        super();
        this.con = con;
    }
    public boolean addSpecialist(String specialist)
    {
        boolean f = false;
        try
        {
            String sql = "INSERT INTO specialist(spec_name) values (?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, specialist);

            int i = ps.executeUpdate();
            if (i>0)
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
    public List<Specialist> getAllSpecialist() {
        List<Specialist> list = new ArrayList<>();
        Specialist s = null;

        try
        {
            String sql = "SELECT * FROM specialist";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next())
            {
                s = new Specialist();
                s.setId(rs.getInt(1));
                s.setSpecialistName(rs.getString(2));
                list.add(s);
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return list;
    }
}
