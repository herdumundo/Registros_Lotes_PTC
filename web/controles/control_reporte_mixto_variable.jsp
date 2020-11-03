<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="net.sf.jasperreports.engine.*"%>
<%@page import="net.sf.jasperreports.view.JasperViewer"%>
<jsp:useBean id="conexion" class="clases.bdconexion1" scope="page" />
<%@page import="javax.servlet.ServletResponse"%>
<%@include file="../chequearsesion.jsp" %>
<%         
    Connection con = conexion.crearConexion();
    String clasificadora        =   (String) sesionOk.getAttribute("clasificadora");
    String calendario           =   request.getParameter("calendario_reporte_carros_mixto");
    String calendario_hasta           =   request.getParameter("calendario_reporte_carros_mixto_hasta");
    String estado               =   request.getParameter("cbox_estado");
    String carro                =   request.getParameter("numero");
    String filtro_carro         =   request.getParameter("filtro_carro");
    String filtro_calendario    =   request.getParameter("filtro_calendario");
    
String cch="";
    
    if(clasificadora.equals("A")){
        cch="CCHA";
    }
    else if(clasificadora.equals("B")){
        cch="CCHB";
    }
     else if(clasificadora.equals("H")){
        cch="CCHH";
    }
      else if(clasificadora.equals("O")){
        cch="LAVADO";
    }
 
          
          if (estado.equals("L"))
          {
              
           File reportfile = new File (application.getRealPath("reportes/reporte_lotes_mixtos_variables.jasper"));
            Map<String,Object> parameter = new HashMap<String,Object>();
             parameter.put("fecha",new String(calendario));
             parameter.put("fecha_hasta",new String(calendario_hasta));
            parameter.put("clasificadora",new String(clasificadora));
            parameter.put("status",new String(estado));
            parameter.put("filtro_carro",new Integer(filtro_carro));
            parameter.put("filtro_calendario",new Integer(filtro_calendario));
            parameter.put("carro",new String(carro));
            
 
            byte [] bytes = JasperRunManager.runReportToPdf(reportfile.getPath(), parameter, con);
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition",  "inline; filename=M-FOR-CYO-42_"+calendario+"_"+cch+".pdf");
            response.setContentLength(bytes.length);
            ServletOutputStream outputstream = response.getOutputStream();
            outputstream.write(bytes,0,bytes.length);
            outputstream.flush();
            outputstream.close();
          }
          


        if (estado.equals("R")){

    File reportfile = new File (application.getRealPath("reportes/reporte_lotes_retenidos_mixtos_variables.jasper"));
  Map<String,Object> parameter = new HashMap<String,Object>();
    
         parameter.put("fecha",new String(calendario));
             parameter.put("fecha_hasta",new String(calendario_hasta));
            parameter.put("clasificadora",new String(clasificadora));
            parameter.put("status",new String(estado));
            parameter.put("filtro_carro",new Integer(filtro_carro));
            parameter.put("filtro_calendario",new Integer(filtro_calendario));
            parameter.put("carro",new String(carro));
                 
         byte [] bytes = JasperRunManager.runReportToPdf(reportfile.getPath(), parameter, con);
        response.setContentType("application/pdf");
        response.setContentLength(bytes.length);
        ServletOutputStream outputstream = response.getOutputStream();
        outputstream.write(bytes,0,bytes.length);
        outputstream.flush();
        outputstream.close();
        }
        
      
        %>
 