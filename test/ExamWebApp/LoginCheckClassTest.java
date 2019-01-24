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
        String userEmail = "l.boyle@dundee.ac.uk";
        String userPassword = "Liam123";
        String expResult = "Internal Moderator";
        String result = login.checkStaffLogin(userEmail, userPassword);
        
        if (!result.equals(expResult))
        {
            fail("Returned role is not same as expected.");
        }
    }
    
}
