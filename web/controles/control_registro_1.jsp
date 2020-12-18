<%@page import="clases.variables"%>
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
<%@include  file="../chequearsesion.jsp" %>
<%Connection cn = conexion.crearConexion();
     // Asignar conexion al objeto manejador de datos
    fuente.setConexion(cn);
    JSONObject ob = new JSONObject();
    ob=new JSONObject();
   
               
        try {
             
              
              ResultSet rs=  fuente.obtenerDato("select  fecha,"
                      + "fecha_puesta,"
                      + "cod_carrito,"
                      + "tipo_huevo,"
                      + "cod_clasificacion,"
                      + "hora_clasificacion,"
                      + "cod_lote,"
                      + "resp_clasificacion,"
                      + "resp_control_calidad,"
                      + "u_medida,"
                      + "cantidad,"
                      + "clasificadora,"
                      + "clasificadora_actual,"
                      + "empacadora,"
                      + "aviario,"
                      + "tipo_almacenamiento,"
                      + "liberado_por,"
                      + "comentario,"
                      + "zona_falla,"
                      + "cod_cambio,"
                      + "codigo_borroso,"
                      + "tipo_maples,"
                      + "codigo_especial,"
                      + "fecha_vieja,"
                      + "estado_liberacion,"
                      + "estado,"
                      + "cod_interno from lotes where fecha_puesta='17/12/2020'");
                
               if (rs.next())
                {
                   PreparedStatement update_cantidad = cn.prepareStatement(
                            "insert into m_lotes(fecha,fecha_puesta,cod_carrito,tipo_huevo,"
                                    + "cod_clasificacion,hora_clasificacion,cod_lote,resp_clasificacion,resp_control_calidad,"
                                    + "u_medida,cantidad,clasificadora,clasificadora_actual,empacadora,aviario,tipo_almacenamiento,"
                                    + "liberado_por,comentario,zona_falla,cod_cambio,codigo_borroso,tipo_maples,codigo_especial,"
                                    + "fecha_vieja,estado_liberacion,estado,cod_interno_old)"
                                    + "   values(convert(datetime2,'"+rs.getString("fecha") +"'),convert(datetime2,'"+rs.getString("fecha_puesta") +"'),'"+rs.getString("cod_carrito") +"','"+rs.getString("tipo_huevo") +"',"
                                            + "'"+rs.getString("cod_clasificacion") +"','"+rs.getString("hora_clasificacion") +"','"+rs.getString("cod_lote") +"','"+rs.getString("resp_clasificacion") 
                                    +"','"+rs.getString("resp_control_calidad") +"','"+rs.getString("u_medida") +"','"+rs.getString("cantidad") +"','"+rs.getString("clasificadora") +"',"
                                            + "'"+rs.getString("clasificadora_actual") +"',"
                                            + "'"+rs.getString("empacadora") +"','"+rs.getString("aviario") +"','"+rs.getString("tipo_almacenamiento") +"','"+rs.getString("liberado_por") +"',"
                                                    + "'"+rs.getString("comentario") +"',"
                                                    + "'"+rs.getString("zona_falla") +"','"+rs.getString("cod_cambio") +"','"+rs.getString("codigo_borroso") +"','"+rs.getString("tipo_maples") +"','"+rs.getString("codigo_especial") +""
                                                            + "','"+rs.getString("fecha_vieja") +"','"+rs.getString("estado_liberacion") +"','"+rs.getString("estado") +"','"+rs.getString("cod_interno") +"')");
                    update_cantidad.executeUpdate();
                 
                }
          
          
          
         } catch (Exception e) 
         {           
            ob.put("mensaje", e.toString());
           
         }
            out.print(ob); %>