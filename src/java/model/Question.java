/*
 * Talk is cheap. Show me the code.
 */
package model;

/**
 *
 * @author Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
 */
public class Question {

    private int quizID;
    private int questionID;
    private String questionName;
    private String choiceOne, choiceTwo, choiceThree, choiceFour, Answer;

    public Question() {
    }

    public Question(int quizID, int questionID, String questionName, String choiceOne, String choiceTwo, String choiceThree, String choiceFour, String Answer) {
        this.quizID = quizID;
        this.questionID = questionID;
        this.questionName = questionName;
        this.choiceOne = choiceOne;
        this.choiceTwo = choiceTwo;
        this.choiceThree = choiceThree;
        this.choiceFour = choiceFour;
        this.Answer = Answer;
    }

    /**
     * This constructor is used to insert question into database from respective
     * Quiz ID given
     *
     * @param quizID
     * @param questionName
     * @param choiceOne
     * @param choiceTwo
     * @param choiceThree
     * @param choiceFour
     * @param Answer
     */
    public Question(int quizID, String questionName, String choiceOne, String choiceTwo, String choiceThree, String choiceFour, String Answer) {
        this.quizID = quizID;
        this.questionName = questionName;
        this.choiceOne = choiceOne;
        this.choiceTwo = choiceTwo;
        this.choiceThree = choiceThree;
        this.choiceFour = choiceFour;
        this.Answer = Answer;
    }

    public int getQuizID() {
        return quizID;
    }

    public void setQuizID(int quizID) {
        this.quizID = quizID;
    }

    public int getQuestionID() {
        return questionID;
    }

    public void setQuestionID(int questionID) {
        this.questionID = questionID;
    }

    public String getQuestionName() {
        return questionName;
    }

    public void setQuestionName(String questionName) {
        this.questionName = questionName;
    }

    public String getChoiceOne() {
        return choiceOne;
    }

    public void setChoiceOne(String choiceOne) {
        this.choiceOne = choiceOne;
    }

    public String getChoiceTwo() {
        return choiceTwo;
    }

    public void setChoiceTwo(String choiceTwo) {
        this.choiceTwo = choiceTwo;
    }

    public String getChoiceThree() {
        return choiceThree;
    }

    public void setChoiceThree(String choiceThree) {
        this.choiceThree = choiceThree;
    }

    public String getChoiceFour() {
        return choiceFour;
    }

    public void setChoiceFour(String choiceFour) {
        this.choiceFour = choiceFour;
    }

    public String getAnswer() {
        return Answer;
    }

    public void setAnswer(String Answer) {
        this.Answer = Answer;
    }

}
