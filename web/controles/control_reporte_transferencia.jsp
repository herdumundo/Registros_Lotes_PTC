 
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="net.sf.jasperreports.engine.*"%>
<%@page import="net.sf.jasperreports.view.JasperViewer"%>
<jsp:useBean id="conexion" class="clases.bdconexion1" scope="page" />
<%@page import="javax.servlet.ServletResponse"%>
<%@include file="../contenedores/contenedor_menu_reporte.jsp" %>
<%@include  file="../chequearsesion.jsp" %>
<%     
      String nro_transferencia = request.getParameter("nro_transferencia");
    
Connection cn = conexion.crearConexion();
 
  File reportfile = new File (application.getRealPath("reportes/transferencia.jasper"));
        
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
 