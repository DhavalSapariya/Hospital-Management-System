package dao;

import entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDao {
    private Connection con;

    public UserDao(Connection con) {
        super();
        this.con = con;
    }

    public boolean register(User user) {
        boolean f = false;

        try {
            String sql = "insert into user_details(fullname, email, password) values(?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user.getFullName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());

            int i = ps.executeUpdate();

            if (i > 0) {
                f = true;
                System.out.println("Data Inserted Successfully");
            } else {
                System.out.println("Data Insert Failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }


    public User login(String email, String password)
    {
        User u = null;

        try
        {
            String sql = "select * from user_details where email=? and password=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next())
            {
                u = new User();
                u.setId(rs.getInt("id"));
                u.setFullName(rs.getString("fullname"));
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("password"));
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return u;
    }

    public boolean checkOldPassword(int userid, String oldPassword)
    {
        boolean f = false;

        try
        {
            String sql = "select * from user_details where id = ? AND password = ?";
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
            String sql = "update user_details set password = ? WHERE id = ?";
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


}
