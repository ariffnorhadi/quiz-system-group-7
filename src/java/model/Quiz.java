/*
 * Talk is cheap. Show me the code.
 */
package model;

/**
 *
 * @author Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
 */
public class Quiz {

    private int quizID;
    private String quizCategory;
    private int subjectID;
    private int lectID;
    private int questionCount;
    private String subjectName;
    private String subjectCode;
    private String lectName;

    public Quiz() {
    }

    /**
     * This method construct an instance for adding record into database
     *
     * @param quizCategory
     * @param subjectID
     */
    public Quiz(String quizCategory, int subjectID) {
        this.quizCategory = quizCategory;
        this.subjectID = subjectID;
    }

    public Quiz(int quizID, String quizCategory, int subjectID) {
        this.quizID = quizID;
        this.quizCategory = quizCategory;
        this.subjectID = subjectID;
    }

    public int getQuizID() {
        return quizID;
    }

    public void setQuizID(int quizID) {
        this.quizID = quizID;
    }

    public String getQuizCategory() {
        return quizCategory;
    }

    public void setQuizCategory(String quizCategory) {
        this.quizCategory = quizCategory;
    }

    public int getSubjectID() {
        return subjectID;
    }

    public void setSubjectID(int subjectID) {
        this.subjectID = subjectID;
    }

    public int getQuestionCount() {
        return questionCount;
    }

    public void setQuestionCount(int questionCount) {
        this.questionCount = questionCount;
    }

    public int getLectID() {
        return lectID;
    }

    public void setLectID(int lectID) {
        this.lectID = lectID;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public String getSubjectCode() {
        return subjectCode;
    }

    public void setSubjectCode(String subjectCode) {
        this.subjectCode = subjectCode;
    }

    public String getLectName() {
        return lectName;
    }

    public void setLectName(String lectName) {
        this.lectName = lectName;
    }

}
