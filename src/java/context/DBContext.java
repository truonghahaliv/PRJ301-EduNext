/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package context ;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Admin
 */
public class DBContext {
    protected Connection connect;
    public DBContext(){
        try {
            String url = "jdbc:sqlserver://"+serverName+":"+portNumber+
                    ";databaseName="+dbName;
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connect = DriverManager.getConnection(url, userID, password);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    private final String serverName = "localhost";
    private final String dbName = "PRJ_EduNext";
    private final String portNumber = "1433";
    private final String userID = "sa";
    private final String password = "hunghung03";
    
   
    
}
