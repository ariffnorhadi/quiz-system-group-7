/*
 * Talk is cheap. Show me the code.
 */
package dao;

import database.MySQL;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.Admin;

/**
 *
 * @author Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
 */
public class AdminDAO {

    /**
     * This method is used to update the password of the lecturer
     *
     * @param e e is the instance of the User class.
     * @return status. if sql command is executed, then the status number will
     * be changed. if not then the status remain unchanged.
     */
    public int updatePass(Admin e) {
        int status = 0;
        try {
            String sqlUpdatePass = "update admins set admin_password=? where id=?";
            PreparedStatement pstmt = MySQL.getConnection().prepareStatement(sqlUpdatePass);
            pstmt.setString(1, e.getAdmin_password());
            pstmt.setInt(2, e.getId());
            status = pstmt.executeUpdate();
        } catch (SQLException ex) {
            ex.getMessage();
        }
        return status;
    }

}
