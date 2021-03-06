/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ExamWebApp;

/**
 *
 * @author Sebastian
 */
public class DeadLine {
    
    public String deadline(String role){
        LoginCheckClass loggedin = new LoginCheckClass();
        return ifDeadline(role);
    }
    
    /*
    REFACTORED CODE - This function below was added as in the switch statment
    above the following line was repeated for each case but with the "role"
    hard coded in for each case. So this was combined into the below
    function and then is called by the above function.
    */
    public String ifDeadline(String role){
        DatabaseConnection db = new DatabaseConnection();
        if(db.deadline(role) != null){
            return db.deadline(role);
        }else{
            return " ";
        }
    }
}

