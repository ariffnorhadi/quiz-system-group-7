/*
 * Talk is cheap. Show me the code.
 */
package database;

import java.sql.*;

/**
 *
 * @author Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
 */
public class MySQL {

    /**
     * This is a method for connecting to MySQL Database.
     *
     * @return Connection
     * @throws SQLException if fail
     */
    public static Connection getConnection() throws SQLException {
        Connection myConnection = null;

        try {

            Class.forName("com.mysql.jdbc.Driver");

            String url = "jdbc:mysql://localhost:3306/cse3999_quiz";
            String user = "root";
            String password = "";

            // create a connection to the database
            myConnection = DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException e) {
            System.out.println(e.getMessage());
        }
        return myConnection;
    }

}
