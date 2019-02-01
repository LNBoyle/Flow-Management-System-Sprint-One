/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ExamWebApp;

public class LoginCheckClass {
    public static String userID = null;
    //roles is array with #0 being exam setter #1 being internal mod #2 being external examiner #3 external vetting comittee #4 being school office #5 local exam officer
    public static String[] roles = new String[6];

    public boolean checkStaffLogin(String email, String password){
        DatabaseConnection db = new DatabaseConnection();
        String[] userAccount = db.checkUser(email, password);
        
        if(userAccount != null){
            userID = userAccount[0];
            for(int i=0; i<6; i++){
                roles[i] = userAccount[i+1];
            }
            return true;
        }else{
            return false;
        }
    }
 
    public void logout(){
        userID = null;
        roles = new String[6];
    }
    
    
}
