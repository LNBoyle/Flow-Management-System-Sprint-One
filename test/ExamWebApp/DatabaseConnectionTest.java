/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ExamWebApp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Jordan
 */
public class DatabaseConnectionTest {
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of getViewUsers method, of class DatabaseConnection.
     */
    @Test
    public void testGetViewUsers() {
        System.out.println("getViewUsers");
        DatabaseConnection instance = new DatabaseConnection();
        String expResult = "Liam";
        String[][] result = instance.getViewUsers();
        if (!(result[0][1].equals(expResult)))
        {
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
        }
    }

    /**
     * Test of checkUser method, of class DatabaseConnection.
     */
    @Test
    public void testCheckUserTrue() {
        DatabaseConnection dbConnect = new DatabaseConnection();
        System.out.println("CheckStaffLogin Correct Login Credentials");
        String email = "l.boyle@dundee.ac.uk";
        String password = "Liam123";
        String[] expResult = {"10001","0","1","0","0","0","0"};
        
        String[] result = dbConnect.checkUser(email, password);
        
        if(!Arrays.equals(expResult, result)){
            fail("Error somthing went wrong");
        }
    }
    
    /**
     * Test of checkUser method, of class DatabaseConnection.
     */
    @Test
    public void testCheckUserFalse() {
        DatabaseConnection dbConnect = new DatabaseConnection();
        System.out.println("CheckStaffLogin Incorrect Login Credentials");
        String email = "test.user@dundee.ac.uk";
        String password = "Tested123";
        String[] expResult = null;
        
        String[] result = dbConnect.checkUser(email, password);
        
        if(!Arrays.equals(expResult, result)){
            fail("Error somthing went wrong");
        }
        
    }

    /**
     * Test of getExamModule method, of class DatabaseConnection.
     */
    @Test
    public void testGetExamModule() {
        System.out.println("getExamModule");
        int examID = 00000001;
        DatabaseConnection instance = new DatabaseConnection();
        String expResult = "AC310001";
        String result = instance.getExamModule(examID);
        if (!(result.equals(expResult)))
        {
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
        }
    }
    
    /**
     * Test of getAllUnassignedExams method, of class DatabaseConnection.
     */
    @Test
    public void testGetAllUnassignedExams() {
        System.out.println("getAllUnassignedExams");
        DatabaseConnection db = new DatabaseConnection();
        String expCode = "AC350001";
        int expID = 5;
        String[][] results = db.getAllUnassignedExams();
        
        if (results == null)
        {
            fail("Results returned were null. Likely SQL error.");
        }
        
        if (!expCode.equals(results[0][0]))
        {
            fail("Incorrect module code. Check database is reset.");
        }
        
        int resultID = Integer.parseInt(results[1][1]);
        
        if (expID != resultID)
        {
            fail("Incorrect exam ID. Check database is reset.");
        }
    }

    /**
     * Test of getAllSetters method, of class DatabaseConnection.
     */
    @Test
    public void testgetAllSetters() {
        System.out.println("getAllSetters");
        DatabaseConnection db = new DatabaseConnection();
        String expFName = "Jordan";
        int expID = 10007;
        String[][] results = db.getAllSetters();
        
        if (results == null)
        {
            fail("Results returned were null. Likely SQL error.");
        }
        
        if (!expFName.equals(results[1][1]))
        {
            fail("Incorrect first name. Check database is reset.");
        }
        
        int resultID = Integer.parseInt(results[1][0]);
        
        if (expID != resultID)
        {
            fail("Incorrect user ID. Check database is reset.");
        }
    }       
    
    /**
     * Test of getAllInternalMods method, of class DatabaseConnection.
     */
    @Test
    public void testgetAllInternalMods() {
        System.out.println("getAllInternalMods");
        DatabaseConnection db = new DatabaseConnection();
        String expFName = "Liam";
        int expID = 10002;
        String[][] results = db.getAllInternalMods();
        
        if (results == null)
        {
            fail("Results returned were null. Likely SQL error.");
        }
        
        if (!expFName.equals(results[0][1]))
        {
            fail("Incorrect first name. Check database is reset.");
        }
        
        int resultID = Integer.parseInt(results[1][0]);
        
        if (expID != resultID)
        {
            fail("Incorrect user ID. Check database is reset.");
        }
    }        
    
    /**
     * Test of getAllExternalExam method, of class DatabaseConnection.
     */
    @Test
    public void testGetAllExternalExam() {
        System.out.println("getAllExternalExam");
        DatabaseConnection db = new DatabaseConnection();
        String expFName = "Calum";
        int expID = 10005;
        String[][] results = db.getAllExternalExam();
        
        if (results == null)
        {
            fail("Results returned were null. Likely SQL error.");
        }
        
        if (!expFName.equals(results[0][1]))
        {
            fail("Incorrect first name. Check database is reset.");
        }
        
        int resultID = Integer.parseInt(results[1][0]);
        
        if (expID != resultID)
        {
            fail("Incorrect user ID. Check database is reset.");
        }
    }
    
    /**
     * Test of getAllExamVets method, of class DatabaseConnection.
     */
    @Test
    public void testGetAllExamVets() {
        System.out.println("getAllExamVets");
        DatabaseConnection db = new DatabaseConnection();
        String expFName = "Craig";
        int expID = 10004;
        String[][] results = db.getAllExamVets();
        
        if (results == null)
        {
            fail("Results returned were null. Likely SQL error.");
        }
        
        if (!expFName.equals(results[1][1]))
        {
            fail("Incorrect first name. Check database is reset.");
        }
        
        int resultID = Integer.parseInt(results[0][0]);
        
        if (expID != resultID)
        {
            fail("Incorrect user ID. Check database is reset.");
        }
    }        
    
