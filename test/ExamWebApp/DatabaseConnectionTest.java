/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ExamWebApp;

import java.sql.Connection;
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
    
    public DatabaseConnectionTest() {
    }
    
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
     * Test of getConn method, of class DatabaseConnection.
     */
    @Test
    public void testGetConn() {
        System.out.println("getConn");
        DatabaseConnection instance = new DatabaseConnection();
        Connection expResult = null;
        Connection result = instance.getConn();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setConn method, of class DatabaseConnection.
     */
    @Test
    public void testSetConn() {
        System.out.println("setConn");
        Connection conn = null;
        DatabaseConnection instance = new DatabaseConnection();
        instance.setConn(conn);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
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
    public void testCheckUser() {
        System.out.println("checkUser");
        String email = "j.mckilligan@dundee.ac.uk";
        String password = "JM123";
        DatabaseConnection instance = new DatabaseConnection();
        String expResult = "Exam Setter";
        String[] result = instance.checkUser(email, password);
        if (!(result[0].equals(expResult)))
        {
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
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
        String UserID = "";
        String FirstName = "";
        String SurName = "";
        String Role = "";
        String Email = "";
        String Password = "";
        DatabaseConnection instance = new DatabaseConnection();
        boolean expResult = false;
        boolean result = instance.CreateAccount(UserID, FirstName, SurName, Role, Email, Password);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getSignatures method, of class DatabaseConnection.
     */
    @Test
    public void testGetSignatures() {
        System.out.println("getSignatures");
        DatabaseConnection instance = new DatabaseConnection();
        int[][] expResult = null;
        int[][] result = instance.getSignatures();
        assertArrayEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of checkTSSignature1 method, of class DatabaseConnection.
     */
    @Test
    public void testCheckTSSignature1() {
        System.out.println("checkTSSignature1");
        DatabaseConnection instance = new DatabaseConnection();
        boolean expResult = false;
        boolean result = instance.checkTSSignature1();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setTSSignature1 method, of class DatabaseConnection.
     */
    @Test
    public void testSetTSSignature1() {
        System.out.println("setTSSignature1");
        int commentID = 0;
        String newResponse = "";
        DatabaseConnection instance = new DatabaseConnection();
        boolean expResult = false;
        boolean result = instance.setTSSignature1(commentID, newResponse);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of checkIMSignature method, of class DatabaseConnection.
     */
    @Test
    public void testCheckIMSignature() {
        System.out.println("checkIMSignature");
        DatabaseConnection instance = new DatabaseConnection();
        boolean expResult = false;
        boolean result = instance.checkIMSignature();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of checkTSSignature2 method, of class DatabaseConnection.
     */
    @Test
    public void testCheckTSSignature2() {
        System.out.println("checkTSSignature2");
        DatabaseConnection instance = new DatabaseConnection();
        boolean expResult = false;
        boolean result = instance.checkTSSignature2();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of CheckEVCSignature method, of class DatabaseConnection.
     */
    @Test
    public void testCheckEVCSignature() {
        System.out.println("CheckEVCSignature");
        DatabaseConnection instance = new DatabaseConnection();
        boolean expResult = false;
        boolean result = instance.CheckEVCSignature();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of CheckTSSignature3 method, of class DatabaseConnection.
     */
    @Test
    public void testCheckTSSignature3() {
        System.out.println("CheckTSSignature3");
        DatabaseConnection instance = new DatabaseConnection();
        boolean expResult = false;
        boolean result = instance.CheckTSSignature3();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of CheckEESignature method, of class DatabaseConnection.
     */
    @Test
    public void testCheckEESignature() {
        System.out.println("CheckEESignature");
        DatabaseConnection instance = new DatabaseConnection();
        boolean expResult = false;
        boolean result = instance.CheckEESignature();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of CheckTSSignatureFinal method, of class DatabaseConnection.
     */
    @Test
    public void testCheckTSSignatureFinal() {
        System.out.println("CheckTSSignatureFinal");
        DatabaseConnection instance = new DatabaseConnection();
        boolean expResult = false;
        boolean result = instance.CheckTSSignatureFinal();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
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
     * Test of getExamList method, of class DatabaseConnection.
     */
    @Test
    public void testGetExamList() {
        System.out.println("getExamList");
        String ModuleCoordinator = "Iain Murray";
        DatabaseConnection getExam = new DatabaseConnection();
        String expResult = "Iain Murray";
        String[][] result = getExam.getExamList(ModuleCoordinator);
        if (!(result[0][2].equals(expResult)))
        {
        // TODO review the generated test code and remove the default call to fail.
            fail("The test case is a prototype.");
        }
    }
    
}
