/*
 * Talk is cheap. Show me the code.
 */
package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Student;
import database.MySQL;
import java.sql.PreparedStatement;

/**
 *
 * @author Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
 */
public class StudentDAO {

    private StudentDAO() {

    }

    /**
     * This method is used to get a record from database
     *
     * @return instance if successful
     */
    public static Student getRecord(int id) {
        Student e = new Student();
        try {
            Connection connection = MySQL.getConnection();
            Statement stmt = connection.createStatement();
            String sqlSelect = "select * from students where id=" + id;
            ResultSet rs = stmt.executeQuery(sqlSelect);
            if (rs.next()) {
                e.setId(rs.getInt(1));
                e.setStudMatric(rs.getString(2));
                e.setStudName(rs.getString(3));

            }
        } catch (SQLException ex) {
            ex.getMessage();
        }
        return e;
    }

    public static List<Student> getAllStudent() {
        List<Student> list = new ArrayList<Student>();
        try {
            Connection connection = MySQL.getConnection();
            Statement myStatement = connection.createStatement();
            String sqlSelect = "select * from students group by stud_matrics";
            ResultSet myRs = myStatement.executeQuery(sqlSelect);
            while (myRs.next()) {
                Student e = new Student();
                e.setId(myRs.getInt(1));
                e.setStudMatric(myRs.getString(2));
                e.setStudName(myRs.getString(3));
                e.setStudEmail(myRs.getString(4));
                e.setStudPassword(myRs.getString(5));
                e.setStudFaculty(myRs.getInt(6));
                list.add(e);
            }
        } catch (SQLException ex) {
            ex.getMessage();
        }
        return list;
    }

    public static int delete(Student e) {
        int status = 0;
        try {
            Statement stmt = MySQL.getConnection().createStatement();
            String sqlDelete = "delete from students where id=" + e.getId();
            status = stmt.executeUpdate(sqlDelete);
        } catch (SQLException ex) {
            ex.getMessage();
        }
        return status;
    }

    public static int updatePass(Student e) {
        int status = 0;
        try {
            String sqlUpdatePass = "update students set stud_password=? where id=?";
            PreparedStatement pstmt = MySQL.getConnection().prepareStatement(sqlUpdatePass);
            pstmt.setString(1, e.getStudPassword());
            pstmt.setInt(2, e.getId());
            status = pstmt.executeUpdate();
        } catch (SQLException ex) {
            ex.getMessage();
        }
        return status;
    }

    public static List<Student> getAllStudentbyID(int id) {
        List<Student> list = new ArrayList<Student>();
        try {
            Connection connection = MySQL.getConnection();
            Statement myStatement = connection.createStatement();
            String sqlSelect = "select * from students WHERE id='" + id + "'";
            ResultSet myRs = myStatement.executeQuery(sqlSelect);
            while (myRs.next()) {
                Student e = new Student();
                e.setId(myRs.getInt(1));
                e.setStudMatric(myRs.getString(2));
                e.setStudName(myRs.getString(3));
                e.setStudEmail(myRs.getString(4));
                e.setStudPassword(myRs.getString(5));
                e.setStudFaculty(myRs.getInt(6));

                list.add(e);
            }
        } catch (SQLException ex) {
            ex.getMessage();
        }
        return list;
    }

}
