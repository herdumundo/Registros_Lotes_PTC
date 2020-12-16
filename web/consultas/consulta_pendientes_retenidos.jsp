
<%@page import="org.json.JSONObject"%>
<%@ page language="java" import="java.sql.*" errorPage="error.jsp" %>
<jsp:useBean id="conexion" class="clases.bdconexion1" scope="page" />
<jsp:useBean id="fuente" class="clases.fuentedato" scope="page"/>
<%@include  file="../chequearsesion.jsp" %>
<%@ page contentType="application/json; charset=utf-8" %>
<%
        String clasificadora = (String) sesionOk.getAttribute("clasificadora");
        String clasificadora_cch = (String) sesionOk.getAttribute("area_cch");
        Connection cn = conexion.crearConexion();
	fuente.setConexion(cn);
        JSONObject ob = new JSONObject();
        ob=new JSONObject();
        String contador="";
        String fecha_vieja_retenido="";
        String fecha_vieja="";
        ResultSet   rs = fuente.obtenerDato(" exec [select_ptc_fp_vieja_test] @clasificadora='"+clasificadora+"', @clasificadora_cch='"+clasificadora_cch+"'");
        while(rs.next()){
              contador= rs.getString(1);
              fecha_vieja_retenido = rs.getString(2);
              fecha_vieja  = rs.getString(3);
                        }
        ob.put("cantidad",contador);
        ob.put("fecha_vieja_retenido",fecha_vieja_retenido);
        ob.put("fecha_vieja",fecha_vieja);
        out.print(ob);
       %>