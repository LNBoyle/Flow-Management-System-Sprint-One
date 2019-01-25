

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ExamWebApp;

import java.sql.*;

/**
 *
 *
 */
public class DatabaseConnection {

    private Connection conn = null;
    private Statement stmt = null;
    private ResultSet reslt = null;
    public int CompletedRows = 0;
    public int UserRows = 0;
    public int CompletedRowss = 0;

    public DatabaseConnection() {
        String password = "8326.at8.6238";
        String username = "18agileteam8";
        String address = "jdbc:mysql://silva.computing.dundee.ac.uk/18agileteam8db";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver loaded!");
        } catch (ClassNotFoundException e) {
            throw new IllegalStateException("Cannot find the driver in the classpath!", e);
        }

        try {
            conn = DriverManager.getConnection(address, username, password);
        } catch (SQLException exc) {
            System.out.println("Error: " + exc);
        }
    }

    public Connection getConn() {
        return conn;
    }

    public void setConn(Connection conn) {
        this.conn = conn;
    }

    public String[][] getViewUsers() {
        try {
            stmt = conn.createStatement();
            reslt = stmt.executeQuery("SELECT UserID,FirstName,Surname,Role,Email FROM user;");

            int rows = 0;
            if (reslt.last()) {
                rows = reslt.getRow();
                reslt.beforeFirst();
            }
            UserRows = rows;
            String[][] ViewUsers = new String[rows][5];
            int i = 0;
            while (reslt.next()) {
                ViewUsers[i][0] = reslt.getString("UserID");
                ViewUsers[i][1] = reslt.getString("FirstName");
                ViewUsers[i][2] = reslt.getString("Surname");
                ViewUsers[i][3] = reslt.getString("Role");
                ViewUsers[i][4] = reslt.getString("Email");
                i++;
            }
            if (ViewUsers != null) {
                return ViewUsers;
            } else {
                return null;
            }
        } catch (SQLException exc) {
            System.out.println("Error: " + exc);
        }
        return null;

    }

    public String[] checkUser(String email, String password) {
        try {
            stmt = conn.createStatement();
            reslt = stmt.executeQuery("SELECT Role,UserID FROM user WHERE Email = '" + email + "' AND Password = '" + password + "'");
            // reslt.next();
            String[] userAccount = new String[2];
            while (reslt.next()) {
                userAccount[0] = reslt.getString("Role");
                userAccount[1] = reslt.getString("UserID");
            }
            if (userAccount != null) {
                return userAccount;
            } else {
                return null;
            }
        } catch (SQLException exc) {
            System.out.println("Error: " + exc);
        }
        return null;
    }

    //Function that returns the module code for a given exam
    public String getExamModule(int examID) {
        //Try block to add the repsonse to the comment
        try {
            stmt = conn.createStatement();
            reslt = stmt.executeQuery("SELECT ModuleCode FROM exam WHERE ExamID = " + examID + ";");

            //return string from query
            if (reslt.next()) {
                return reslt.getString(1);
            }
        } //Catch block for errors with SQL
        catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return null;
    }

    //Function that returns the comment for a given comment ID.
    public String getExamComment(int commentID) {
        //Try block to add the repsonse to the comment
        try {
            stmt = conn.createStatement();
            reslt = stmt.executeQuery("SELECT Comment FROM comment WHERE CommentID = " + commentID + ";");

            //return string from query
            if (reslt.next()) {
                return reslt.getString(1);
            }
        } //Catch block for errors with SQL
        catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return null;
    }

    //Function that returns all comments for a given exam
    public String[] getAllExamComment(int examID) {
        //Try block to add the repsonse to the comment
        try {
            stmt = conn.createStatement();
            reslt = stmt.executeQuery("SELECT Comment FROM comment WHERE examID = " + examID + ";");

            int rows = 0;
            if (reslt.last()) {
                rows = reslt.getRow();
                reslt.beforeFirst();
            }

            String[] list = new String[rows];
            int i = 0;
            //return string from query
            while (reslt.next()) {
                list[i] = reslt.getString("Comment");
                i++;
            }
            return list;
        } //Catch block for errors with SQL
        catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return null;
    }

    //Function that adds a comment to an exam in the database
    public boolean setComment(int examID, int userID, String newComment) {
        //Try block to add the repsonse to the comment
        try {
            stmt = conn.createStatement();
            int success = stmt.executeUpdate("INSERT INTO comment (ExamID, UserID, Comment) VALUES ( " + examID + ", " + userID + ", '" + newComment + "');");

            //return true if success, false otherwise
            if (success != 0) {
                return true;
            } else {
                return false;
            }
        } //Catch block for errors with SQL
        catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return false;
    }

    //Function that adds a response to a comment in the database
    public boolean setCommentResponse(int commentID, String newResponse) {
        //Try block to add the repsonse to the comment
        try {
            stmt = conn.createStatement();
            int success = stmt.executeUpdate("UPDATE comment SET Response = '" + newResponse + "' WHERE CommentID = " + commentID + ";");

            //return true if success, false otherwise
            if (success != 0) {
                return true;
            } else {
                return false;
            }
        } //Catch block for errors with SQL
        catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return false;
    }

    public boolean CreateAccount(String UserID, String FirstName, String SurName, String Role, String Email, String Password) {
        //Try block to add the repsonse to the comment
        try {
            stmt = conn.createStatement();
            int success = stmt.executeUpdate("INSERT INTO user (`UserID`,`FirstName`,`Surname`,`Role`,`Email`,`Password`) VALUES" + UserID + FirstName + SurName + Role + Email + Password + ";");

            //return true if success, false otherwise
            if (success != 0) {
                return true;
            } else {
                return false;
            }
        } //Catch block for errors with SQL
        catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return false;
    }

    public String[][] getCompletedExams() {
        try {
            stmt = conn.createStatement();
            reslt = stmt.executeQuery("SELECT * FROM exam WHERE Status = 'Completed' ;");

            int rows = 0;
            if (reslt.last()) {
                rows = reslt.getRow();
                reslt.beforeFirst();
            }
            CompletedRows = rows;
            String[][] completedExams = new String[rows][14];
            int i = 0;
            while (reslt.next()) {
                completedExams[i][0] = reslt.getString("ExamID");
                completedExams[i][1] = reslt.getString("Title");
                completedExams[i][2] = reslt.getString("School");
                completedExams[i][3] = reslt.getString("ModuleCoordinator");
                completedExams[i][4] = reslt.getString("ModuleCode");
                completedExams[i][5] = reslt.getString("ExamType");
                completedExams[i][6] = reslt.getString("ExamPeriod");
                completedExams[i][7] = reslt.getString("ExamLevel");
                completedExams[i][8] = reslt.getString("DateCreated");
                completedExams[i][9] = reslt.getString("AuthorID");
                completedExams[i][10] = reslt.getString("Deadline");
                completedExams[i][11] = reslt.getString("Status");
                completedExams[i][12] = reslt.getString("ExamPaper");
                completedExams[i][13] = reslt.getString("AssignedTo");
                i++;
            }

            if (completedExams != null) {
                return completedExams;
            } else {
                return null;
            }
        } catch (SQLException exc) {
            System.out.println("Error: " + exc);
        }
        return null;
    }

    public String deadline(String role) {
        try {
            stmt = conn.createStatement();
            reslt = stmt.executeQuery("SELECT Date FROM deadline WHERE Role = '" + role + "' ;");

            String deadlineDate = null;

            reslt.next();
            deadlineDate = reslt.getString("Date");

            if (deadlineDate != null) {
                return deadlineDate;
            } else {
                return null;
            }
        } catch (SQLException exc) {
            System.out.println("Error: " + exc);
        }
        return null;
    }

    public String[][] getExamList(String ModuleCoordinator) {
        try {
            stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT ExamID,Title,ModuleCode FROM exam WHERE ModuleCoordinator = '" + ModuleCoordinator + "' ;");

            int row = 0;
            if (rs.last()) {
                row = rs.getRow();
                rs.beforeFirst();
            }
            CompletedRowss = row;
            String[][] staffExams = new String[row][4];
            int j = 0;
            while (rs.next()) {
                staffExams[j][0] = Integer.toString(rs.getInt("ExamID"));
                staffExams[j][1] = rs.getString("Title");
                staffExams[j][2] = ModuleCoordinator;
                staffExams[j][3] = rs.getString("ModuleCode");
                j++;
            }
            if (staffExams != null) {
                return staffExams;
            } else {
                System.out.println("The return is Null");
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return null;
    }

    public String[][] getExamLists() {
        ResultSet rs;
        ResultSet externalExaminer = null;
        ResultSet vettingCommittee = null;
        ResultSet internalModerator = null;
        try {
            stmt = conn.createStatement();
            Statement external = conn.createStatement();
            Statement internal = conn.createStatement();
            Statement vetting = conn.createStatement();
            switch (LoginCheckClass.userRole) {
                case "Internal Moderator": {
                    rs = stmt.executeQuery("SELECT ExamID,Title,ModuleCode,ModuleCoordinator,ExternalExaminer,ExamVettingComittee FROM exam WHERE InternalModerator = '" + LoginCheckClass.userID + "' ;");

                    break;
                }
                case "External Examiner": {
                    rs = stmt.executeQuery("SELECT ExamID,Title,ModuleCode,ModuleCoordinator,InternalModerator,ExamVettingComittee FROM exam WHERE ExternalExaminer = '" + LoginCheckClass.userID + "' ;");

                    break;
                }
                case "Exam Vetting Comittee": {
                    rs = stmt.executeQuery("SELECT ExamID,Title,ModuleCode,ModuleCoordinator,InternalModerator,ExternalExaminer FROM exam WHERE ExamVettingComittee = '" + LoginCheckClass.userID + "' ;");

                    break;
                }
                default:
                    return null;
            }

            //ResultSet rs = stmt.executeQuery("SELECT ExamID,Title,ModuleCode FROM exam WHERE ModuleCoordinator = '" + ModuleCoordinator + "' ;");
            int row = 0;
            if (rs.last()) {
                row = rs.getRow();
                rs.beforeFirst();
            }
            CompletedRowss = row;
            String[][] staffExams = new String[row][6];
            int j = 0;
            while (rs.next()) {
                switch (LoginCheckClass.userRole) {
                    case "Internal Moderator": {

                        externalExaminer = external.executeQuery("SELECT FirstName, Surname FROM user WHERE UserID = '" + rs.getInt("ExternalExaminer") + "' ;");
                        vettingCommittee = vetting.executeQuery("SELECT FirstName, Surname FROM user WHERE UserID = '" + rs.getInt("ExamVettingComittee") + "' ;");
                        break;
                    }
                    case "External Examiner": {

                        internalModerator = internal.executeQuery("SELECT FirstName, Surname FROM user WHERE UserID = '" + rs.getString("InternalModerator") + "' ;");
                        vettingCommittee = vetting.executeQuery("SELECT FirstName, Surname FROM user WHERE UserID = '" + rs.getString("ExamVettingComittee") + "' ;");
                        break;
                    }
                    case "Exam Vetting Comittee": {

                        internalModerator = internal.executeQuery("SELECT FirstName, Surname FROM user WHERE UserID = '" + rs.getString("InternalModerator") + "' ;");
                        externalExaminer = external.executeQuery("SELECT FirstName, Surname FROM user WHERE UserID = '" + rs.getString("ExternalExaminer") + "' ;");
                        break;
                    }
                    default:
                        return null;
                }

                switch (LoginCheckClass.userRole) {
                    case "Internal Moderator": {
                        externalExaminer.next();
                        vettingCommittee.next();
                        staffExams[j][0] = Integer.toString(rs.getInt("ExamID"));
                        staffExams[j][1] = rs.getString("Title");
                        staffExams[j][2] = rs.getString("ModuleCode");
                        staffExams[j][3] = rs.getString("ModuleCoordinator");
                        if(rs.getString("ExternalExaminer")!=null){
                            staffExams[j][4] = externalExaminer.getString("FirstName") + " " + externalExaminer.getString("Surname");
                        }else{
                            staffExams[j][4] = "Not Assigned";
                        }
                          if(rs.getString("ExamVettingComittee")!=null){
                             staffExams[j][5] = vettingCommittee.getString("FirstName") + " " + vettingCommittee.getString("Surname");
                        }else{
                            staffExams[j][5] = "Not Assigned";
                        }
                      
                        break;
                    }
                    case "External Examiner": {
                        internalModerator.next();
                           vettingCommittee.next();
                        staffExams[j][0] = Integer.toString(rs.getInt("ExamID"));
                        staffExams[j][1] = rs.getString("Title");
                        staffExams[j][2] = rs.getString("ModuleCode");
                        staffExams[j][3] = rs.getString("ModuleCoordinator");
                           if(rs.getString("InternalModerator")!=null){
                            staffExams[j][4] = internalModerator.getString("FirstName") + " " + internalModerator.getString("Surname");
                        }else{
                            staffExams[j][4] = "Not Assigned";
                        }
                           if(rs.getString("ExamVettingComittee")!=null){
                             staffExams[j][5] = vettingCommittee.getString("FirstName") + " " + vettingCommittee.getString("Surname");
                        }else{
                            staffExams[j][5] = "Not Assigned";
                        }
                        break;
                    }
                    case "Exam Vetting Comittee": {
                           internalModerator.next();
                            externalExaminer.next();
                        staffExams[j][0] = Integer.toString(rs.getInt("ExamID"));
                        staffExams[j][1] = rs.getString("Title");
                        staffExams[j][2] = rs.getString("ModuleCode");
                        staffExams[j][3] = rs.getString("ModuleCoordinator");
                          if(rs.getString("InternalModerator")!=null){
                            staffExams[j][4] = internalModerator.getString("FirstName") + " " + internalModerator.getString("Surname");
                        }else{
                            staffExams[j][4] = "Not Assigned";
                        }
                   
                       if(rs.getString("ExternalExaminer")!=null){
                            staffExams[j][5] = externalExaminer.getString("FirstName") + " " + externalExaminer.getString("Surname");
                        }else{
                            staffExams[j][5] = "Not Assigned";
                        }
                        break;
                    }
                    default:
                        return null;
                }
                j++;
            }
            if (staffExams != null) {
                return staffExams;
            } else {
                System.out.println("The return is Null");
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return null;
    }

}

