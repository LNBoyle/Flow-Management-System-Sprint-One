/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ExamWebApp;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author cyrilvarghese
 */
public class DeadLineTest {
    
    public DeadLineTest() {
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
     * Test of deadline method, of class DeadLine.
     */
    @Test
    public void testDeadline() {
        //internal moderator login
        String userEmail = "l.boyle@dundee.ac.uk" ;
        String userPassword = "Liam123";
        LoginCheckClass login=new LoginCheckClass();
        login.checkStaffLogin(userEmail,userPassword);
        
        System.out.println("deadline");
        DeadLine deadline = new DeadLine();
        String expResult = "10-12-19";
        String result = deadline.deadline();
        assertEquals(expResult, result);
        if (!(result.equals(expResult)))
        {
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
        }
    }
    
}
