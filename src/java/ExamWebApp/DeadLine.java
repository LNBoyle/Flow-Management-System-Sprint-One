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
    
    public String deadline(){
        DatabaseConnection db = new DatabaseConnection();
        LoginCheckClass loggedin = new LoginCheckClass();
        
        switch (loggedin.userRole) {
            case "Exam Vetting Comittee":
                if(db.deadline("Exam Vetting Comittee") != null){
                    return db.deadline("Exam Vetting Comittee");
                }else{
                    return " ";
                }
            case "Internal Moderator":
                if(db.deadline("Internal Moderator") != null){
                    return db.deadline("Internal Moderator");
                }else{
                    return " ";
                }
            case "External Examiner":
                if(db.deadline("External Examiner") != null){
                    return db.deadline("External Examiner");
                }else{
                    return " ";
                }
            case "Exam Setter":
                if(db.deadline("Exam Setter") != null){
                    return db.deadline("Exam Setter");
                }else{
                    return " ";        
                }
            default:
                break;
        }
        return null;
    }
}


