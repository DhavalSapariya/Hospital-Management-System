package entity;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet(name = "Appointment", value = "/Appointment")
public class Appointment extends HttpServlet {
    private int id;
    private int userId;
    private String fullname;
    private String gender;
    private String age;
    private String appoinDate;
    private String email;
    private String phoneno;
    private String diseases;
    private int doctorId;
    private String address;
    private String status;

    // Correct constructor with parameters initialization
    public Appointment() {
        this.userId = userId;
        this.fullname = fullname;
        this.gender = gender;
        this.age = age;
        this.appoinDate = appoinDate;
        this.email = email;
        this.phoneno = phoneno;
        this.diseases = diseases;
        this.doctorId = doctorId;
        this.address = address;
        this.status = status;
    }

    // Getter and Setter methods

    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public int getUserId()
    {
        return userId;
    }

    public void setUserId(int userId)
    {
        this.userId = userId;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getAppoinDate() {
        return appoinDate;
    }

    public void setAppoinDate(String appoinDate) {
        this.appoinDate = appoinDate;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneno() {
        return phoneno;
    }

    public void setPhoneno(String phoneno) {
        this.phoneno = phoneno;
    }

    public String getDiseases() {
        return diseases;
    }

    public void setDiseases(String diseases) {
        this.diseases = diseases;
    }

    public int getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(int doctorId) {
        this.doctorId = doctorId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
