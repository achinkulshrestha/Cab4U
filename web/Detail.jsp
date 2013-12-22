<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="datepicker.css"/>
<script type="text/javascript" src="datepicker.js"></script>
<script>
function mywin()
{
	if(validate()) {
	var start_date = document.getElementById("start_date").value;
        var end_date = document.getElementById("end_date").value;
	var emp_id = document.getElementById("emp_id").value;
	var  page = "eventdisp.jsp?date="+date + "&emp_id="+emp_id;
	window.open(page,'mywindow','width=500,height=350,toolbar=no,resizable=yes,menubar=yes');
	}
}
</script>

    </head>
    <body>
        <form method="post" action="find_detail.jsp">
            <h1 align="center">Enter the detail below</h1>
            <table align="center">
                <tr> 
                    <td><b>User Name</b></td>
                    <td><input type="text" name="username" value=""/></td> 
                </tr>
                <tr>
                </tr>
        
                                
<tr><td ><b> Start Date:</b></td><td><input  type="text" name="start_date" id="start_date">
<input type=button value="Select Date" onClick="displayDatePicker('start_date', this);">
</td></tr>
<tr><td>&nbsp;</td></tr>


<tr><td ><b> End Date:</b></td><td><input  type="text" name="end_date" id="end_date">
<input type=button value="Select Date" onClick="displayDatePicker('end_date', this);">
</td></tr>
<tr><td>&nbsp;</td></tr>
        <tr>
					<td>&nbsp;</td>
					<td><input type="submit" 
name="B1" value="Submit" /><input type="reset" name="B2" value=
"Reset" /></td>
				</tr>
            </table>
        </form>
    </body>
</html>
