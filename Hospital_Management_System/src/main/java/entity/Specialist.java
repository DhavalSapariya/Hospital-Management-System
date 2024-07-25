package entity;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet(name = "Specialist", value = "/Specialist")
public class Specialist
{
    private int id;
    private String SpecialistName;

    public Specialist() {
        super();
    }
    public Specialist(int id, String specialistName) {
        super();
        this.id = id;
        this.SpecialistName = specialistName;
    }
    // Getters and setter

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSpecialistName() {
        return SpecialistName;
    }

    public void setSpecialistName(String specialistName) {
        SpecialistName = specialistName;
    }
}
