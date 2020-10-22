  <%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<jsp:useBean id="conexion" class="clases.bdconexion1" scope="page" />
<jsp:useBean id="fuente" class="clases.fuentedato" scope="page"/>
<%@ page contentType="application/json; charset=utf-8" %>
<%@include  file="chequearsesion.jsp" %>
<%      Connection cn = conexion.crearConexion();
            fuente.setConexion(cn);
            JSONObject ob = new JSONObject();
            ob=new JSONObject();
            String  id              =   request.getParameter("id");
            String  mensaje         =   "";
            int     tipo_respuesta  =   0;
            try {  
                cn.setAutoCommit(false);
                    CallableStatement  callableStatement=null;   
                    String getDBUSERByUserIdSql = "{call pa_baja_huevos_emp(?,? )}";
                    callableStatement = cn.prepareCall(getDBUSERByUserIdSql);
                    callableStatement .setInt(1,  Integer.parseInt(id));
                    callableStatement.registerOutParameter("mensaje", java.sql.Types.INTEGER);
                    callableStatement.execute();
                    tipo_respuesta = callableStatement.getInt("mensaje");
            if(tipo_respuesta==1)
                {
                cn.rollback();
                mensaje="ERROR";
                }
            else
                {    
                mensaje="CERRADO";
                cn.commit();    
                }
                ob.put("mensaje", mensaje);
                ob.put("tipo_respuesta", tipo_respuesta);
                } catch (Exception e) 
                {
                ob.put("mensaje", e.toString());
                ob.put("tipo_respuesta", "1");
                cn.rollback();
                }
            
             

                out.print(ob); %>