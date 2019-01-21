/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ExamWebApp;

public class LoginCheckClass {
    
    public static String makeItLower(String input){
        return input.toLowerCase();
    }
    
    public static boolean checkStaffLogin(String userEmail, String userPassword){
        String email = "test.user@dundee.ac.uk";
        String password = "Test123";
        
        if(email.equals(userEmail) && password.equals(userPassword)){
            return true;
        }else{
            return false;
        }
    }
}
