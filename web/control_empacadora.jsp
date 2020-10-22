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
            String clasificadora               = (String) sesionOk.getAttribute("clasificadora");
            int empacadora                    = Integer.parseInt(request.getParameter("empacadora"));
            String tipo_huevo                    = request.getParameter("tipo_huevo");
            String mensaje="";
            int tipo_respuesta=0;
            try {  
                cn.setAutoCommit(false);
                    CallableStatement  callableStatement=null;   
                    String getDBUSERByUserIdSql = "{call pa_alta_huevos_emp(?,?,?,?)}";
                    callableStatement = cn.prepareCall(getDBUSERByUserIdSql);
                    callableStatement .setString(1,  clasificadora );
                    callableStatement .setInt(2,  empacadora  );
                    callableStatement .setString(3, tipo_huevo);
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
                mensaje="ACTIVADO";
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