
 <%@page import="org.json.JSONObject"%>
<%@ page language="java" import="java.sql.*" errorPage="error.jsp" %>
<jsp:useBean id="conexion" class="clases.bdconexion1" scope="page" />
<jsp:useBean id="fuente" class="clases.fuentedato" scope="page"/>
<%@include  file="chequearsesion.jsp" %>
 <%@ page contentType="application/json; charset=utf-8" %>

<%
        Connection cn = conexion.crearConexion();
	// Asignar conexion al objeto manejador de datos
	fuente.setConexion(cn);
       //Parametros
        JSONObject ob = new JSONObject();
        ob=new JSONObject();
        String area = (String) sesionOk.getAttribute("clasificadora");
        String tipo_huevo = request.getParameter("tipo_huevo");
        String contenedor="";
       if(tipo_huevo.equals("4TA")){
           tipo_huevo="D";
       }
  
            if((tipo_huevo.equals("C")||tipo_huevo.equals("D")||tipo_huevo.equals("G"))&&area.equals("A")){
          contenedor=contenedor+ "<option value='0'>0</option>";
  
            }
        ResultSet rs = fuente.obtenerDato(" select empacadora from huevos_empacadoras where estado='A' and clasificadora='"+area+"'  and tipo_huevo='"+tipo_huevo+"'");
            while(rs.next()){
       contenedor=contenedor+ "<option value='"+rs.getString("empacadora")+"'>"+rs.getString("empacadora")+"</option>";
        }
                           

        ob.put("mensaje",contenedor);
        out.print(ob);
        %>
     
       

   