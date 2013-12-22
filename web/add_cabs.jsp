<%-- 
    Document   : index
    Created on : Jul 7, 2011, 6:23:54 AM
    Author     : achink
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
    <head>
        <script lang="Javascript" src="cabgrid.js"></script>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Cabs</title>
    </head>
    <body>
        <form action="addcab" method="post">
        <table>
            <tr>
                <td>
                <select name="time">
                    <option value="5:30">5:30</option>
                     <option value="6:30">6:30</option>
                    <option value="7:30">7:30</option>
                    <option value="8:30">8:30</option>
                </select>
                 </td>
                 <td>
<%
try {
/* Create string of connection url within specified format with machine
name, port number and database name. Here machine name id localhost and 
database name is student. */
String connectionURL = "jdbc:mysql://localhost:3306/cab_booking";
// declare a connection by using Connection interface
Connection connection = null;
/* declare object of Statement interface that is used for executing sql 
statements. */
Statement statement = null;
// declare a resultset that uses as a table for output data from tha table.
ResultSet rs = null;
// Load JBBC driver "com.mysql.jdbc.Driver"
Class.forName("com.mysql.jdbc.Driver").newInstance();
/* Create a connection by using getConnection() method that takes parameters 
of string type connection url, user name and password to connect to database.*/
System.out.println("ds");
connection = DriverManager.getConnection(connectionURL, "root", "");
/* createStatement() is used for create statement object that is used for 
sending sql statements to the specified database. */
statement = connection.createStatement();
// sql query to retrieve values from the secified table.
String QueryString = "SELECT * from cab_info";

rs = statement.executeQuery(QueryString);
System.out.println("d");

 String responseText=new String("");
%><table name=cabgrid>
                <%
     while(rs.next())
                  {%>
                 <tr> <td><input type="checkbox" name="cab" value=<%=rs.getInt(1)%>></td><td><%=rs.getInt(1)%></td></tr>                               
              <%}%>
     </table>
     <%//out.print(responseText);
rs.close();
statement.close();
}catch (Exception ex) {
out.println(ex.toString()+"Unable to connect to database.");
}
%>
                 </td>
            <tr>
                 <td>
                     <input type="radio" name="facility" value="dynasty" />dynasty
                 </td>
                 <td>
                     <input type="radio" name="facility" value="imperial" />imperial
                 </td>
            </tr>3
                </tr>
            <br></br>
            <br></br>
            <tr>
                <td>
                    <input type="submit" value="Add Cabs"/>
                </td>
            </tr>        </table>
        
      </body>
</form>
</html>
