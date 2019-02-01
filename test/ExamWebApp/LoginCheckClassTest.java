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
    public void testCheckStaffLoginTrue(){
        LoginCheckClass login = new LoginCheckClass();
        System.out.println("Check Staff Login correct login credentials");
        String email = "l.boyle@dundee.ac.uk";
        String password = "Liam123";
        
        if(!login.checkStaffLogin(email, password)){
            fail("Incorrect credentials, ERROR");
        }
    }
    
    /**
     * Test of checkStaffLogin method, of class LoginCheckClass.
     */
    @Test
    public void testCheckStaffLoginFalse(){
        LoginCheckClass login = new LoginCheckClass();
        System.out.println("Check Staff Login incorrect login credentials");
        String email = "test.user@dundee.ac.uk";
        String password = "Test123";
        
        if(login.checkStaffLogin(email, password)){
            fail("Incorrect credentials, ERROR");
        }
    }
    
}
