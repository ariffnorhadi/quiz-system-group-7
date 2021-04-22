/*
 * Talk is cheap. Show me the code.
 */
package dao;

import database.MySQL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Quiz;

/**
 *
 * @author Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
 */
public class QuizDAO {

    private QuizDAO() {

    }

    /**
     * This method is used to get a record with full details from database
     *
     * @param id
     * @return instance if successful
     */
    public static Quiz getRecord(int id) {
        Quiz e = new Quiz();
        try {
            Connection connection = MySQL.getConnection();
            Statement stmt = connection.createStatement();
            String sqlSelect = "select * from quizzes where quiz_id=" + id;
            ResultSet rs = stmt.executeQuery(sqlSelect);
            if (rs.next()) {
                e.setQuizID(rs.getInt(1));
                e.setQuizCategory(rs.getString(2));
                e.setSubjectID(rs.getInt(3));

            }
        } catch (SQLException ex) {
            ex.getMessage();
        }
        return e;
    }

    /**
     * This method is used to retrieve all records of quizzes from database
     *
     * @param id
     * @return List of records from database
     */
    public static List<Quiz> getAllbySubjectID(int id) {
        List<Quiz> list = new ArrayList<>();
        try {
            Connection connection = MySQL.getConnection();
            Statement stmt = connection.createStatement();
            String sqlSelect = "select * from quizzes where subject_id=" + id + " group by quiz_category";
            ResultSet rs = stmt.executeQuery(sqlSelect);
            while (rs.next()) {
                Quiz e = new Quiz();
                e.setQuizID(rs.getInt(1));
                e.setQuizCategory(rs.getString(2));
                e.setSubjectID(rs.getInt(3));
                list.add(e);

            }
        } catch (SQLException ex) {
            ex.getMessage();
        }

        return list;
    }

    public static List<Quiz> getAllQuiz() {
        List<Quiz> list = new ArrayList<>();
        try {
            Connection connection = MySQL.getConnection();
            Statement stmt = connection.createStatement();
            String sqlSelect = "select * from quizzes group by quiz_category";
            ResultSet rs = stmt.executeQuery(sqlSelect);
            while (rs.next()) {
                Quiz e = new Quiz();
                e.setQuizID(rs.getInt(1));
                e.setQuizCategory(rs.getString(2));
                e.setSubjectID(rs.getInt(3));
                list.add(e);

            }
        } catch (SQLException ex) {
            ex.getMessage();
        }

        return list;
    }

    /**
     * This method is used to register a subject into the database with its
     * lecturer ID
     *
     * @param e
     * @return status > 0 if successful
     */
    public static int add(Quiz e) {
        int status = 0;
        try {
            String sqlInsert = "insert into quizzes(quiz_category,subject_id)"
                    + "values(?,?)";
            PreparedStatement pstmt = MySQL.getConnection().prepareStatement(sqlInsert);
            pstmt.setString(1, e.getQuizCategory());
            pstmt.setInt(2, e.getSubjectID());
            status = pstmt.executeUpdate();
        } catch (SQLException ex) {
            ex.getMessage();
        }
        return status;
    }

    /**
     * Use this method to update subject to database
     *
     * @param e
     * @return status > 0 if the method is successful
     */
    public static int update(Quiz e) {
        int status = 0;
        try {
            //Connection con = MySQL.getConnection();
            String sqlUpdate = "update quizzes set quiz_category=? "
                    + "where quiz_id=?";
            PreparedStatement ps
                    = MySQL.getConnection().prepareStatement(sqlUpdate);
            ps.setString(1, e.getQuizCategory());
            ps.setInt(2, e.getQuizID());
            status = ps.executeUpdate();

        } catch (SQLException ex) {
            ex.getMessage();
        }

        return status;
    }

    /**
     * This method delete a record of a subject from a table in database
     *
     * @param e
     * @return status > 0 if successful
     */
    public static int delete(Quiz e) {
        int status = 0;
        try {
            Statement stmt = MySQL.getConnection().createStatement();
            String sqlDelete = "delete from quizzes where quiz_id=" + e.getQuizID();
            status = stmt.executeUpdate(sqlDelete);

        } catch (SQLException ex) {
            ex.getMessage();
        }
        return status;
    }

    public static int getNoOfQuestion(int id) {
        int number = 0;
        try {
            Statement stmt = MySQL.getConnection().createStatement();
            String count = "select count(1) from questions where quiz_id=" + id;
            ResultSet rs = stmt.executeQuery(count);
            if (rs.next()) {
                number = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(QuizDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return number;
    }

    public static String[] answerList(int id) {
        int count = QuizDAO.getNoOfQuestion(id);
        String[] answer;
        answer = new String[count];
        try {
            Statement stmt = MySQL.getConnection().createStatement();
            String answerlist = "select answer from questions where quiz_id=" + id;
            ResultSet rs = stmt.executeQuery(answerlist);
            for (int i = 0; rs.next(); i++) {
                answer[i] = rs.getString(1);

            }
        } catch (SQLException ex) {
            Logger.getLogger(QuizDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return answer;

    }

    /**
     * This method is used to get a record from database
     *
     * @param id
     * @return instance if successful
     */
    public static int getNumberofQuiz(int id) {
        int count = 0;
        try {
            Connection connection = MySQL.getConnection();
            Statement stmt = connection.createStatement();
            String sqlExist = "select count(1) from quizzes where subject_id=" + id;
            ResultSet rsExist = stmt.executeQuery(sqlExist);
            if (rsExist.next()) {
                count = rsExist.getInt(1);

            }
        } catch (SQLException ex) {
            ex.getMessage();
        }
        return count;
    }

}
