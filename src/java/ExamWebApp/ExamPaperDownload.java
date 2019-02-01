package ExamWebApp;
 

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
 
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 

@WebServlet("/downloadServlet")
public class ExamPaperDownload extends HttpServlet {
 
    // size of byte buffer to send file
    private static final int BUFFER_SIZE = 4096;   
  

     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // get upload id from URL's parameters
           DatabaseConnection db = new DatabaseConnection();
        String examID = request.getParameter("modalExamIDHidden");
          Connection conn = db.getConn();
       
         
        try {
            // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            
 
            // queries the database
            String sql = "SELECT ExamPaper,Title,ModuleCode,ExamPaperFileExtension FROM exam WHERE ExamID= '" + examID + "';";
            PreparedStatement statement = conn.prepareStatement(sql);
            
 
            ResultSet result = statement.executeQuery();
            if (result.next()) {
                // gets file name and file blob data
                String fileName =  result.getString("ModuleCode") + "-" + result.getString("Title");
                Blob blob = result.getBlob("ExamPaper");
                InputStream inputStream = blob.getBinaryStream();
                int fileLength = inputStream.available();
                 
                System.out.println("fileLength = " + fileLength);
 
                ServletContext context = getServletContext();
 
                // sets MIME type for the file download
                String mimeType = "application/octet-stream";
                if (result.getString("ExamPaperFileExtension").equals("application/pdf")) {        
                     mimeType = "application/pdf";
                     fileName = fileName + ".pdf";
                } else if(result.getString("ExamPaperFileExtension").equals("docx")){ 
                    mimeType = "application/vnd.openxmlformats-officedocument.wordprocessingml.document";
                     fileName = fileName + ".docx";
                }
                 
                // set content properties and header attributes for the response
                response.setContentType(mimeType);
                response.setContentLength(fileLength);
                String headerKey = "Content-Disposition";
                String headerValue = String.format("attachment; filename=\"%s\"", fileName);
                response.setHeader(headerKey, headerValue);
 
                // writes the file to the client
                OutputStream outStream = response.getOutputStream();
                 
                byte[] buffer = new byte[BUFFER_SIZE];
                int bytesRead = -1;
                 
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outStream.write(buffer, 0, bytesRead);
                }
                 
                inputStream.close();
                outStream.close();             
            } else {
                // no file found
                response.getWriter().print("File not found for the id: " + examID);  
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            response.getWriter().print("SQL Error: " + ex.getMessage());
        } catch (IOException ex) {
            ex.printStackTrace();
            response.getWriter().print("IO Error: " + ex.getMessage());
        } finally {
            if (conn != null) {
                // closes the database connection
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }          
        }
    }
}