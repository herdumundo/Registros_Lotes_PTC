 
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>

<%@page import="net.sf.jasperreports.engine.*"%>
<%@page import="net.sf.jasperreports.view.JasperViewer"%>
<jsp:useBean id="conexion" class="clases.bdconexion1" scope="page" />
<%@page import="javax.servlet.ServletResponse"%>
<%@include file="../contenedores/contenedor_reporte_carros_mixtos.jsp" %>
<%@include file="../chequearsesion.jsp" %>
<%     
        String clasificadora = (String) sesionOk.getAttribute("clasificadora");
        String calendario = request.getParameter("calendario_reporte_carros_mixto");
        String estado = request.getParameter("cbox_estado");
 %>
 <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      <%
        Connection con = conexion.crearConexion();

          if(estado.equals("L")){
              
               File reportfile = new File (application.getRealPath("reportes/reporte_lotes_mixtos_puesta.jasper"));
        
        Map<String,Object> parameter = new HashMap<String,Object>();
    
            parameter.put("fecha",new String(calendario));
            parameter.put("clasificadora",new String(clasificadora));
            parameter.put("status",new String(estado));
 
                 
         byte [] bytes = JasperRunManager.runReportToPdf(reportfile.getPath(), parameter, con);
        response.setContentType("application/pdf");
        response.setContentLength(bytes.length);
        ServletOutputStream outputstream = response.getOutputStream();
        outputstream.write(bytes,0,bytes.length);
        outputstream.flush();
        outputstream.close();
          }
          
          else {
              
               File reportfile = new File (application.getRealPath("reportes/reporte_lotes_mixtos_retenidos_puesta.jasper"));
        
        Map<String,Object> parameter = new HashMap<String,Object>();
    
            parameter.put("fecha",new String(calendario));
            parameter.put("clasificadora",new String(clasificadora));
            parameter.put("status",new String(estado));
 
                 
         byte [] bytes = JasperRunManager.runReportToPdf(reportfile.getPath(), parameter, con);
        response.setContentType("application/pdf");
        response.setContentLength(bytes.length);
        ServletOutputStream outputstream = response.getOutputStream();
        outputstream.write(bytes,0,bytes.length);
        outputstream.flush();
        outputstream.close();
          }
       
        %>
     
    </body>
</html>
