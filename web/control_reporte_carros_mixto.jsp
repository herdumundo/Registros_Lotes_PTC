 
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>

<%@page import="net.sf.jasperreports.engine.*"%>
<%@page import="net.sf.jasperreports.view.JasperViewer"%>

<%@page import="javax.servlet.ServletResponse"%>
<jsp:useBean id="conexion" class="clases.bdconexion1" scope="page" />
<%@include file="contenedor_reporte_carros_mixtos.jsp" %>
<%@include file="chequearsesion.jsp" %>

<%         Connection con = conexion.crearConexion();

        String clasificadora = (String) sesionOk.getAttribute("clasificadora");
        String clasificadora_cch = (String) sesionOk.getAttribute("area_cch");
        String estado = request.getParameter("cbox_estado");
        int nro_carro = Integer.parseInt(request.getParameter("numero"));
        
        if(nro_carro >1){
            
            nro_carro=nro_carro;
        }
        
        else {
            
            nro_carro=1;
        }
%>
 <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      <%
          
          if (estado.equals("L")){
              
               File reportfile = new File (application.getRealPath("reportes/reporte_lotes_mixtos.jasper"));
        
        Map<String,Object> parameter = new HashMap<String,Object>();
    
            parameter.put("nro_carro",  nro_carro );
            parameter.put("clasificadora",new String(clasificadora));
            parameter.put("status",new String(estado));
            parameter.put("clasificadora_cch",new String(clasificadora_cch));
                 
         byte [] bytes = JasperRunManager.runReportToPdf(reportfile.getPath(), parameter, con);
        response.setContentType("application/pdf");

        response.setContentLength(bytes.length);
        ServletOutputStream outputstream  = response.getOutputStream();
        outputstream.write(bytes,0,bytes.length);
        outputstream.flush();
        outputstream.close();
        
        
        
          }
          
          else {
              
                 File reportfile = new File (application.getRealPath("reportes/reporte_lotes_mixtos_retenidos.jasper"));
        
        Map<String,Object> parameter = new HashMap<String,Object>();
    
             parameter.put("nro_carro",  nro_carro );
            parameter.put("clasificadora",new String(clasificadora));
            parameter.put("status",new String(estado));
            parameter.put("clasificadora_cch",new String(clasificadora_cch));
                 
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
