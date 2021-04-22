/*
 * Talk is cheap. Show me the code.
 */
package model;

/**
 *
 * @author Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
 */
public class Student {

    private int id;
    private String studMatric, studName, studEmail, studPassword;
    private int studFaculty;

    public Student() {
    }

    public Student(int id, String studMatric, String studName, String studEmail, String studPassword, int studFaculty) {
        this.id = id;
        this.studMatric = studMatric;
        this.studName = studName;
        this.studEmail = studEmail;
        this.studPassword = studPassword;
        this.studFaculty = studFaculty;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStudMatric() {
        return studMatric;
    }

    public void setStudMatric(String studMatric) {
        this.studMatric = studMatric;
    }

    public String getStudName() {
        return studName;
    }

    public void setStudName(String studName) {
        this.studName = studName;
    }

    public String getStudEmail() {
        return studEmail;
    }

    public void setStudEmail(String studEmail) {
        this.studEmail = studEmail;
    }

    public String getStudPassword() {
        return studPassword;
    }

    public void setStudPassword(String studPassword) {
        this.studPassword = studPassword;
    }

    public int getStudFaculty() {
        return studFaculty;
    }

    public void setStudFaculty(int studFaculty) {
        this.studFaculty = studFaculty;
    }

}
