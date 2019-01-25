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
 * @author Sebastian
 */
public class ModalTest {
    
    public ModalTest() {
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
     * Test of returnModal method, of class Modal.
     */
    @Test
    public void testReturnModal() {
        System.out.println("returnModal");
        Modal instance = new Modal();
        String expResult = "<div id=\"myModal\" class=\"modal fade\" role=\"dialog\"> <div class=\"modal-dialog\"> <!-- Modal content--> <div class=\"modal-content\"> <form method=\"post\" action=\"InternalModDashboard.jsp\"> <div class=\"modal-header\"> <button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button> <h4 id=\"modalHeader\" class=\"modal-title\">Exam Details</h4> </div> <div class=\"modal-body\"> <input type=\"hidden\" name=\"modalExamIDHidden\" id=\"modalExamIDHidden\" value = ' ' /> <input type=\"hidden\" name=\"modalExamTitleHidden\" id=\"modalExamTitleHidden\" value = ' ' /> <input type=\"hidden\" name=\"modalModuleCodeHidden\" id=\"modalModuleCodeHidden\" value = ' ' /> <input type=\"hidden\" name=\"modalModuleCoordinatorHidden\" id=\"modalModuleCoordinatorHidden\" value = ' ' /> <p id=\"modalExamID\">Exam ID</p> <p id=\"modalExamTitle\">Exam Title</p> <p id=\"modalModuleCode\">Module Code</p> <p id=\"modalModuleCoordinator\">Module Coordinator</p> </div> <div class=\"modal-footer\"> <button type=\"submit\" name=\"DownloadExam\" class=\"btn btn-default\">Download Exam</button> <button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">Close</button> </form> <form method=\"post\" action=\"commentExam.jsp\"> <input type=\"hidden\" name=\"ExamIDHidden\" id=\"ExamIDHidden\" value = ' ' /> <button type =\"submit\" class=\"btn btn-default\" name =\"commentExam\" >Comment and Upload</button> </form> </div> </div> </div> </div>";
        String result = instance.returnModal();
        if (result != expResult)
        {
            // TODO review the generated test code and remove the default call to fail.
            fail("The test case is a prototype.");
        }
    }
    
}
