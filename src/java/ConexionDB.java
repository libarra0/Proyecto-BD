/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author Leo
 */
public class ConexionDB extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
    {
        Connection connection;
        
        PreparedStatement command;
        ResultSet result;
        HttpSession sessionInfo = request.getSession();
        
        String codigo = request.getParameter("CountryCode");
        
        try
        {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/world", "root", "damaso12");
            
            command = connection.prepareStatement("SELECT NAME, District FROM city WHERE CountryCode = ?");
            command.setString(1, codigo);
            //command.setString(2, distrito);
            result = command.executeQuery();
            
            
                    sessionInfo.setAttribute("CountryCode", result);
                    response.sendRedirect("Ciudades.jsp");
            
            
            response.sendRedirect("index.jsp");
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
    }
}
