
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
    
    public DatabaseConnection(){
        String password = "8326.at8.6238";
        String username = "18agileteam8";
        String address = "jdbc:mysql://silva.computing.dundee.ac.uk/18agileteam8db";
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver loaded!");
        } catch (ClassNotFoundException e) {
            throw new IllegalStateException("Cannot find the driver in the classpath!", e);
        }
        
        try{
            conn = DriverManager.getConnection(address, username, password);
        }catch(SQLException exc){
            System.out.println("Error: " + exc);
        }
    }

  

    public Connection getConn() {
        return conn;
    }

    public void setConn(Connection conn) {
        this.conn = conn;
    }
 
    
    
    public String[][] getViewUsers()
    {
     try{
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
            while(reslt.next()){
                    ViewUsers[i][0] = reslt.getString("UserID");
                    ViewUsers[i][1] = reslt.getString("FirstName");
                    ViewUsers[i][2] = reslt.getString("Surname");
                    ViewUsers[i][3] = reslt.getString("Role");
                    ViewUsers[i][4] = reslt.getString("Email");
                    i++;
            }
            if(ViewUsers != null){
                return ViewUsers;
            }else{
                return null;
            }
        }catch(SQLException exc){
            System.out.println("Error: " + exc);
        }
        return null;
    
    
    
    }

    public String[] checkUser(String email, String password){
        try{
            stmt = conn.createStatement();
            reslt = stmt.executeQuery("SELECT Role,UserID FROM user WHERE Email = '" + email + "' AND Password = '" + password + "'");
           // reslt.next();
           String[] userAccount = new String[2];
            while(reslt.next()){
                userAccount[0] = reslt.getString("Role");
                userAccount[1] = reslt.getString("UserID");
            }
            if(userAccount != null){
                return userAccount;
            }else{
                return null;
            }
        }catch(SQLException exc){
            System.out.println("Error: " + exc);
        }
        return null;
    } 
    
    //Function that returns the module code for a given exam
    public String getExamModule(int examID)
    {
        //Try block to add the repsonse to the comment
        try
        {
            stmt = conn.createStatement();
            reslt = stmt.executeQuery("SELECT ModuleCode FROM exam WHERE ExamID = " + examID + ";");
            
            //return string from query
            if (reslt.next())
            {
                return reslt.getString(1);   
            }            
        }
        //Catch block for errors with SQL
        catch(SQLException e)
        {
            System.out.println("Error: " + e);
        }
        return null;
    }
    
    //Function that returns the comment for a given comment ID.
    public String getExamComment(int commentID)
    {
        //Try block to add the repsonse to the comment
        try
        {
            stmt = conn.createStatement();
            reslt = stmt.executeQuery("SELECT Comment FROM comment WHERE CommentID = " + commentID + ";");
            
            //return string from query
            if (reslt.next())
            {
                return reslt.getString(1);   
            }            
        }
        //Catch block for errors with SQL
        catch(SQLException e)
        {
            System.out.println("Error: " + e);
        }
        return null;
    }
    
        //Function that returns all comments for a given exam
    public String[] getAllExamComment(int examID)
    {
        //Try block to add the repsonse to the comment
        try
        {
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
            while (reslt.next())
            {
                list[i] = reslt.getString("Comment"); 
                i++;
            }        
            return list;
        }
        //Catch block for errors with SQL
        catch(SQLException e)
        {
            System.out.println("Error: " + e);
        }
        return null;
    }
    
    //Function that adds a comment to an exam in the database
    public boolean setComment(int examID, int userID, String newComment)
    {
        //Try block to add the repsonse to the comment
        try
        {
            stmt = conn.createStatement();
            int success = stmt.executeUpdate("INSERT INTO comment (ExamID, UserID, Comment) VALUES ( " + examID + ", " + userID + ", '" + newComment + "');");
            
            //return true if success, false otherwise
            if (success != 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        //Catch block for errors with SQL
        catch(SQLException e)
        {
            System.out.println("Error: " + e);
        }
        return false;
    }
    
    //Function that adds a response to a comment in the database
    public boolean setCommentResponse(int commentID, String newResponse)
    {
        //Try block to add the repsonse to the comment
        try
        {
            stmt = conn.createStatement();
            int success = stmt.executeUpdate("UPDATE comment SET Response = '" + newResponse + "' WHERE CommentID = " + commentID + ";");
            
            //return true if success, false otherwise
            if (success != 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        //Catch block for errors with SQL
        catch(SQLException e)
        {
            System.out.println("Error: " + e);
        }
        return false;
    }
    
    
     public boolean CreateAccount(String UserID, String FirstName,String SurName ,String Role,String Email, String Password)
    {
        //Try block to add the repsonse to the comment
        try
        {
            stmt = conn.createStatement();
            int success = stmt.executeUpdate("INSERT INTO user (`UserID`,`FirstName`,`Surname`,`Role`,`Email`,`Password`) VALUES" + UserID + FirstName + SurName + Role + Email + Password + ";");
            
            //return true if success, false otherwise
            if (success != 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        //Catch block for errors with SQL
        catch(SQLException e)
        {
            System.out.println("Error: " + e);
        }
        return false;
    }
    
    public int[][] getSignatures()
    {
     try{
            stmt = conn.createStatement();
            reslt = stmt.executeQuery("SELECT ExamID,TSID,TSSign1,IMID,IMSign,TSSign2,EVCID,EVCSign,TSSign3,EEID,EESign,TSSignFinal FROM signatures;");
  
            int rows = 0;
            if (reslt.last()) {
              rows = reslt.getRow();
              reslt.beforeFirst();
            }
            UserRows = rows;
            int[][] ViewExamID = new int[rows][12];
            int i = 0;
            while(reslt.next()){
                    ViewExamID[i][0] = reslt.getInt("ExamID");
                    ViewExamID[i][1] = reslt.getInt("TSID");
                    ViewExamID[i][2] = reslt.getInt("TSSign1");
                    ViewExamID[i][3] = reslt.getInt("IMID");
                    ViewExamID[i][4] = reslt.getInt("IMSign");
                    ViewExamID[i][5] = reslt.getInt("TSSign2");
                    ViewExamID[i][6] = reslt.getInt("EVCID");
                    ViewExamID[i][7] = reslt.getInt("EVCSign");
                    ViewExamID[i][8] = reslt.getInt("TSSign3");
                    ViewExamID[i][9] = reslt.getInt("EEID");
                    ViewExamID[i][10] = reslt.getInt("EESign");
                    ViewExamID[i][11] = reslt.getInt("TSSignFinal");
                    i++;
            }
            if(ViewExamID != null){
                return ViewExamID;
            }else{
                return null;
            }
        }catch(SQLException exc){
            System.out.println("Error: " + exc);
        }
        return null;
    
    
    
    }
    public boolean checkTSSignature1(){
        try{
            stmt = conn.createStatement();
            reslt = stmt.executeQuery("SELECT ExamID,TSSign1 FROM signatures;");
        
           int[] examProgress = new int[2];
            while(reslt.next()){
                examProgress[0] = reslt.getInt("ExamID");
                examProgress[1] = reslt.getInt("TSSign1");
                
            }
            if(examProgress != 0){
                return true;
            }else{
                return false;
            }
        }catch(SQLException exc){
            System.out.println("Error: " + exc);
        }
        return false;
        
    }
    
    public boolean setTSSignature1(int commentID, String newResponse)
    {
        //Try block to add the repsonse to the comment
        try
        {
            stmt = conn.createStatement();
            int success = stmt.executeUpdate("UPDATE comment SET Response = '" + newResponse + "' WHERE CommentID = " + commentID + ";");
            
            //return true if success, false otherwise
            if (success != 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        //Catch block for errors with SQL
        catch(SQLException e)
        {
            System.out.println("Error: " + e);
        }
        return false;
    }
    
    public boolean checkIMSignature(){
        try{
            stmt = conn.createStatement();
            reslt = stmt.executeQuery("SELECT ExamID,TSSign1 FROM signatures;");
        
           int[] examProgress = new int[2];
            while(reslt.next()){
                examProgress[0] = reslt.getInt("ExamID");
                examProgress[1] = reslt.getInt("IMSign");
                
            }
            if(examProgress != 0){
                return true;
            }else{
                return false;
            }
        }catch(SQLException exc){
            System.out.println("Error: " + exc);
        }
        return false;
        
    }
    
    public boolean checkTSSignature2(){
        try{
            stmt = conn.createStatement();
            reslt = stmt.executeQuery("SELECT ExamID,TSSign1 FROM signatures;");
        
           int[] examProgress = new int[2];
            while(reslt.next()){
                examProgress[0] = reslt.getInt("ExamID");
                examProgress[1] = reslt.getInt("TSSign2");
                
            }
            if(examProgress != 0){
                return true;
            }else{
                return false;
            }
        }catch(SQLException exc){
            System.out.println("Error: " + exc);
        }
        return false;
        
    }
    
    public boolean CheckEVCSignature(){
        try{
            stmt = conn.createStatement();
            reslt = stmt.executeQuery("SELECT ExamID,TSSign1 FROM signatures;");
        
           int[] examProgress = new int[2];
            while(reslt.next()){
                examProgress[0] = reslt.getInt("ExamID");
                examProgress[1] = reslt.getInt("EVCSign");
                
            }
            if(examProgress != 0){
                return true;
            }else{
                return false;
            }
        }catch(SQLException exc){
            System.out.println("Error: " + exc);
        }
        return false;
        
    }
    
    public boolean CheckTSSignature3(){
        try{
            stmt = conn.createStatement();
            reslt = stmt.executeQuery("SELECT ExamID,TSSign1 FROM signatures;");
        
           int[] examProgress = new int[2];
            while(reslt.next()){
                examProgress[0] = reslt.getInt("ExamID");
                examProgress[1] = reslt.getInt("TSSign3");
                
            }
            if(examProgress != 0){
                return true;
            }else{
                return false;
            }
        }catch(SQLException exc){
            System.out.println("Error: " + exc);
        }
        return false;
        
    }
    
    public boolean CheckEESignature(){
        try{
            stmt = conn.createStatement();
            reslt = stmt.executeQuery("SELECT ExamID,TSSign1 FROM signatures;");
        
           int[] examProgress = new int[2];
            while(reslt.next()){
                examProgress[0] = reslt.getInt("ExamID");
                examProgress[1] = reslt.getInt("EESign");
                
            }
            if(examProgress != 0){
                return true;
            }else{
                return false;
            }
        }catch(SQLException exc){
            System.out.println("Error: " + exc);
        }
        return false;
        
    }
    
    public boolean CheckTSSignatureFinal(){
        try{
            stmt = conn.createStatement();
            reslt = stmt.executeQuery("SELECT ExamID,TSSign1 FROM signatures;");
        
           int[] examProgress = new int[2];
            while(reslt.next()){
                examProgress[0] = reslt.getInt("ExamID");
                examProgress[1] = reslt.getInt("TSSignFinal");
                
            }
            if(examProgress != 0){
                return true;
            }else{
                return false;
            }
        }catch(SQLException exc){
            System.out.println("Error: " + exc);
        }
        return false;
        
    }
    
    public String[][] getCompletedExams(){
        try{
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
            while(reslt.next()){
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
            
            if(completedExams != null){
                return completedExams;
            }else{
                return null;
            }
        }catch(SQLException exc){
            System.out.println("Error: " + exc);
        }
        return null;
    }
    
    

    public String deadline(String role){
        try{
            stmt = conn.createStatement();
            reslt = stmt.executeQuery("SELECT Date FROM deadline WHERE Role = '"+ role +"' ;");
            
            String deadlineDate = null;
            
            reslt.next();
                deadlineDate = reslt.getString("Date");
            
            
            if(deadlineDate != null){
                return deadlineDate;
            }else{
                return null;
            }
        }catch(SQLException exc){
            System.out.println("Error: " + exc);
        }
        return null;
    }

  
    public String[][] getExamList(String ModuleCoordinator)
{
	try
	{
            stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT Title FROM exam WHERE ModuleCoordinator = " + ModuleCoordinator + ";");

            int row = 0;
            if (rs.last())
            {
                    row = rs.getRow();
                    rs.beforeFirst();
            }
            CompletedRows = row;
            String[][] staffExams = new String[row][14];
            int j = 0;
            while(rs.next())
            {
                    staffExams[j][0] = reslt.getString("ExamID");
                    staffExams[j][1] = reslt.getString("Title");
                    staffExams[j][2] = reslt.getString("School");
                    staffExams[j][3] = reslt.getString("ModuleCoordinator");
                    staffExams[j][4] = reslt.getString("ModuleCode");
                    staffExams[j][5] = reslt.getString("ExamType");
                    staffExams[j][6] = reslt.getString("ExamPeriod");
                    staffExams[j][7] = reslt.getString("ExamLevel");
                    staffExams[j][8] = reslt.getString("DateCreated");
                    staffExams[j][9] = reslt.getString("AuthorID");
                    staffExams[j][10] = reslt.getString("Deadline");
                    staffExams[j][11] = reslt.getString("Status");
                    staffExams[j][12] = reslt.getString("File");
                    staffExams[j][13] = reslt.getString("AssignedTo");
                    j++;
            }
            if(staffExams != null)
            {
                    return staffExams;
            } else {
                    System.out.println("The return is Null");
            }
	}
	catch(SQLException e)
	{
		System.out.println("Error: " + e);
	}
	return null;
}
    

}

 

