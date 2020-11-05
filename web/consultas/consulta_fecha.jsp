
<%@page import="org.json.JSONObject"%>
<%@ page language="java" import="java.sql.*" errorPage="error.jsp" %>
<jsp:useBean id="conexion" class="clases.bdconexion1" scope="page" />
<jsp:useBean id="fuente" class="clases.fuentedato" scope="page"/>
<%@include  file="../chequearsesion.jsp" %>
<%@ page contentType="application/json; charset=utf-8" %>
<%
        Connection cn = conexion.crearConexion();
	fuente.setConexion(cn);
        JSONObject ob = new JSONObject();
        ob=new JSONObject();
        String contenedor=""; 
         ResultSet rs = fuente.obtenerDato("SELECT convert(varchar,getdate(),103) as fecha ");
       while(rs.next()){
           
           contenedor=rs.getString("fecha");
       }
        
        
        ob.put("fecha",contenedor);
        out.print(ob);
       %>