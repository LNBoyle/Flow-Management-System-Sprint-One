

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ExamWebApp;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.Date;
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
            reslt = stmt.executeQuery("SELECT UserID,FirstName,Surname,Email FROM user;");

            int rows = 0;
            if (reslt.last()) {
                rows = reslt.getRow();
                reslt.beforeFirst();
            }
            UserRows = rows;
            String[][] ViewUsers = new String[rows][4];
            int i = 0;
            while (reslt.next()) {
                ViewUsers[i][0] = reslt.getString("UserID");
                ViewUsers[i][1] = reslt.getString("FirstName");
                ViewUsers[i][2] = reslt.getString("Surname");
                ViewUsers[i][3] = reslt.getString("Email");
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
    
    
        public boolean AssignRole(String UserID, int es,int im,int em,int evc,int so,int leo)
    {
    
        try {
            stmt = conn.createStatement();
            int success = stmt.executeUpdate("UPDATE user SET ExamSetter = '" + es + "', InternalModerator ='"+ im + "', ExternalExaminer = '" + em +"', ExamVettingComittee = '"+ evc + "', SchoolOffice = '"+ so + "', LocalExamOfficer = '"+ leo +"' WHERE UserID = '" + UserID + "';");
                
            //return true if success, false otherwise
            if (success == 0) {
                return false;
            } else {
                return true;
            }
        } //Catch block for errors with SQL
        catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return false;
    }
    
    
    public String[] checkUser(String email, String password){
        try{
            stmt = conn.createStatement();
            reslt = stmt.executeQuery("SELECT UserID FROM user WHERE Email= '"+ email + "' AND Password = '" + password + "'");
            String[] userAccount = new String[7];
            while(reslt.next()){
                userAccount[0] = reslt.getString("UserID");
            }
            if(userAccount[0] != null){
                stmt = conn.createStatement();
                reslt = stmt.executeQuery("SELECT ExamSetter, InternalModerator, ExternalExaminer, ExamVettingComittee, SchoolOffice, LocalExamOfficer FROM role WHERE UserID = " + userAccount[0]);
                while(reslt.next()){
                    userAccount[1] = reslt.getString("ExamSetter");
                    userAccount[2] = reslt.getString("InternalModerator");
                    userAccount[3] = reslt.getString("ExternalExaminer");
                    userAccount[4] = reslt.getString("ExamVettingComittee");
                    userAccount[5] = reslt.getString("SchoolOffice");
                    userAccount[6] = reslt.getString("LocalExamOfficer");
                }
                return userAccount;
            }else{
                return null;
            }
        }catch(SQLException exc){
            
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

    //Function that returns all the exams that are not yet .
    public String[][] getAllUnassignedExams() {
        //Try block to add the repsonse to the comment
        try {
            stmt = conn.createStatement();
            reslt = stmt.executeQuery("SELECT exam.ModuleCode, exam.examID FROM exam LEFT JOIN assignedexams ON exam.examID = assignedexams.AssignedExamID WHERE assignedexams.ModuleCode IS NULL;");

            int rows = 0;
            if (reslt.last()) {
                rows = reslt.getRow();
                reslt.beforeFirst();
            }

            String[][] list = new String[rows][2];
            int i = 0;
            //return string from query
            while (reslt.next()) {
                list[i][0] = reslt.getString("ModuleCode");
                list[i][1] = reslt.getString("examID");
                i++;
            }
            return list;
        } //Catch block for errors with SQL
        catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return null;
    }
    
    public boolean allocateExams(String[] examIDs, int setter, int internal, int external, int vet)
    {
        String[] examModule = new String[examIDs.length];
        String[] examPeriod = new String[examIDs.length];
        String[] examLevel = new String[examIDs.length];
        String[] list = new String[3];
        int success = 0;
        
        for (int i = 0; i < examIDs.length; i++)
        {
            try
            {
                stmt = conn.createStatement();
                reslt = stmt.executeQuery("SELECT ModuleCode, ExamPeriod, ExamLevel FROM exam WHERE examID = " + examIDs[i] + ";");
                
                //return string from query
                while (reslt.next())
                {
                    list[0] = reslt.getString("ModuleCode");
                    list[1] = reslt.getString("ExamPeriod");
                    list[2] = reslt.getString("ExamLevel");
                }
            }
            catch (SQLException e)
            {    
                System.out.println("Error: " + e);
                return false;
            }
            
            try
            {
                stmt = conn.createStatement();
                success = stmt.executeUpdate("INSERT INTO assignedexams VALUES (" + examIDs[i] + ", '" + list[0] + "', '" + list[1] + "', '" + list[2] + "', " + setter + ", " + internal + ", " + external + ", " + vet + ");");
            }
            catch (SQLException e)
            {    
                System.out.println("Error: " + e);
                return false;
            }
        }
        if (success == 1)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    
    //Gets all exam setters
    public String[][] getAllSetters() {
        try {
            stmt = conn.createStatement();
            reslt = stmt.executeQuery("SELECT UserID, FirstName, Surname FROM user WHERE ExamSetter = 1;");

            int rows = 0;
            if (reslt.last()) {
                rows = reslt.getRow();
                reslt.beforeFirst();
            }
            CompletedRows = rows;
            String[][] list = new String[rows][3];
            int i = 0;
            while (reslt.next()) {
                list[i][0] = reslt.getString("UserID");
                list[i][1] = reslt.getString("FirstName");
                list[i][2] = reslt.getString("Surname");
                i++;
            }

            if (list != null) {
                return list;
            } else {
                return null;
            }
        } catch (SQLException exc) {
            System.out.println("Error: " + exc);
        }
        return null;
    }
    
    //Gets all internal moderators
    public String[][] getAllInternalMods() {
        try {
            stmt = conn.createStatement();
            reslt = stmt.executeQuery("SELECT UserID, FirstName, Surname FROM user WHERE InternalModerator = 1;");

            int rows = 0;
            if (reslt.last()) {
                rows = reslt.getRow();
                reslt.beforeFirst();
            }
            CompletedRows = rows;
            String[][] list = new String[rows][3];
            int i = 0;
            while (reslt.next()) {
                list[i][0] = reslt.getString("UserID");
                list[i][1] = reslt.getString("FirstName");
                list[i][2] = reslt.getString("Surname");
                i++;
            }

            if (list != null) {
                return list;
            } else {
                return null;
            }
        } catch (SQLException exc) {
            System.out.println("Error: " + exc);
        }
        return null;
    }
    
    //Gets all external examiners
    public String[][] getAllExternalExam() {
        try {
            stmt = conn.createStatement();
            reslt = stmt.executeQuery("SELECT UserID, FirstName, Surname FROM user WHERE ExternalExaminer = 1;");

            int rows = 0;
            if (reslt.last()) {
                rows = reslt.getRow();
                reslt.beforeFirst();
            }
            CompletedRows = rows;
            String[][] list = new String[rows][3];
            int i = 0;
            while (reslt.next()) {
                list[i][0] = reslt.getString("UserID");
                list[i][1] = reslt.getString("FirstName");
                list[i][2] = reslt.getString("Surname");
                i++;
            }

            if (list != null) {
                return list;
            } else {
                return null;
            }
        } catch (SQLException exc) {
            System.out.println("Error: " + exc);
        }
        return null;
    }
    
    //Gets all exam vetters
    public String[][] getAllExamVets() {
        try {
            stmt = conn.createStatement();
            reslt = stmt.executeQuery("SELECT UserID, FirstName, Surname FROM user WHERE ExamVettingComittee = 1;");

            int rows = 0;
            if (reslt.last()) {
                rows = reslt.getRow();
                reslt.beforeFirst();
            }
            CompletedRows = rows;
            String[][] list = new String[rows][3];
            int i = 0;
            while (reslt.next()) {
                list[i][0] = reslt.getString("UserID");
                list[i][1] = reslt.getString("FirstName");
                list[i][2] = reslt.getString("Surname");
                i++;
            }

            if (list != null) {
                return list;
            } else {
                return null;
            }
        } catch (SQLException exc) {
            System.out.println("Error: " + exc);
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
        Date dNow = new Date();
        SimpleDateFormat ft = new SimpleDateFormat (" dd/MM/yyyy hh:mm");
        String timeStamp = ft.format(dNow);
        try {
            stmt = conn.createStatement();
            int success = stmt.executeUpdate("INSERT INTO comment (ExamID, UserID, Comment, CommentTimeStamp) VALUES ( " + examID + ", " + userID + ", '" + newComment + "', '" + timeStamp +"');");

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
        
    public boolean DeleteAccount(String UserID) {
        //Try block to add the repsonse to the comment
        try {
            stmt = conn.createStatement();
            int success = stmt.executeUpdate("DELETE FROM user WHERE UserID = '" + UserID + "';"); 
                
            //return true if success, false otherwise
            if (success == 0) {
                return false;
            } else {
                return true;
            }
        } //Catch block for errors with SQL
        catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return false;
    }
        
    public boolean SetDeadline(String Role, String Date) {
        //Try block to add the repsonse to the comment
        try {
            stmt = conn.createStatement();
            int success = stmt.executeUpdate("UPDATE deadline SET Date = '" + Date + "' WHERE Role = '" + Role + "';"); 
                
            //return true if success, false otherwise
            if (success == 0) {
                return false;
            } else {
                return true;
            }
        } //Catch block for errors with SQL
        catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return false;
    }
        
        public boolean UpdateAccount(String UserID, String FirstName, String SurName, String Email, String Password) {
        //Try block to add the repsonse to the comment
        try {
            stmt = conn.createStatement();
            int success = stmt.executeUpdate("UPDATE user SET FirstName = '" + FirstName + "', Surname ='"+ SurName + "', Email = '" + Email +"', Password = '"+ Password + "' WHERE UserID = '" + UserID + "';");
                
            //return true if success, false otherwise
            if (success == 0) {
                return false;
            } else {
                return true;
            }
        } //Catch block for errors with SQL
        catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return false;
    }
    
    
    
    public boolean CreateAccount(String UserID, String FirstName, String SurName, String Email, String Password, int es,int im, int em,int evc,int so,int leo) {
        //Try block to add the repsonse to the comment
        try {
            stmt = conn.createStatement();
            int success = stmt.executeUpdate("INSERT INTO user (UserID, FirstName, Surname, Email, Password, ExamSetter, InternalModerator, ExternalExaminer, ExamVettingComittee, SchoolOffice,LocalExamOfficer) VALUES ('" + UserID + "','" + FirstName + "', '" + SurName + "', '" + Email + "', '" + Password + "', '" + es + "', '" + im + "', '" + em + "', '" + evc + "', '" + so + "', '" + leo + "');");
                
            //return true if success, false otherwise
            if (success == 0) {
                return false;
            } else {
                return true;
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
            String[][] completedExams = new String[rows][13];
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
                completedExams[i][8] = reslt.getString("Semester");
                completedExams[i][9] = reslt.getString("Year");
                completedExams[i][10] = reslt.getString("Status");
                completedExams[i][11] = reslt.getString("ExamPaper");
                completedExams[i][12] = reslt.getString("SolutionsPaper");
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
    
    public String[][] getExamLists(String role) {
        ResultSet rs;
        ResultSet commentCheckResult = null;
        ResultSet externalExaminer = null;
        ResultSet vettingCommittee = null;
        ResultSet internalModerator = null;
        String userID = LoginCheckClass.userID; 
        try {
            Statement satemnt = conn.createStatement();
            Statement commentCheck = conn.createStatement();
            Statement external = conn.createStatement();
            Statement internal = conn.createStatement();
            Statement vetting = conn.createStatement();

            switch (role) {
                case "Internal Moderator": {
                    rs = satemnt.executeQuery("SELECT ExamID,exam.Title,exam.ModuleCode,exam.ModuleCoordinator, assignedexams.ExternalExaminer, assignedexams.ExamVettingComittee FROM exam INNER JOIN assignedexams ON exam.ExamID = assignedexams.AssignedExamID WHERE assignedexams.InternalModerator = '" + LoginCheckClass.userID + "' ;");
                    commentCheckResult = commentCheck.executeQuery("SELECT exam.ExamID FROM exam INNER JOIN assignedexams ON exam.ExamID = assignedexams.AssignedExamID INNER JOIN comment ON exam.ExamID = comment.ExamID  WHERE assignedexams.InternalModerator = '" + LoginCheckClass.userID + "' AND assignedexams.InternalModerator = comment.userID ;");
                    break;
                }
                case "External Examiner": {
                    rs = satemnt.executeQuery("SELECT exam.ExamID,exam.Title,exam.ModuleCode,exam.ModuleCoordinator, assignedexams.InternalModerator, assignedexams.ExamVettingComittee FROM exam INNER JOIN assignedexams ON exam.ExamID = assignedexams.AssignedExamID INNER JOIN comment ON exam.ExamID = comment.ExamID  WHERE assignedexams.ExternalExaminer = '" + LoginCheckClass.userID + "' AND assignedexams.ExamVettingComittee = comment.userID ;");
                    commentCheckResult = commentCheck.executeQuery("SELECT exam.ExamID FROM exam INNER JOIN assignedexams ON exam.ExamID = assignedexams.AssignedExamID INNER JOIN comment ON exam.ExamID = comment.ExamID  WHERE assignedexams.ExternalExaminer = '" + LoginCheckClass.userID + "' AND assignedexams.ExternalExaminer = comment.userID ;");
                    break;
                }
                case "Exam Vetting Comittee": {
                    rs = satemnt.executeQuery("SELECT exam.ExamID,exam.Title,exam.ModuleCode,exam.ModuleCoordinator, assignedexams.InternalModerator, assignedexams.ExternalExaminer FROM exam INNER JOIN assignedexams ON exam.ExamID = assignedexams.AssignedExamID INNER JOIN comment ON exam.ExamID = comment.ExamID  WHERE assignedexams.ExamVettingComittee = '" + userID + "' AND assignedexams.InternalModerator = comment.userID ;");
                    commentCheckResult = commentCheck.executeQuery("SELECT exam.ExamID FROM exam INNER JOIN assignedexams ON exam.ExamID = assignedexams.AssignedExamID INNER JOIN comment ON exam.ExamID = comment.ExamID  WHERE assignedexams.ExamVettingComittee = '" + userID + "' AND assignedexams.ExamVettingComittee = comment.userID ;");
                    break;
                }
                default:
                    return null;
            }

            //ResultSet rs = stmt.executeQuery("SELECT ExamID,Title,ModuleCode FROM exam WHERE ModuleCoordinator = '" + ModuleCoordinator + "' ;");
            int row = 0;
            if (rs.last()) {
                if(commentCheckResult.last()){
                    row = rs.getRow() - commentCheckResult.getRow();
                }else{
                    row = rs.getRow();
                }
                rs.beforeFirst();
                commentCheckResult.beforeFirst();
            }
            CompletedRowss = row;
            String[][] staffExams = new String[row][6];
            int j = 0;
            while (rs.next()) {
                switch (role) {
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

                switch (role) {
                    case "Internal Moderator": {
                        if(commentCheckResult.next()){
                            if(commentCheckResult.getInt("ExamID") == rs.getInt("ExamID")){
                                j--;
                                break;
                            }
                        }
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
                        if(commentCheckResult.next()){
                            if(commentCheckResult.getInt("ExamID") == rs.getInt("ExamID")){
                                j--;
                                break;
                            }
                        }else{
                            j--;
                            break;
                        }
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
                        if(commentCheckResult.next()){
                            if(commentCheckResult.getInt("ExamID") == rs.getInt("ExamID")){
                                j--;
                                break;
                            }
                        }else{
                            j--;
                            break;
                        }
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
    
    public boolean checkForExternalExam(int examID, int userID){
        try {
            stmt = conn.createStatement();
            reslt = stmt.executeQuery("SELECT AssignedExamID FROM assignedexams WHERE AssignedExamID = " + examID + " AND ExternalExaminer = " + userID +" ;");
            
            if (reslt.next()) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException exc) {
            System.out.println("Error: " + exc);
        }
        return false;
    }
    
    public boolean markExamCompleted(int examID){
        try {
            stmt = conn.createStatement();
            int success = stmt.executeUpdate("UPDATE exam SET status = 'Completed' WHERE ExamID = " + examID + " ;");
            
            if(success != 0){
                return true;
            }else{
                return false;
            }
        } catch (SQLException exc) {
            System.out.println("Error: " + exc);
        }
        return false;
    }
    
    public String[][] getFullySignedExams(){
        ResultSet commentexamrs = null;
        Statement commentexamstmt = null;
        try {
            stmt = conn.createStatement();
            reslt = stmt.executeQuery("SELECT exam.* FROM exam INNER JOIN assignedexams ON exam.ExamID = assignedexams.AssignedExamID WHERE assignedexams.ExamSetter = " + LoginCheckClass.userID + " AND exam.status != 'Completed' ;");
            
            int row = 0;
            if (reslt.last()) {
                row = reslt.getRow();
                reslt.beforeFirst();
            }
            CompletedRowss = row;
            String[][] staffExams = new String[row][13];
            int j = 0;
            
            while (reslt.next()) {
                int examID = reslt.getInt("ExamID");
                commentexamstmt = conn.createStatement();
                commentexamrs = commentexamstmt.executeQuery("SELECT ExamID FROM comment WHERE ExamID = " + examID  + " ;");
                if (commentexamrs.last()) {
                row = commentexamrs.getRow();
                commentexamrs.beforeFirst();
                }
                if(row >= 3){
                    staffExams[j][0] = reslt.getString("ExamID");
                    staffExams[j][1] = reslt.getString("Title");
                    staffExams[j][2] = reslt.getString("School");
                    staffExams[j][3] = reslt.getString("ModuleCoordinator");
                    staffExams[j][4] = reslt.getString("ModuleCode");
                    staffExams[j][5] = reslt.getString("ExamType");
                    staffExams[j][6] = reslt.getString("ExamPeriod");
                    staffExams[j][7] = reslt.getString("ExamLevel");
                    staffExams[j][8] = reslt.getString("Semester");
                    staffExams[j][9] = reslt.getString("Year");
                    staffExams[j][10] = reslt.getString("Status");
                    staffExams[j][11] = reslt.getString("ExamPaper");
                    staffExams[j][12] = reslt.getString("SolutionsPaper");
                    j++;
                }
                
            }
            CompletedRowss = j;
            return staffExams;
        } catch (SQLException exc) {
            System.out.println("Error: " + exc);
        }
        return null;
    }

}

