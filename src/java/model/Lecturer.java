/*
 * Talk is cheap. Show me the code.
 */
package model;

/**
 *
 * @author Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
 */
public class Lecturer {

    private int id;
    private String lectID;
    private String lectName, lectEmail, lectPassword, lectPhone;
    private int lectFaculty;

    public Lecturer() {
    }

    /**
     * This constructor is used to set attribute for lecturer.
     *
     * @param id
     * @param lectID
     * @param lectName
     * @param lectEmail
     * @param lectPassword
     * @param lectPhone
     * @param lectFaculty
     */
    public Lecturer(int id, String lectID, String lectName, String lectEmail, String lectPassword, String lectPhone, int lectFaculty) {
        this.id = id;
        this.lectID = lectID;
        this.lectName = lectName;
        this.lectEmail = lectEmail;
        this.lectPassword = lectPassword;
        this.lectPhone = lectPhone;
        this.lectFaculty = lectFaculty;
    }

    /**
     * This constructor is used to update Lecturer's password
     *
     * @param id
     * @param lectPassword
     */
    public Lecturer(int id, String lectPassword) {
        this.id = id;
        this.lectPassword = lectPassword;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLectID() {
        return lectID;
    }

    public void setLectID(String lectID) {
        this.lectID = lectID;
    }

    public String getLectName() {
        return lectName;
    }

    public void setLectName(String lectName) {
        this.lectName = lectName;
    }

    public String getLectEmail() {
        return lectEmail;
    }

    public void setLectEmail(String lectEmail) {
        this.lectEmail = lectEmail;
    }

    public String getLectPassword() {
        return lectPassword;
    }

    public void setLectPassword(String lectPassword) {
        this.lectPassword = lectPassword;
    }

    public String getLectPhone() {
        return lectPhone;
    }

    public void setLectPhone(String lectPhone) {
        this.lectPhone = lectPhone;
    }

    public int getLectFaculty() {
        return lectFaculty;
    }

    public void setLectFaculty(int lectFaculty) {
        this.lectFaculty = lectFaculty;
    }

}
