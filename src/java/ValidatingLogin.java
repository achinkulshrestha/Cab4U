/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
/**
 *
 * @author ankita
 */
public class ValidatingLogin extends HttpServlet {
ServletContext context=null;
        private Connection con = null;
	private	PreparedStatement pstmt = null;
	private ResultSet rs = null;
        private Statement stmt=null;

        

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException {

      //  res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        context = getServletContext();

         try {
            Class.forName("com.mysql.jdbc.Driver");
            String connectionUrl = "jdbc:mysql://localhost:3306/cab_booking?" +
                                   "user=root&password=";
            Connection con = DriverManager.getConnection(connectionUrl);

            Statement stmt = con.createStatement();
            System.out.println("in  servlet");
          
String QueryString = "SELECT type from employee_info where email= \""+req.getParameter("UserName")+"\" and password = \""+req.getParameter("Password")+"\"";
System.out.println(QueryString);
//rs = stmt.executeQuery(QueryString);
pstmt = con.prepareStatement(QueryString);//"insert into cab_info(id,license,capacity,model) values(NULL,?,?,?)");

            rs = pstmt.executeQuery();


         if(rs.next())
         {if(rs.getString("type").equals("Admin"))
           {RequestDispatcher rd = context.getRequestDispatcher("/Admin.jsp");
            rd.forward(req,res);
           }
             else  if(rs.getString("type").equals("Employee"))
             {RequestDispatcher rd = context.getRequestDispatcher("/DispatcherPage.jsp");
            rd.forward(req,res);
             }
         }   else{
               RequestDispatcher rd = context.getRequestDispatcher("/adminlogin.jsp");
            rd.forward(req,res);
           }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException cE) {
            System.out.println("Class Not Found Exception: "+ cE.toString());
        }
         finally { 
            out.close();
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        System.out.println("dd");
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

