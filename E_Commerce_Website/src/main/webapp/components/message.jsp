<%
    
String msg =(String) session.getAttribute("message");
    if(msg != null){
//    out.println(msg);
//    


%>
<div class="alert alert-success alert-dismissible fade show" role="alert">
    <strong><%= msg %></strong>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>

<%
    session.removeAttribute("msg");
    }
%>