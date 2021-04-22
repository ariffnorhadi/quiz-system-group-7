/*
 * Talk is cheap. Show me the code.
 */
package dao;

import model.Question;
import java.sql.*;
import database.MySQL;
import java.util.*;

/**
 *
 * @author Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
 */
public class QuestionDAO {

    private QuestionDAO() {

    }

    /**
     * This method is used to get a full details regarding available questions
     * from the quiz from database
     *
     * @param id
     * @return instance if successful
     */
    public static Question getRecord(int id) {
        Question e = new Question();
        try {
            Connection connection = MySQL.getConnection();
            Statement stmt = connection.createStatement();
            String sqlSelect = "select * from questions where question_id=" + id;
            ResultSet rs = stmt.executeQuery(sqlSelect);
            if (rs.next()) {
                e.setQuestionID(rs.getInt(1));
                e.setQuestionName(rs.getString(2));
                e.setChoiceOne(rs.getString(3));
                e.setChoiceTwo(rs.getString(4));
                e.setChoiceThree(rs.getString(5));
                e.setChoiceFour(rs.getString(6));
                e.setAnswer(rs.getString(7));
                e.setQuizID(rs.getInt(8));

            }
        } catch (SQLException ex) {
            ex.getMessage();
        }
        return e;
    }

    /**
     * This method is used to retrieve all questions and answers available from
     * the quiz ID
     *
     * @param id
     * @return List of records from database
     */
    public static List<Question> getAllQuestionsAndAnswersbyQuizID(int id) {
        List<Question> list = new ArrayList<>();
        try {
            Connection connection = MySQL.getConnection();
            Statement stmt = connection.createStatement();
            String sqlSelect = "select * from questions where quiz_id=" + id;
            ResultSet rs = stmt.executeQuery(sqlSelect);
            while (rs.next()) {
                Question e = new Question();
                e.setQuestionID(rs.getInt(1));
                e.setQuestionName(rs.getString(2));
                e.setChoiceOne(rs.getString(3));
                e.setChoiceTwo(rs.getString(4));
                e.setChoiceThree(rs.getString(5));
                e.setChoiceFour(rs.getString(6));
                e.setAnswer(rs.getString(7));
                e.setQuizID(rs.getInt(8));
                list.add(e);

            }
        } catch (SQLException ex) {
            ex.getMessage();
        }

        return list;
    }

    /**
     * This method is to insert new question into database
     *
     * @param e
     * @return status > 0 if sucessful
     */
    public static int add(Question e) {
        int status = 0;
        try {
            String sqlInsert = "insert into questions(question_name,choice_one,choice_two,choice_three,choice_four,answer,quiz_id) "
                    + "values(?,?,?,?,?,?,?)";
            PreparedStatement pstmt = MySQL.getConnection().prepareStatement(sqlInsert);
            pstmt.setString(1, e.getQuestionName());
            pstmt.setString(2, e.getChoiceOne());
            pstmt.setString(3, e.getChoiceTwo());
            pstmt.setString(4, e.getChoiceThree());
            pstmt.setString(5, e.getChoiceFour());
            pstmt.setString(6, e.getAnswer());
            pstmt.setInt(7, e.getQuizID());
            status = pstmt.executeUpdate();
        } catch (SQLException ex) {
            ex.getMessage();
        }
        return status;
    }

    /**
     * @return status > 0 if the method is successful
     */
    public static int update(Question e) {
        int status = 0;
        try {
            //Connection con = MySQL.getConnection();
            String sqlUpdate = "update questions set question_name=?,choice_one=?, choice_two=?,choice_three=?,choice_four=?,answer=? "
                    + "where question_id=?";
            PreparedStatement ps
                    = MySQL.getConnection().prepareStatement(sqlUpdate);
            ps.setString(1, e.getQuestionName());
            ps.setString(2, e.getChoiceOne());
            ps.setString(3, e.getChoiceTwo());
            ps.setString(4, e.getChoiceThree());
            ps.setString(5, e.getChoiceFour());
            ps.setString(6, e.getAnswer());
            ps.setInt(7, e.getQuestionID());
            status = ps.executeUpdate();

        } catch (SQLException ex) {
            ex.getMessage();
        }

        return status;
    }

    /**
     * This method delete a question from a table in database
     *
     * @param e
     * @return status > 0 if successful
     */
    public static int delete(Question e) {
        int status = 0;
        try {
            Statement stmt = MySQL.getConnection().createStatement();
            String sqlDelete = "delete from questions where question_id =" + e.getQuestionID();
            status = stmt.executeUpdate(sqlDelete);

        } catch (SQLException ex) {
            ex.getMessage();
        }
        return status;
    }

}
