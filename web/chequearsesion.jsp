<%@ page session="true" %>
<%
HttpSession sesionOk = request.getSession();
sesionOk.setMaxInactiveInterval(-1);
if (sesionOk.getAttribute("usuario") == null ) {
%>
<jsp:forward page="index.jsp">
<jsp:param name="error" value="Ha caducado el tiempo de espera,favor volver a iniciar sesi�n."/>
</jsp:forward>
<%
}
%>

