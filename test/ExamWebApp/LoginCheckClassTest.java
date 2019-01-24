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
 * @author abbaslawal
 */
public class LoginCheckClassTest {
    
    public LoginCheckClassTest() {
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
     * Test of checkStaffLogin method, of class LoginCheckClass.
     */
    @Test
    public void testCheckStaffLogin() {
        LoginCheckClass login = new LoginCheckClass();
        System.out.println("checkStaffLogin");
        String userEmail = "";
        String userPassword = "";
        String expResult = "";
        String result = login.checkStaffLogin(userEmail, userPassword);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
