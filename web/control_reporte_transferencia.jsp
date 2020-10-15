 
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>

<%@page import="net.sf.jasperreports.engine.*"%>
<%@page import="net.sf.jasperreports.view.JasperViewer"%>
<jsp:useBean id="conexion" class="clases.bdconexion1" scope="page" />
<%@page import="javax.servlet.ServletResponse"%>
 <%@include file="contenedor_menu_reporte.jsp" %>
<%@include  file="chequearsesion.jsp" %>
<%     
      String nro_transferencia = request.getParameter("nro_transferencia");
      String tipo_reporte = request.getParameter("tipo_transferencia");
      String ruta_reporte="";
  
Connection cn = conexion.crearConexion();
if(tipo_reporte.equals("A"))
{
     ruta_reporte="reportes/transferencia.jasper";
}
else if (tipo_reporte.equals("P")) 
{
     ruta_reporte="reportes/transferencia_procesar.jasper";

}
%>
 <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      <%
        File reportfile = new File (application.getRealPath(ruta_reporte));
        
        Map<String,Object> parameter = new HashMap<String,Object>();
    
        parameter.put("nro_trans",new Integer(nro_transferencia));
        
        byte [] bytes = JasperRunManager.runReportToPdf(reportfile.getPath(), parameter, cn);
         
        response.setContentType("application/pdf");
        response.setContentLength(bytes.length);
        ServletOutputStream outputstream = response.getOutputStream();
        outputstream.write(bytes,0,bytes.length);
        
        outputstream.flush();
        outputstream.close();
        %>
        
    </body>
</html>
