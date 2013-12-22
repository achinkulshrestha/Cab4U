/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
function CreateXmlHttpObject()

{
     
    var xmlreq = false;

    if (window.XMLHttpRequest) {
      
     //   alert('test12')

        // Create XMLHttpRequest object in non-Microsoft browsers
        xmlreq = new XMLHttpRequest();

    } else if (window.ActiveXObject) {
      
       // alert('test');

        // Create XMLHttpRequest via MS ActiveX
        try {
            // Try to create XMLHttpRequest in later versions
            // of Internet Explorer

            xmlreq = new ActiveXObject("Msxml2.XMLHTTP");
            if (! xmlreq)
                xmlreq=new ActiveXObject("Microsoft.XMLHTTP"); 
        } catch (e1) {

            // Failed to create required ActiveXObject

            try {
                // Try version supported by older versions
                // of Internet Explorer

                xmlreq = new ActiveXObject("Microsoft.XMLHTTP");

            } catch (e2) {

            // Unable to create an XMLHttpRequest with ActiveX
            }
        }
    }

    return xmlreq;
}

function show_grid2(str){
    
    var url="show_grid.jsp"

    url=url+"?qparam="+str

    url=url+"&sid="+Math.random()
    $.ajax({
        url: url,
        success: function(data) {
            alert(data);
            $('#grid').html(data);
            //alert('Load was performed.');
        }
    });
}

function show_grid(str)
{ 

    xmlHttp=CreateXmlHttpObject()
    //alert(document.getElementById("name").valueOf());
    if (xmlHttp==null)

    {

        alert ("Browser does not support HTTP Request")

        return

    } 

    var url="show_grid.jsp"

    url=url+"?qparam="+str

    url=url+"&sid="+Math.random()

    xmlHttp.onreadystatechange=stateChanged1 

    xmlHttp.open("GET",url,true)

    xmlHttp.send(null)
//xmlHttp=CreateXmlHttpObject()
/*var url="show_cab.jsp"

  url=url+"?qparam="+str

  url=url+"&sid="+Math.random()

  xmlHttp.onreadystatechange=stateChanged2 

  xmlHttp.open("GET",url,true)

  xmlHttp.send(null)*/
}
   function remove(str)
         { 

    xmlHttp=CreateXmlHttpObject()
    //alert(document.getElementById("name").valueOf());
    if (xmlHttp==null)

    {

        alert ("Browser does not support HTTP Request")

        return

    } 

    var url="remove"

    url=url+"?qparam="+str

    url=url+"&sid="+Math.random()

    xmlHttp.onreadystatechange=stateChanged2 

    xmlHttp.open("GET",url,true)

    xmlHttp.send(null)
    
//xmlHttp=CreateXmlHttpObject()
/*var url="show_cab.jsp"

  url=url+"?qparam="+str

  url=url+"&sid="+Math.random()

  xmlHttp.onreadystatechange=stateChanged2 

  xmlHttp.open("GET",url,true)

  xmlHttp.send(null)*/
}
function allocate()
{
    alert("achin");
    xmlHttp=CreateXmlHttpObject()
    //alert(document.getElementById("name").valueOf());
    if (xmlHttp==null)

    {

        alert ("Browser does not support HTTP Request")

        return

    } 

    var myArray = new Array();
    j=0;
    var x= document.getElementsByName("checklist");
    alert(x.length);
    //myArray="1";
    /*for(i=0;i<x.length;i++)
 if(x[i].checked))
  {
   myarray[j]=x[i].value;
   j=j+1;
  }
*/
    alert("dd");
    var url="show_grid_cab.jsp"
    url=url+"?qparam="+myArray

    url=url+"&sid="+Math.random()
    alert(url);
    xmlHttp.onreadystatechange=stateChanged2 

    xmlHttp.open("GET",url,true)

    xmlHttp.send(null)
//xmlHttp=CreateXmlHttpObject()
/*var url="show_cab.jsp"

  url=url+"?qparam="+str

  url=url+"&sid="+Math.random()

  xmlHttp.onreadystatechange=stateChanged2 

  xmlHttp.open("GET",url,true)

  xmlHttp.send(null)*/
}
function stateChanged1() 

{ 

    if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")

    { 

        document.getElementById("grid").innerHTML=xmlHttp.responseText 

    } 

} 
function stateChanged2() 

{ 

    if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")

    { 
window.location.reload();
       // document.HTML=xmlHttp.responseText 

    } 

} 
