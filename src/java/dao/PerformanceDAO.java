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
import model.Performance;

/**
 *
 * @author Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
 */
public class PerformanceDAO {

    private PerformanceDAO() {

    }

    public static List<Performance> getPerformanceforQuizforStudent(int quizid, int studid) {
        List<Performance> list = new ArrayList<>();
        try {
            Connection connection = MySQL.getConnection();
            Statement stmt = connection.createStatement();
            String select = "select * from performance where quiz_id=" + quizid + " and stud_id=" + studid;
            ResultSet rs = stmt.executeQuery(select);
            for (int i = 0; rs.next(); i++) {
                Performance e = new Performance();
                e.setAttempt(i + 1);
                e.setId(rs.getInt(1));
                e.setMarks(rs.getDouble(2));
                e.setStudID(rs.getInt(3));
                e.setQuizID(rs.getInt(4));
                e.setPercentage(rs.getDouble(5));
                e.setTotalQuestion(rs.getInt(6));
                list.add(e);

            }

        } catch (SQLException ex) {
            Logger.getLogger(PerformanceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;

    }

    /**
     * This method is to insert data into database
     *
     * @param e
     * @return status > 0 if sucessful
     */
    public static int add(Performance e) {
        int status = 0;
        try {
            String sqlInsert = "insert into performance(marks,stud_id,quiz_id,percentage,totalQuestion) values (?,?,?,?,?)";
            PreparedStatement pstmt = MySQL.getConnection().prepareStatement(sqlInsert);
            pstmt.setDouble(1, e.getMarks());
            pstmt.setInt(2, e.getStudID());
            pstmt.setInt(3, e.getQuizID());
            pstmt.setDouble(4, e.getPercentage());
            pstmt.setInt(5, e.getTotalQuestion());
            status = pstmt.executeUpdate();
        } catch (SQLException ex) {
            ex.getMessage();
        }
        return status;
    }

    public static List<Performance> getAllStudentForAnsweredQuiz(int id) {
        List<Performance> list = new ArrayList<>();
        try {
            Connection connection = MySQL.getConnection();
            Statement myStatement = connection.createStatement();
            String sqlSelect = "select * from performance where quiz_id=" + id;
            ResultSet myRs = myStatement.executeQuery(sqlSelect);
            for (int i = 0; myRs.next(); i++) {
                Performance e = new Performance();
                e.setAttempt(i + 1);
                e.setId(myRs.getInt(1));
                e.setPercentage(myRs.getDouble(5));
                e.setQuizID(myRs.getInt(4));
                e.setStudID(myRs.getInt(3));
                list.add(e);

            }
        } catch (SQLException ex) {
            ex.getMessage();
        }
        return list;
    }

    public static List<Performance> getAllStudentbyID(int id) {
        List<Performance> list = new ArrayList<Performance>();
        try {
            Connection connection = MySQL.getConnection();
            Statement myStatement = connection.createStatement();
            String sqlSelect = "SELECT DISTINCT stud_id FROM performance WHERE quiz_id='" + id + "' group by stud_id";
            ResultSet myRs = myStatement.executeQuery(sqlSelect);
            while (myRs.next()) {
                Performance e = new Performance();
                e.setId(myRs.getInt(1));

                list.add(e);
            }
        } catch (SQLException ex) {
            ex.getMessage();
        }
        return list;
    }

}
