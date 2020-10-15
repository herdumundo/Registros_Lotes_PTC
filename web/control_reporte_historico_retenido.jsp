 
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>

<%@page import="net.sf.jasperreports.engine.*"%>
<%@page import="net.sf.jasperreports.view.JasperViewer"%>
<%@page import="javax.servlet.ServletResponse"%>
 <%@include  file="chequearsesion.jsp" %>
<jsp:useBean id="conexion" class="clases.bdconexion1" scope="page" />
    
<%     
    String clasificadora = (String) sesionOk.getAttribute("clasificadora");
    String fecha_puesta = request.getParameter("fecha_puesta");
    String tipo_huevo = request.getParameter("tipo_huevo");
    Connection con = conexion.crearConexion();
	try {
               File reportfile = new File (application.getRealPath("reportes/lotes_historico.jasper"));
        Map<String,Object> parameter = new HashMap<String,Object>();
        parameter.put("fecha_puesta",new String(fecha_puesta));
        parameter.put("clasificadora",new String(clasificadora));
        parameter.put("tipo_huevo", tipo_huevo );
        byte [] bytes = JasperRunManager.runReportToPdf(reportfile.getPath(), parameter, con);
        response.setContentType("application/pdf");
        response.setContentLength(bytes.length);
        ServletOutputStream outputstream = response.getOutputStream();
        outputstream.write(bytes,0,bytes.length);
        outputstream.flush();
        outputstream.close();   
            } 
        catch (Exception e) {
                String a=e.toString();
                out.print(a);
            }
     
        %>
        
  