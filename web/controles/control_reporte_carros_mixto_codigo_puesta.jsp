 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>

<%@page import="net.sf.jasperreports.engine.*"%>
<%@page import="net.sf.jasperreports.view.JasperViewer"%>

<%@page import="javax.servlet.ServletResponse"%>
<%@include file="../Conexion.jsp" %>
<%@include file="../contenedores/contenedor_reporte_carros_mixtos.jsp" %>
<%@include file="../chequearsesion.jsp" %>
<%     
        String clasificadora = (String) sesionOk.getAttribute("clasificadora");
        String calendario = request.getParameter("calendario_reporte_carros_mixto");
        String estado = request.getParameter("cbox_estado");
         String carro = request.getParameter("numero");
%>
 <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      <%
          
          if(estado.equals("L")){
              
               File reportfile = new File (application.getRealPath("reportes/reporte_lotes_mixtos_carro_carro_puesta.jasper"));
        
        Map<String,Object> parameter = new HashMap<String,Object>();
    
            parameter.put("fecha",new String(calendario));
            parameter.put("clasificadora",new String(clasificadora));
            parameter.put("status",new String(estado));
            parameter.put("codigo",new String(carro));

                 
         byte [] bytes = JasperRunManager.runReportToPdf(reportfile.getPath(), parameter, con);
        response.setContentType("application/pdf");
        response.setContentLength(bytes.length);
        ServletOutputStream outputstream = response.getOutputStream();
        outputstream.write(bytes,0,bytes.length);
        outputstream.flush();
        outputstream.close();
              
          }
          
          else {
              
               File reportfile = new File (application.getRealPath("reportes/reporte_lotes_mixtos_retenidos_puesta_codigo.jasper"));
        
        Map<String,Object> parameter = new HashMap<String,Object>();
    
            parameter.put("fecha",new String(calendario));
            parameter.put("clasificadora",new String(clasificadora));
            parameter.put("status",new String(estado));
            parameter.put("codigo",new String(carro));

                 
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
