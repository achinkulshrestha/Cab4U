
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
System.out.println("tsrat");
                                String optionalvalue= (String)request.getParameter("qparam");//.toCharArray();
                                Class.forName("com.mysql.jdbc.Driver");
            String connectionUrl = "jdbc:mysql://localhost:3306/test?" +
                                   "user=root&password=";
            Connection con = DriverManager.getConnection(connectionUrl);
            
           
                                String query="";
                                
                                ResultSet rs=null;
                                PreparedStatement ps=null;
                                query="update request SET status=1 where emp_id in "+optionalvalue.toCharArray();
System.out.println(query);                         
                                      //query="insert from scheduling where =\""+optionalvalue+"\"";
                                ps=con.prepareStatement(query);
                                ps.execute();
                                /*query="insert into scheduling( update request SET status=1 where emp_id in "+optionalvalue.toCharArray();
                                //query="insert from scheduling where =\""+optionalvalue+"\"";
                                ps=con.prepareStatement(query);
                                responseText="<table name=employee>";
                
                                while(rs.next())
                                {
                                                responseText+="<tr><td><input type=\"checkbox\" name=\"checklist\" value="+rs.getInt("id")+" ></td> <td>"+ rs.getInt("id") +"</td><td>"+rs.getString("location")+"</td></tr> ";                              
                                }
                responseText+="</table>";*/
                                System.out.println("working");
                out.print(responseText);
                con.close();

}catch(Exception e)
                {
                                out.println("Error "+e.getMessage());
                                
                }
                
%>
</BODY>
</HTML>
