  <%@page import="org.json.JSONObject"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.swing.JOptionPane"%>
<jsp:useBean id="conexion" class="clases.bdconexion1" scope="page" />
<jsp:useBean id="fuente" class="clases.fuentedato" scope="page"/>
<%@ page contentType="application/json; charset=utf-8" %>

<%@include  file="../chequearsesion.jsp" %>
<%
                     Connection cn = conexion.crearConexion();
     // Asignar conexion al objeto manejador de datos
     fuente.setConexion(cn);   
        String  seleccionados  = request.getParameter("caja_check");
        String combo_disposicion=request.getParameter("disposicion");
        String fecha_alimentacion=request.getParameter("calendario_alimentacion");
        String nro_mesa=request.getParameter("txt_nro_mesa");
        String liberado_por=request.getParameter("txt_lib");
        String  combo_disposicion_insert=request.getParameter("disposicion_insert");
        String lote="";
        String tipo="";
        String tipo_mensaje="";
        String mensaje="";
        String[] elementos = seleccionados.split(",");
        int res_out=1;
        int resultad_final=1;
            
        
   try {    
          
        if(combo_disposicion.equals(combo_disposicion_insert)){
                        cn.setAutoCommit(false);

            for(int i=0; i<elementos.length; i++){
                lote=elementos[i];
 
     tipo="1";
 
       CallableStatement  callableStatement=null;   
            String getDBUSERByUserIdSql = "{call pa_disposicion( ?, ?, ?, ?, ? ,?,? )}";
            callableStatement = cn.prepareCall(getDBUSERByUserIdSql);
            callableStatement .setString(1, lote);
            callableStatement .setString(2, nro_mesa);
            callableStatement .setString(3, fecha_alimentacion);
            callableStatement .setString(4, combo_disposicion_insert);
            callableStatement .setString(5, tipo);
            callableStatement .setString(6, liberado_por);
             callableStatement.registerOutParameter("mensaje", java.sql.Types.INTEGER);
            callableStatement.execute();
            res_out = callableStatement.getInt("mensaje");
                resultad_final=resultad_final*res_out;
         }
           if(resultad_final==0)
            {
                cn.rollback();
            tipo_mensaje="0";
            mensaje="HUBO UN ERROR AL REGISTRAR LA DISPOSICION.";   
            }
            else 
            {
              cn.commit();
               tipo_mensaje="1";
            mensaje="REGISTRADO CON EXITO.";   
           
            }
        
        }
  
        else
            {
  //    6      REPROCESAR LAVAR 7  REPROCESAR RECLASIFICAR   8    ACEPTAR TAL CUAL   
 //     9 CORRECCION            27 AMPLIACION DE LA MUESTRA  30 CONSTATACION DE GCA
      if (combo_disposicion_insert.equals("6")||combo_disposicion_insert.equals("7")||combo_disposicion_insert.equals("8")
        ||combo_disposicion_insert.equals("9")||combo_disposicion_insert.equals("27")||combo_disposicion_insert.equals("30"))
                    {
                 tipo="2";
                           cn.setAutoCommit(false);
 
        for(int i=0; i<elementos.length; i++)
                            {
                lote=elementos[i];
        
          CallableStatement  callableStatement=null;   
            String getDBUSERByUserIdSql = "{call pa_disposicion( ?, ?, ?, ?, ? ,?,? )}";
            callableStatement = cn.prepareCall(getDBUSERByUserIdSql);
            callableStatement .setString(1, lote);
            callableStatement .setString(2, nro_mesa);
            callableStatement .setString(3, fecha_alimentacion);
            callableStatement .setString(4, combo_disposicion_insert);
            callableStatement .setString(5, tipo);
            callableStatement .setString(6, liberado_por);
            callableStatement.registerOutParameter("mensaje", java.sql.Types.INTEGER);
            callableStatement.execute();
            res_out = callableStatement.getInt("mensaje");
            resultad_final=resultad_final*res_out;
            
         
                            }
        
           if(resultad_final==0)
            {
                cn.rollback();
            tipo_mensaje="0";
            mensaje="HUBO UN ERROR AL REGISTRAR LA DISPOSICION.";   
            }
            else 
            {
          
             cn.commit();
              tipo_mensaje="1";
            mensaje="REGISTRADO CON EXITO.";   
           
            }
                    }  
            }  
        } 
            catch (Exception e) {
            tipo_mensaje="0";
            mensaje=e.toString();
                
                                } 

        JSONObject ob = new JSONObject();
        ob=new JSONObject();
        ob.put("tipo_mensaje", tipo_mensaje);
        ob.put("mensaje", mensaje);
        out.print(ob); 
       
       
            %>
           