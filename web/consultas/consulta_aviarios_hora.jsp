<%-- 
    Document   : consulta_aviarios_hora
    Created on : 08/03/2021, 03:16:05 PM
    Author     : hvelazquez
--%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" import="java.sql.*" errorPage="error.jsp" %>
<jsp:useBean id="conexion" class="clases.bdconexion1" scope="page" />
<jsp:useBean id="fuente" class="clases.fuentedato" scope="page"/>
<%@include  file="../chequearsesion.jsp" %>
<%@page contentType="application/json; charset=utf-8" %>
<%
    String clasificadora = (String) sesionOk.getAttribute("clasificadora");
    String fecha_inicio = request.getParameter("fecha_inicio");
    String fecha_final = request.getParameter("fecha_final");
    Connection cn = conexion.crearConexion();
    fuente.setConexion(cn);
    JSONObject ob = new JSONObject();
    ob=new JSONObject();
    String contenedor=""; 
    ResultSet rs = fuente.obtenerDato("exec [mae_cch_select_aviario_involucrados] @area='"+clasificadora+"',"
            + "@inicio='"+fecha_inicio+"',@final='"+fecha_final+"' ");
        while(rs.next()){
            
            contenedor=contenedor+"<OPTION  VALUE='"+ rs.getString("aviario")+"'>"+ rs.getString("aviario")+"</OPTION>";
        }
        ob.put("aviarios",contenedor);
        out.print(ob);
       %> 