/*
 * Talk is cheap. Show me the code.
 */
package model;

/**
 *
 * @author Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
 */
public class Performance {

    private int id;
    private double marks;
    private int studID, quizID;
    private int attempt;
    private double percentage;
    private int totalQuestion;

    public Performance() {

    }

    public Performance(int id, double marks, int studID, int quizID) {
        this.id = id;
        this.marks = marks;
        this.studID = studID;
        this.quizID = quizID;
    }

    public Performance(double marks, int studID, int quizID, double percentage, int totalQuestion) {
        this.marks = marks;
        this.studID = studID;
        this.quizID = quizID;
        this.percentage = percentage;
        this.totalQuestion = totalQuestion;
    }

    public double getPercentage() {
        return percentage;
    }

    public void setPercentage(double percentage) {
        this.percentage = percentage;
    }

    public int getTotalQuestion() {
        return totalQuestion;
    }

    public void setTotalQuestion(int totalQuestion) {
        this.totalQuestion = totalQuestion;
    }

   

    
   

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getMarks() {
        return marks;
    }

    public void setMarks(double marks) {
        this.marks = marks;
    }

    public int getStudID() {
        return studID;
    }

    public void setStudID(int studID) {
        this.studID = studID;
    }

    public int getQuizID() {
        return quizID;
    }

    public void setQuizID(int quizID) {
        this.quizID = quizID;
    }

    public int getAttempt() {
        return attempt;
    }

    public void setAttempt(int attempt) {
        this.attempt = attempt;
    }
}
