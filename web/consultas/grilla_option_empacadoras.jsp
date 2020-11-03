
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
        String area = (String) sesionOk.getAttribute("clasificadora");
        String tipo_huevo = request.getParameter("tipo_huevo");
        String contenedor="";
       if(tipo_huevo.equals("4TA")){
           tipo_huevo="D";
       }
        ResultSet rs = fuente.obtenerDato(" exec [select_option_empacadoras_PTC] @tipo_huevo='"+tipo_huevo+"', @area='"+area+"'");
            while(rs.next()){
            contenedor=contenedor+ "<option value='"+rs.getString("empacadora")+"'>"+rs.getString("empacadora")+"</option>";
            }
        ob.put("mensaje",contenedor);
        out.print(ob);
       %>