    /**
     * Test of getExamComment method, of class DatabaseConnection.
     */
    @Test
    public void testGetExamComment() {
        System.out.println("getExamComment");
        int commentID = 00000001;
        DatabaseConnection instance = new DatabaseConnection();
        String expResult = "Looks Good!";
        String result = instance.getExamComment(commentID);
        if (!(result.equals(expResult)))
        {
            // TODO review the generated test code and remove the default call to fail.
            fail("The test case is a prototype.");
        }
    }

    /**
     * Test of getAllExamComment method, of class DatabaseConnection.
     */
    @Test
    public void testGetAllExamComment() {
        System.out.println("getAllExamComment");
        int examID = 00000001;
        DatabaseConnection instance = new DatabaseConnection();
        String expResult = null;
        String[] result = instance.getAllExamComment(examID);
        if ((result[0].equals(expResult)))
        {
            // TODO review the generated test code and remove the default call to fail.
            fail("The test case is a prototype.");
        }
    }

    /**
     * Test of setComment method, of class DatabaseConnection.
     */
    @Test
    public void testSetComment() {
        System.out.println("setComment");
        int examID = 00000001;
        int userID = 00010001;
        String newComment = "test";
        DatabaseConnection instance = new DatabaseConnection();
        boolean expResult = true;
        boolean result = instance.setComment(examID, userID, newComment);
        if (result == true)
        {
            // TODO review the generated test code and remove the default call to fail.
            fail("The test case is a prototype.");
        }
    }

    /**
     * Test of setCommentResponse method, of class DatabaseConnection.
     */
    @Test
    public void testSetCommentResponse() {
        System.out.println("setCommentResponse");
        int commentID = 20;
        String newResponse = "test";
        DatabaseConnection instance = new DatabaseConnection();
        boolean expResult = true;
        boolean result = instance.setCommentResponse(commentID, newResponse);
        if (result == expResult)
        {
            // TODO review the generated test code and remove the default call to fail.
            fail("The test case is a prototype.");
        }
    }

    /**
     * Test of CreateAccount method, of class DatabaseConnection.
     */
    @Test
    public void testCreateAccount() {
        System.out.println("CreateAccount");
        String UserID = "00010001";
        String FirstName = "test";
        String SurName = "ing";
        String Role = "tester";
        String Email = "test@test.test";
        String Password = "test";

    }

    /**
     * Test of getCompletedExams method, of class DatabaseConnection.
     */
    @Test
    public void testGetCompletedExams() {
        System.out.println("getCompletedExams");
        DatabaseConnection instance = new DatabaseConnection();
        String expResult = "Iain Murray";
        String[][] result = instance.getCompletedExams();
        if (!(result[1][3].equals(expResult)))
        {
        // TODO review the generated test code and remove the default call to fail.
            fail("The test case is a prototype.");
        }
    }

    /**
     * Test of deadline method, of class DatabaseConnection.
     */
    @Test
    public void testDeadline() {
        System.out.println("deadline");
        String role = "Exam Setter";
        DatabaseConnection tester = new DatabaseConnection();
        String expResult = "24-5-19";
        String result = tester.deadline(role);
        if (!(result.equals(expResult)))
        {
        // TODO review the generated test code and remove the default call to fail.
            fail("The test case is a prototype.");
        }
    }
    
     /**
     * Test of checkForExternalExam method, of class DatabaseConnection.
     */
    @Test
    public void testcheckForExternalExamTrue() {
        System.out.println("checkForExternalExam");
        int userID = 10003;
        int examID = 1;
        DatabaseConnection tester = new DatabaseConnection();
        boolean expResult = true;
        
        boolean result = tester.checkForExternalExam(examID, userID);
        if (result != expResult)
        {
        // TODO review the generated test code and remove the default call to fail.
            fail("The test case is a prototype.");
        }
    }
    
    /**
     * Test of checkForExternalExam method, of class DatabaseConnection.
     */
    @Test
    public void testcheckForExternalExamFalse() {
        System.out.println("checkForExternalExam");
        int userID = 10001;
        int examID = 1;
        DatabaseConnection tester = new DatabaseConnection();
        boolean expResult = false;
        
        boolean result = tester.checkForExternalExam(examID, userID);
        if (result != expResult)
        {
        // TODO review the generated test code and remove the default call to fail.
            fail("The test case is a prototype.");
        }
    }
    
    /**
     * Test of CreateOldVersion method, of class DatabaseConnection.
     */
    @Test
    public void testCreateOldVersionTrue() {
        System.out.println("CreateOldVersion");
        int examID = 4;
        
        DatabaseConnection tester = new DatabaseConnection();
        boolean expResult = true;
        
        boolean result = tester.createOldVersion(examID);
        if (result != expResult)
        {
        // TODO review the generated test code and remove the default call to fail.
            fail("The test case is a prototype.");
        }
    }
    
    /**
     * Test of CreateOldVersion method, of class DatabaseConnection.
     */
    @Test
    public void testCreateOldVersionFalse() {
        System.out.println("CreateOldVersion");
        int examID = 9999;
        
        DatabaseConnection tester = new DatabaseConnection();
        boolean expResult = false;
        
        boolean result = tester.createOldVersion(examID);
        if (result != expResult)
        {
        // TODO review the generated test code and remove the default call to fail.
            fail("The test case is a prototype.");
        }
    }
    
    /**
     * Test of CreateOldVersion method, of class DatabaseConnection.
     */
    @Test
    public void testGetOldExams() {
        System.out.println("getOldExams");
        
        DatabaseConnection tester = new DatabaseConnection();
        
        String[][] result = tester.getOldExams();
        
        if (result == null)
        {
        // TODO review the generated test code and remove the default call to fail.
            fail("The test case is a prototype.");
        }
    }

    
}
