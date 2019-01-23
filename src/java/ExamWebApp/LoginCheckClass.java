/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ExamWebApp;

public class LoginCheckClass {

    public static String checkStaffLogin(String userEmail, String userPassword){
        DatabaseConnection checkStaffdb = new DatabaseConnection();
        String role = checkStaffdb.checkUser(userEmail, userPassword);
        if(role != null){
            return role;
        }else{
            return null;
        }
    }
}
