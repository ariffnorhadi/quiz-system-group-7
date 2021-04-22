/*
 * Talk is cheap. Show me the code.
 */
package model;

/**
 *
 * @author Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
 */
public class Faculty {

    private int facultyID;
    private String facultyName;

    /**
     * This constructor is used to construct full faculty details
     *
     * @param facultyID
     * @param facultyName
     */
    public Faculty(int facultyID, String facultyName) {
        this.facultyID = facultyID;
        this.facultyName = facultyName;
    }

    public int getFacultyID() {
        return facultyID;
    }

    public void setFacultyID(int facultyID) {
        this.facultyID = facultyID;
    }

    public String getFacultyName() {
        return facultyName;
    }

    public void setFacultyName(String facultyName) {
        this.facultyName = facultyName;
    }

}
