/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ExamWebApp;

public class LoginCheckClass {
    public static String userID = null;
    public static String userRole = null;
    public static int examID = 0;
    
    public String checkStaffLogin(String userEmail, String userPassword){
        DatabaseConnection checkStaffdb = new DatabaseConnection();
        String[] userAccount = checkStaffdb.checkUser(userEmail, userPassword);
        if(userAccount != null){
            userID = userAccount[1];
            userRole = userAccount[0];
            return userAccount[0];
        }else{
            return null;
        }
    }
    
    public int getExamView()
    {
        return examID;
    }
    
    public void setExamView(int newID)
    {
        examID = newID;
    }
}
