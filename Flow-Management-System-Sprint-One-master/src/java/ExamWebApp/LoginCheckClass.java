/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ExamWebApp;

public class LoginCheckClass {

    public static boolean checkStaffLogin(String userEmail, String userPassword){
        DatabaseConnection checkStaffdb = new DatabaseConnection();
        
        if(checkStaffdb.checkUser(userEmail, userPassword)){
            return true;
        }else{
            return false;
        }
    }
}
