 
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>

<%@page import="net.sf.jasperreports.engine.*"%>
<%@page import="net.sf.jasperreports.view.JasperViewer"%>
<%@page import="javax.servlet.ServletResponse"%>
<%@include file="contenedor_reporte_carros.jsp" %>
<%@include  file="chequearsesion.jsp" %>
<jsp:useBean id="conexion" class="clases.bdconexion1" scope="page" />
    
<%     
    String clasificadora = (String) sesionOk.getAttribute("clasificadora");
    String calendario = request.getParameter("calendario_reporte_carros");
    String estado = request.getParameter("cbox_estado");
    List<String> tipo_huevo_list;
    String fecha_clasificacion = request.getParameter("calendario_reporte_clasificacion");
    String hora_desde = request.getParameter("desde");
    String hora_hasta = request.getParameter("hasta");
    String tipo_huevo = request.getParameter("tipo_huevo");
    String clasificacion="";
    Connection con = conexion.crearConexion();
        
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
    if(fecha_clasificacion.length()==0){
         
         clasificacion="1";
     }
     else   {
         
                  clasificacion=fecha_clasificacion;
            }
    
if (tipo_huevo.equals("A")||tipo_huevo.equals("B")||tipo_huevo.equals("C")
        ||tipo_huevo.equals("D")||tipo_huevo.equals("J")||tipo_huevo.equals("S")||tipo_huevo.equals("G")){
    
    //query_tipo_huevo=tipo_huevo;
    
    tipo_huevo_list= Arrays.asList(tipo_huevo );
    
}
else {
    
  tipo_huevo_list= Arrays.asList("A", "B", "C", "D", "S", "J", "G" );

    }

 
%>
 <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     </head>
    <body>
      <%
         //  List<String> tipo_huevo_list =  Arrays.asList("A", "B" );
	
        File reportfile = new File (application.getRealPath("reportes/reporte_lotes.jasper"));
        
        Map<String,Object> parameter = new HashMap<String,Object>();
    
      parameter.put("fecha",new String(calendario));
       parameter.put("clasificadora",new String(clasificadora));
          parameter.put("status",new String(estado));
          parameter.put("query_tipo_huevo", tipo_huevo_list );
          parameter.put("fecha_clasificacion", clasificacion );
          parameter.put("hora_desde", hora_desde );
          parameter.put("hora_hasta", hora_hasta );
 
           
         byte [] bytes = JasperRunManager.runReportToPdf(reportfile.getPath(), parameter, con);
         
        response.setContentType("application/pdf");
        response.setContentLength(bytes.length);
        response.setHeader("Content-Disposition",  "inline; filename=M-FOR-CYO-41_"+calendario+"_"+cch+".pdf");

        ServletOutputStream outputstream = response.getOutputStream();
        outputstream.write(bytes,0,bytes.length);
        
        outputstream.flush();
        outputstream.close();
        %>
        
    </body>
</html>
