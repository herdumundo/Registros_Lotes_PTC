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
<%Connection cn = conexion.crearConexion();
     // Asignar conexion al objeto manejador de datos
     fuente.setConexion(cn);
   JSONObject ob = new JSONObject();
        ob=new JSONObject();
         // Crear objeto de conexion al DB     
     String cod_lote                    = request.getParameter ("cod_lote_disposicion");
     String cod_interno                 = request.getParameter ("cod_interno_disposicion");
     String  disposicion_select            = request.getParameter ("disposicion_select");
     int tipo_respuesta=0;
      String mensaje="";
        try {   
  
          
          
             
               
         cn.setAutoCommit(false);
            CallableStatement  callableStatement=null;   
            String getDBUSERByUserIdSql = "{call pa_actualizar_disposicion(?,?,?,?,?)}";
            callableStatement = cn.prepareCall(getDBUSERByUserIdSql);
            callableStatement .setString(1,  cod_lote );
            callableStatement .setInt(2,  Integer.parseInt(cod_interno)  );
            callableStatement .setInt(3, Integer.parseInt(disposicion_select));
    
            callableStatement.registerOutParameter("mensaje", java.sql.Types.VARCHAR);
            callableStatement.registerOutParameter("tipo_mensaje", java.sql.Types.INTEGER);
            callableStatement.execute();
            tipo_respuesta = callableStatement.getInt("tipo_mensaje");
            mensaje = callableStatement.getString("mensaje");
        
            ob.put("mensaje", mensaje);
            ob.put("tipo_respuesta", tipo_respuesta); 
            
            if(tipo_respuesta==1){
                cn.commit();
            }
            else if (tipo_respuesta==0){
                cn.rollback();
             }
            
      
      } 
            catch (Exception e) 
            {
                cn.rollback();
                ob.put("mensaje", e.toString());
                ob.put("tipo_respuesta", "0");         
              }    
                out.print(ob);
              %>
