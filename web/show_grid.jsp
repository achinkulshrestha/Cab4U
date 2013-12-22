
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>

<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<META http-equiv="Content-Style-Type" content="text/css">

<TITLE>taluklist.jsp</TITLE>
</HEAD>
<BODY>
<% response.setDateHeader("Expires",-1);%>
<%

try{
                                String responseText=new String("");
System.out.println("ff");
                                String optionalvalue=(String) request.getParameter("qparam");
                                Class.forName("com.mysql.jdbc.Driver");
            String connectionUrl = "jdbc:mysql://localhost:3306/cab_booking?" +
                                   "user=root&password=";
            Connection con = DriverManager.getConnection(connectionUrl);

           
                                String query;
                                
                                ResultSet rs=null;
                                PreparedStatement ps=null;
                                if(optionalvalue.equals("All"))
                                    query="select * from request where status=0";
                                 else query="select * from request where area_name=\""+optionalvalue+"\" and status=0";
                                ps=con.prepareStatement(query);
                                rs=ps.executeQuery();
                                responseText="<table name=employee align=\"center\" cellpadding=\"15\" border=\"1\">";
                                responseText+="<tr><td><label>checkbox</label> </td> <td><label>Employee Name</label></td><td><label>Email</label></td><td><label></td></tr> ";                              
                               
                                while(rs.next())
                                {
                                                responseText+="<tr><td><input type=\"checkbox\" name=\"checklist\" value="+rs.getInt("emp_id")+" ></td> <td>"+ rs.getInt("emp_id") +"</td><td>"+rs.getString("area_name")+"</td></tr> ";                              
                                }
                responseText+="</table>";
                out.print(responseText);
                con.close();

}catch(Exception e)
                {
                                out.println("Error "+e.getMessage());
                                
                }
                
%>
</BODY>
</HTML>
