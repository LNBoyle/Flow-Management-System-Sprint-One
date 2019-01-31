/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ExamWebApp;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author liamboyle
 */
public class FileDowloadNew extends HttpServlet {
     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        File tempFile = File.createTempFile(getClass().getName(), ".xls");
        try {
            FileOutputStream fos = new FileOutputStream(tempFile);
            try {
                generateExcel(fos);
            } finally {
                fos.close();
            }

            response.setHeader("Content-Type", "application/vnd.ms-excel");
            response.setHeader("Content-Transfer-Encoding", "binary");
            response.setHeader("Content-Length", String.valueOf(tempFile.length()));
            response.addHeader("Content-Disposition", String.format("attachment; filename=%s", tempFile.getName()));

            OutputStream outputStream = response.getOutputStream();
            FileInputStream fis = new FileInputStream(tempFile);
            try {
                int n = 0;
                byte[] buffer = new byte[1024];
                while ((n = fis.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, n);
                }
                outputStream.flush();
            } finally {
                fis.close();
            }
        } finally {
            tempFile.delete();
        }
    }

    private void generateExcel(OutputStream outputStream) throws IOException {
        // TODO This is stub. Place you excel generation code here
        outputStream.write("Hellol, world!".getBytes());
    }
}

