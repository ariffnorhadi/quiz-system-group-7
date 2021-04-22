/*
 * Talk is cheap. Show me the code.
 */
package dao;

import model.Lecturer;
import java.sql.*;
import database.MySQL;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
 */
public class LecturerDAO {

    private LecturerDAO() {

    }

    /**
     * This method is used to update the lecturer's information
     *
     * @param e
     * @return status > 0 if the method is successful
     */
    public static int update(Lecturer e) {
        int status = 0;
        try {
            //Connection con = MySQL.getConnection();
            String sqlUpdate = "update lecturers set lect_name=?,lect_email=?,lect_phone=? where id=?";
            PreparedStatement ps
                    = MySQL.getConnection().prepareStatement(sqlUpdate);
            ps.setString(1, e.getLectName());
            ps.setString(2, e.getLectEmail());
            ps.setString(3, e.getLectPhone());
            ps.setInt(4, e.getId());
            status = ps.executeUpdate();

        } catch (SQLException ex) {
            ex.getMessage();
        }

        return status;
    }

    /**
     * This method is used to update the password of the lecturer
     *
     * @param e e is the instance of the User class.
     * @return status. if sql command is executed, then the status number will
     * be changed. if not then the status remain unchanged.
     */
    public static int updatePass(Lecturer e) {
        int status = 0;
        try {
            String sqlUpdatePass = "update lecturers set lect_password=? where id=?";
            PreparedStatement pstmt = MySQL.getConnection().prepareStatement(sqlUpdatePass);
            pstmt.setString(1, e.getLectPassword());
            pstmt.setInt(2, e.getId());
            status = pstmt.executeUpdate();
        } catch (SQLException ex) {
            ex.getMessage();
        }
        return status;
    }

    public static List<Lecturer> getAllLect() {
        List<Lecturer> list = new ArrayList<Lecturer>();
        try {
            Connection connection = MySQL.getConnection();
            Statement myStatement = connection.createStatement();
            String sqlSelect = "select * from lecturers group by lect_id";
            ResultSet myRs = myStatement.executeQuery(sqlSelect);
            while (myRs.next()) {
                Lecturer e = new Lecturer();
                e.setId(myRs.getInt(1));
                e.setLectID(myRs.getString(2));
                e.setLectName(myRs.getString(3));
                e.setLectEmail(myRs.getString(4));
                e.setLectPassword(myRs.getString(5));
                e.setLectPhone(myRs.getString(6));
                e.setLectFaculty(myRs.getInt(7));
                list.add(e);
            }
        } catch (SQLException ex) {
            ex.getMessage();
        }
        return list;
    }

    public static int delete(Lecturer e) {
        int status = 0;
        try {
            Statement stmt = MySQL.getConnection().createStatement();
            String sqlDelete = "delete from lecturers where id=" + e.getId();
            status = stmt.executeUpdate(sqlDelete);
        } catch (SQLException ex) {
            ex.getMessage();
        }
        return status;
    }

    public static Lecturer getRecord(int id) {
        Lecturer e = new Lecturer();
        try {
            Connection connection = MySQL.getConnection();
            Statement stmt = connection.createStatement();
            String sqlSelect = "select * from lecturers where id=" + id;
            ResultSet rs = stmt.executeQuery(sqlSelect);
            if (rs.next()) {
                e.setId(rs.getInt(1));
                e.setLectID(rs.getString(2));
                e.setLectName(rs.getString(3));
                e.setLectEmail(rs.getString(4));
                e.setLectPassword(rs.getString(5));
                e.setLectPhone(rs.getString(6));
                e.setLectFaculty(rs.getInt(7));
            }
        } catch (SQLException ex) {
            ex.getMessage();
        }
        return e;
    }

    public static List<Lecturer> getAllLectbyFacID(int id) {
        List<Lecturer> list = new ArrayList<Lecturer>();
        try {
            Connection connection = MySQL.getConnection();
            Statement myStatement = connection.createStatement();
            String sqlSelect = "select * from lecturers where lect_faculty=" + id;
            ResultSet myRs = myStatement.executeQuery(sqlSelect);
            while (myRs.next()) {
                Lecturer e = new Lecturer();
                e.setId(myRs.getInt(1));
                e.setLectID(myRs.getString(2));
                e.setLectName(myRs.getString(3));
                e.setLectEmail(myRs.getString(4));
                e.setLectPassword(myRs.getString(5));
                e.setLectPhone(myRs.getString(6));
                e.setLectFaculty(myRs.getInt(7));
                list.add(e);
            }
        } catch (SQLException ex) {
            ex.getMessage();
        }
        return list;
    }
}
