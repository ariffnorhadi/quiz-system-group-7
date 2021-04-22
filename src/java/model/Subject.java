/*
 * Talk is cheap. Show me the code.
 */
package model;

/**
 *
 * @author Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
 */
public class Subject {

    private int subjectID;
    private String subjectCode, subjectName;
    private int facultyID, lectID;

    public Subject() {
    }

    /**
     * Use this constructor for add process
     *
     * @param subjectCode
     * @param subjectName
     * @param facultyID
     * @param lectID
     */
    public Subject(String subjectCode, String subjectName, int facultyID, int lectID) {
        this.subjectCode = subjectCode;
        this.subjectName = subjectName;
        this.facultyID = facultyID;
        this.lectID = lectID;
    }
    
    

    public Subject(int subjectID, String subjectCode, String subjectName, int facultyID, int lectID) {
        this.subjectID = subjectID;
        this.subjectCode = subjectCode;
        this.subjectName = subjectName;
        this.facultyID = facultyID;
        this.lectID = lectID;
    }

    public int getSubjectID() {
        return subjectID;
    }

    public void setSubjectID(int subjectID) {
        this.subjectID = subjectID;
    }

    public String getSubjectCode() {
        return subjectCode;
    }

    public void setSubjectCode(String subjectCode) {
        this.subjectCode = subjectCode;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public int getFacultyID() {
        return facultyID;
    }

    public void setFacultyID(int facultyID) {
        this.facultyID = facultyID;
    }

    public int getLectID() {
        return lectID;
    }

    public void setLectID(int lectID) {
        this.lectID = lectID;
    }

}
