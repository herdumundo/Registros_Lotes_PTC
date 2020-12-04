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
     String fecha_puesta                = request.getParameter("fecha_puesta");
     String usuario                     = (String) sesionOk.getAttribute("usuario");
     String clasificadora               = (String) sesionOk.getAttribute("clasificadora");
     String nrocarro                    = request.getParameter("cod_carrito");
     String codigo_borroso                    = request.getParameter("codigo_borroso");
     String tipo_maples                    = request.getParameter("tipo_maples");
     String codigo_especial=             request.getParameter("codigo_especial");
     String area=                       (String) sesionOk.getAttribute("area_cch");
     String tipo_huevo                  = request.getParameter("tipo_huevo");
        String cantidad                    = request.getParameter("txt_cantidad");
     String unidad_medida               = request.getParameter("unidad_medida");
     String categoria                   = (String) sesionOk.getAttribute("categoria");
     String hora_desde                  = request.getParameter("hora_desde");
     String hora_hasta                  = request.getParameter("hora_hasta");
     String fecha                       = request.getParameter("calendario_registro");
     String tipo_aviario                = request.getParameter("tipo_aviario");
     String tipo_almacenamiento         = request.getParameter("tipo_almacenamiento");
     String responsable                 = request.getParameter("txt_responsable");
     String liberado                    = request.getParameter("txt_liberado");
     String comentario                  = request.getParameter("txt_obs");
     String nombre_usuario                   = (String) sesionOk.getAttribute("nombre_usuario");
     int cantidad_bd=0;
     int cantidad_movimiento=0;
     String mensaje="";
     int tipo_respuesta=0;
     String combobox="N/A";
     String empacadora="";
     String empacadora_formateada="";
     String tipo_huevo_formateado=""; 
     String unidad_format="";
      String lote=nrocarro+"_"+fecha_puesta.replace("/","")+"_"+categoria+"_"+tipo_huevo;
    String contenido_cajones_cargados= "";
    String table_cuerpo= "";
    String[] empacadora_obs = request.getParameterValues("nro_empacadora");
     
             /*   if(nrocarro.length()==2){
                nrocarro="PALLETS"+nrocarro;
                                          }
                else if(nrocarro.length()==1){
                nrocarro="PALLETS0"+nrocarro;
                                          } 
                else{
                nrocarro=nrocarro;
                        }                                             
            */
            if(tipo_huevo.equals("1"))  {
                tipo_huevo_formateado= "G";
                                         }
            else if(tipo_huevo.equals("2"))  {
              tipo_huevo_formateado= "J";
                                        }
            else if(tipo_huevo.equals("3"))  {
              tipo_huevo_formateado= "S";
                                        }
            else  if(tipo_huevo.equals("4"))  {
               tipo_huevo_formateado= "A";
                                        }
            else if(tipo_huevo.equals("5"))  {
               tipo_huevo_formateado= "B";
                                         }
            else  if(tipo_huevo.equals("6"))  {
               tipo_huevo_formateado= "C";
                                         }
            else if(tipo_huevo.equals("7"))  {
               tipo_huevo_formateado= "D";
                                         }
         
          
            int cantidad_unidad_medida=0;
                       
            if (unidad_medida.equals("180")||unidad_medida.equals("360")){ 
                unidad_format ="CAJ";
                cantidad_unidad_medida=Integer.parseInt(cantidad)*Integer.parseInt(unidad_medida);
                cantidad_movimiento=Integer.parseInt(cantidad);
            }
            
            else //if (unidad_medida.equals("4320")  )
                {   unidad_format ="CAR";
                     cantidad_unidad_medida=4320;
                     cantidad_movimiento=12;
                }
             
            for(int i=0; i<empacadora_obs.length; i++)   {
               
                    if (empacadora_obs.length>1){
                        empacadora+=empacadora_obs[i]+"-";  
                        empacadora_formateada=empacadora.toString();
                        empacadora_formateada = empacadora_formateada.substring(0, empacadora_formateada.length() - 1);
                   }
                    if (empacadora_obs.length==1){
                        empacadora+=empacadora_obs[i];  
                        empacadora_formateada=empacadora.toString();
                   }
                                                            }
               
        try {
            //SI EXISTE ESE CARRO EN EMBARQUE DETALLE CON ESTADO P O N, ENTONCES REGISTRA.
             
            ResultSet rs_carro_embarque = fuente.obtenerDato("select  * from embarque_det   where SUBSTRING(lote,1,6)='"+nrocarro+"' and estado in ('N','P','TP','TN')");
              
            ResultSet rs_lote_existente = fuente.obtenerDato("select  * from embarque_det   where  lote ='"+lote+"' and estado in ('N','P','TP','TN')");

            if (rs_carro_embarque.next())
                {
                    
                if(rs_lote_existente.next()){
                    tipo_respuesta=0;
                    mensaje="ERROR, EL LOTE INGRESADO YA SE ENCUENTRA EMBARCADO";   
                }
                    
                else {
                    
                    
                    ResultSet result_cantidad_existente=  fuente.obtenerDato("exec [select_lotes_cant_existente_val] @cod_carrito='"+nrocarro+"' ");
                
               if (result_cantidad_existente.next())
                {
                 cantidad_bd= result_cantidad_existente.getInt("cantidad");
                }
               
               
                cn.setAutoCommit(false);
                CallableStatement  callableStatement=null;   
                callableStatement = cn.prepareCall("{call pa_liberado(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
                callableStatement .setString(1,  fecha_puesta );
                callableStatement .setString(2,  fecha );
                callableStatement .setString(3, clasificadora);
                callableStatement .setString(4, nrocarro);
                callableStatement .setString(5, lote);
                callableStatement .setString(6, codigo_borroso);
                callableStatement .setString(7, tipo_maples);
                callableStatement .setString(8, codigo_especial);
                callableStatement .setString(9, tipo_huevo_formateado);
                callableStatement .setInt(  10, cantidad_unidad_medida );
                callableStatement .setString(11, unidad_format);
                callableStatement .setString(12, categoria);
                callableStatement .setString(13, hora_desde);
                callableStatement .setString(14, hora_hasta);            
                callableStatement .setString(15, tipo_aviario);
                callableStatement .setString(16, tipo_almacenamiento);
                callableStatement .setString(17, empacadora_formateada);
                callableStatement .setString(18, responsable);
                callableStatement .setString(19, comentario);
                callableStatement .setString(20, liberado);
                callableStatement .setString(21, combobox);
                callableStatement .setString(22, nombre_usuario);
                callableStatement.registerOutParameter("mensaje", java.sql.Types.INTEGER);
                callableStatement.execute();
              tipo_respuesta = callableStatement.getInt("mensaje");
              if (tipo_respuesta==0){
                cn.rollback(); 
                tipo_respuesta=0;
                mensaje="ERROR, FAVOR VERIFICAR";
                }   
              else if (tipo_respuesta==55) {
                cn.commit();
                tipo_respuesta=1;
                mensaje="REGISTRADO CON EXITO";
            }
              
              else {
                  
                 cn.rollback(); 
               }  
                    }
                }   
           
           else {
           
              
              ResultSet result_cantidad_existente=  fuente.obtenerDato("exec [select_lotes_cant_existente_val] @cod_carrito='"+nrocarro+"' ");
                
               if (result_cantidad_existente.next())
                {
                 cantidad_bd= result_cantidad_existente.getInt("cantidad");
                }
            
               
               if ((cantidad_bd+cantidad_movimiento)>12)
            {
                //res_out= resultad_final;
                tipo_respuesta=2;
                mensaje="CANTIDAD EXCEDIDA, TOTAL DE CAJONES CARGADOS "+cantidad_bd;
                //CANTIDAD EXCEDIDA
                ResultSet consulta_tipos_cargados=  fuente.obtenerDato("exec [val_tipos_cargados] @cod_carrito='"+nrocarro+"'");

                while (consulta_tipos_cargados.next())
                 {
                     contenido_cajones_cargados=contenido_cajones_cargados+"<tr><td>"+consulta_tipos_cargados.getString("tipo_huevo")+"</td><td>"+
                     consulta_tipos_cargados.getString("cantidad")+"</td><td>"+consulta_tipos_cargados.getString("fecha_puesta")+"</td><td>"+
                     consulta_tipos_cargados.getString("clasificadora_actual")+"</td><td>"+consulta_tipos_cargados.getString("estado")+"</td></tr>";
                 } 
                 table_cuerpo="<table class='table'> "
                 + "<thead> <tr>  <th>Tipo</th><th>Cantidad</th><th>Puesta</th><th>Area</th><th>Estado</th></tr> </thead>"
                 + "<tbody>"+contenido_cajones_cargados+"</tbody></table> ";
             }
              
         
            
        //SI ES CARRITO NORMAL, NO INGRESA EN LA VERIFICACION DE SI SUPERA LA CANTIDAD EXISTENTE DE CAJONES    
              if(unidad_medida.equals("4320")){
                   cn.setAutoCommit(false);
            CallableStatement  callableStatement=null;   
            callableStatement = cn.prepareCall("{call pa_liberado(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            callableStatement .setString(1,  fecha_puesta );
            callableStatement .setString(2,  fecha );
            callableStatement .setString(3, clasificadora);
            callableStatement .setString(4, nrocarro);
            callableStatement .setString(5, lote);
            callableStatement .setString(6, codigo_borroso);
            callableStatement .setString(7, tipo_maples);
            callableStatement .setString(8, codigo_especial);
            callableStatement .setString(9, tipo_huevo_formateado);
            callableStatement .setInt(10, cantidad_unidad_medida  );
            callableStatement .setString(11, unidad_format);
            callableStatement .setString(12, categoria);
            callableStatement .setString(13, hora_desde);
            callableStatement .setString(14, hora_hasta);            
            callableStatement .setString(15, tipo_aviario);
            callableStatement .setString(16, tipo_almacenamiento);
            callableStatement .setString(17, empacadora_formateada);
            callableStatement .setString(18, responsable);
            callableStatement .setString(19, comentario);
            callableStatement .setString(20, liberado);
            callableStatement .setString(21, combobox);
            callableStatement .setString(22, nombre_usuario);
            callableStatement.registerOutParameter("mensaje", java.sql.Types.INTEGER);
            callableStatement.execute();
              tipo_respuesta = callableStatement.getInt("mensaje");
              if (tipo_respuesta==0){
               cn.rollback(); 
                tipo_respuesta=0;
                 mensaje="ERROR, FAVOR VERIFICAR";


            }   
             else if (tipo_respuesta==55) {
                cn.commit();
                tipo_respuesta=1;
                mensaje="REGISTRADO CON EXITO";
            }
              
              else {
                  
                 cn.rollback(); 
               }
              }
          
             
            else {
        if ((cantidad_bd+cantidad_movimiento)>12)
            {
                //res_out= resultad_final;
                tipo_respuesta=2;
                mensaje="CANTIDAD EXCEDIDA, TOTAL DE CAJONES CARGADOS "+cantidad_bd;
                //CANTIDAD EXCEDIDA
                ResultSet consulta_tipos_cargados=  fuente.obtenerDato("exec [val_tipos_cargados] @cod_carrito='"+nrocarro+"'");

                while (consulta_tipos_cargados.next())
                 {
                     contenido_cajones_cargados=contenido_cajones_cargados+"<tr><td>"+consulta_tipos_cargados.getString("tipo_huevo")+"</td><td>"+
                     consulta_tipos_cargados.getString("cantidad")+"</td><td>"+consulta_tipos_cargados.getString("fecha_puesta")+"</td><td>"+
                     consulta_tipos_cargados.getString("clasificadora_actual")+"</td><td>"+consulta_tipos_cargados.getString("estado")+"</td></tr>";
                 } 
                 table_cuerpo="<table class='table'> "
                 + "<thead> <tr>  <th>Tipo</th><th>Cantidad</th><th>Puesta</th><th>Area</th><th>Estado</th></tr> </thead>"
                 + "<tbody>"+contenido_cajones_cargados+"</tbody></table> ";
             }
        else {
            cn.setAutoCommit(false);
            CallableStatement  callableStatement=null;   
            callableStatement = cn.prepareCall("{call pa_liberado(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            callableStatement .setString(1,  fecha_puesta );
            callableStatement .setString(2,  fecha );
            callableStatement .setString(3, clasificadora);
            callableStatement .setString(4, nrocarro);
            callableStatement .setString(5, lote);
            callableStatement .setString(6, codigo_borroso);
            callableStatement .setString(7, tipo_maples);
            callableStatement .setString(8, codigo_especial);
            callableStatement .setString(9, tipo_huevo_formateado);
            callableStatement .setInt(10,   cantidad_unidad_medida  );
            callableStatement .setString(11, unidad_format);
            callableStatement .setString(12, categoria);
            callableStatement .setString(13, hora_desde);
            callableStatement .setString(14, hora_hasta);            
            callableStatement .setString(15, tipo_aviario);
            callableStatement .setString(16, tipo_almacenamiento);
            callableStatement .setString(17, empacadora_formateada);
            callableStatement .setString(18, responsable);
            callableStatement .setString(19, comentario);
            callableStatement .setString(20, liberado);
            callableStatement .setString(21, combobox);
            callableStatement .setString(22, nombre_usuario);

            callableStatement.registerOutParameter("mensaje", java.sql.Types.INTEGER);
            callableStatement.execute();
              tipo_respuesta = callableStatement.getInt("mensaje");
              if (tipo_respuesta==0){
                cn.rollback(); 
                tipo_respuesta=0;
                mensaje="ERROR, FAVOR VERIFICAR";

            }   
              else if (tipo_respuesta==55) {
                cn.commit();
                tipo_respuesta=1;
                mensaje="REGISTRADO CON EXITO";
            }
              
              else {
                  
                 cn.rollback(); 
               }
            }
                         }
            
          }
 
            ob.put("mensaje", mensaje);
            ob.put("tipo_respuesta", tipo_respuesta);
            ob.put("cajones_cargados", table_cuerpo);
          
         } catch (Exception e) {
           
        ob.put("mensaje", e.toString());
        ob.put("tipo_respuesta", "0");
        ob.put("cajones_cargados", table_cuerpo);

         }
       
       
       out.print(ob);
       
     %>