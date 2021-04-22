/*
 * Talk is cheap. Show me the code.
 */
package dao;

import model.Subject;
import database.MySQL;
import java.sql.*;
import java.util.*;

/**
 *
 * @author Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
 */
public class SubjectDAO {

    private SubjectDAO() {

    }

    /**
     * This method is used to get a record with full details from database
     *
     * @param id
     * @return instance if successful
     */
    public static Subject getRecord(int id) {
        Subject e = new Subject();
        try {
            Connection connection = MySQL.getConnection();
            Statement stmt = connection.createStatement();
            String sqlSelect = "select * from subjects where subject_id=" + id;
            ResultSet rs = stmt.executeQuery(sqlSelect);
            if (rs.next()) {
                e.setSubjectID(rs.getInt(1));
                e.setSubjectCode(rs.getString(2));
                e.setSubjectName(rs.getString(3));
                e.setFacultyID(rs.getInt(4));
                e.setLectID(rs.getInt(5));

            }
        } catch (SQLException ex) {
            ex.getMessage();
        }
        return e;
    }

    /**
     * This method is used to retrieve all records of subjects from database
     *
     * @param id
     * @return List of records from database
     */
    public static List<Subject> getAllbyLectID(int id) {
        List<Subject> list = new ArrayList<>();
        try {
            Connection connection = MySQL.getConnection();
            Statement stmt = connection.createStatement();
            String sqlSelect = "select * from subjects where lect_id=" + id + " group by subject_name";
            ResultSet rs = stmt.executeQuery(sqlSelect);
            while (rs.next()) {
                Subject e = new Subject();
                e.setSubjectID(rs.getInt(1));
                e.setSubjectCode(rs.getString(2));
                e.setSubjectName(rs.getString(3));
                e.setFacultyID(rs.getInt(4));
                e.setLectID(rs.getInt(5));
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
    public static int add(Subject e) {
        int status = 0;
        try {
            String sqlInsert = "insert into subjects(subject_code,subject_name,faculty_id,lect_id)"
                    + "values(?,?,?,?)";
            PreparedStatement pstmt = MySQL.getConnection().prepareStatement(sqlInsert);
            pstmt.setString(1, e.getSubjectCode());
            pstmt.setString(2, e.getSubjectName());
            pstmt.setInt(3, e.getFacultyID());
            pstmt.setInt(4, e.getLectID());
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
    public static int update(Subject e) {
        int status = 0;
        try {
            //Connection con = MySQL.getConnection();
            String sqlUpdate = "update subjects set subject_code=?,subject_name=? "
                    + "where subject_id=?";
            PreparedStatement ps
                    = MySQL.getConnection().prepareStatement(sqlUpdate);
            ps.setString(1, e.getSubjectCode());
            ps.setString(2, e.getSubjectName());
            ps.setInt(3, e.getSubjectID());
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
    public static int delete(Subject e) {
        int status = 0;
        try {
            Statement stmt = MySQL.getConnection().createStatement();
            String sqlDelete = "delete from subjects where subject_id=" + e.getSubjectID();
            status = stmt.executeUpdate(sqlDelete);

        } catch (SQLException ex) {
            ex.getMessage();
        }
        return status;
    }

}
