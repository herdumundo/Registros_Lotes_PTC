 
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="net.sf.jasperreports.engine.*"%>
<%@page import="net.sf.jasperreports.view.JasperViewer"%>
<%@page import="javax.servlet.ServletResponse"%>
 <%@include  file="../chequearsesion.jsp" %>
<jsp:useBean id="conexion" class="clases.bdconexion1" scope="page" />
    
<%     
    String clasificadora = (String) sesionOk.getAttribute("clasificadora");
    String fecha_puesta = request.getParameter("calendario_reporte_carros");
    String estado_liberacion = request.getParameter("cbox_estado");
    String estado = request.getParameter("cbox_estado");
    String[] array_tipo_huevo = request.getParameterValues("tipo_huevo");
    String fecha_clasificacion = request.getParameter("calendario_reporte_clasificacion");
    String hora_desde = request.getParameter("desde");
    String hora_hasta = request.getParameter("hasta");
    String tipo_calendario = request.getParameter("tipo_calendario");
    String filtro_aviario = request.getParameter("filtro_aviario");
    String [] array_aviarios = request.getParameterValues("aviarios");
    String tipo_huevo = "";
    String aviarios="";
    String tipo_huevo_form=null;
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
         
         clasificacion="0";
     }
     else   {
         
        clasificacion=fecha_clasificacion;
            }
     for(int i=0; i<array_tipo_huevo.length; i++)   
                {
               
                    if (array_tipo_huevo.length>1)
                    {
                        if(i==0){
                        tipo_huevo=array_tipo_huevo[i];  
                        }
                        else 
                        {
                            tipo_huevo=tipo_huevo+ ","+array_tipo_huevo[i];  
                        }
                    }
                    if (array_tipo_huevo.length==1){
                        tipo_huevo=array_tipo_huevo[i];  
                    }
                }
 
     if (filtro_aviario.equals("SI")){
        for(int i=0; i<array_aviarios.length; i++)   
                {
               
                    if (array_aviarios.length>1)
                    {
                        if(i==0){
                        aviarios=array_aviarios[i];  
                        }
                        else 
                        {
                            aviarios=aviarios+ ","+array_aviarios[i];  
                        }
                    }
                    if (array_aviarios.length==1){
                        aviarios=array_aviarios[i];  
                    }
                }
     }
     
     
     
        File reportfile = new File (application.getRealPath("reportes/reporte_lotes.jasper"));
        Map<String,Object> parameter = new HashMap<String,Object>();
    
            parameter.put("fecha_puesta",new String(fecha_puesta));
            parameter.put("fecha_clasificacion", clasificacion );
            parameter.put("clasificadora",new String(clasificadora));
            parameter.put("tipo_huevo", tipo_huevo );
            parameter.put("hora_desde", hora_desde );
            parameter.put("hora_hasta", hora_hasta );
            parameter.put("tipo_calendario", tipo_calendario );
            parameter.put("filtro_aviario", filtro_aviario ); 
            parameter.put("aviarios", aviarios ); 
            parameter.put("estado_liberacion", estado_liberacion ); 
         byte [] bytes = JasperRunManager.runReportToPdf(reportfile.getPath(), parameter, con);
        response.setContentType("application/pdf");
        response.setContentLength(bytes.length);
        response.setHeader("Content-Disposition",  "inline; filename=M-FOR-CYO-41_"+fecha_puesta+"_"+cch+".pdf");
        ServletOutputStream outputstream = response.getOutputStream();
        outputstream.write(bytes,0,bytes.length);
        outputstream.flush();
        outputstream.close(); 
     
%>
 