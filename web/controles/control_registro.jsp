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
     String nrocarro2                    = request.getParameter("cod_carrito");
     String codigo_borroso                    = request.getParameter("codigo_borroso");
     String tipo_maples                    = request.getParameter("tipo_maples");
     String codigo_especial=             request.getParameter("codigo_especial");
     String area="";
     String tipo_huevo                  = request.getParameter("tipo_huevo");
     String cantidad                    = request.getParameter("txt_cantidad");
     String unidad_medida               = request.getParameter("unidad_medida");
     String categoria                   = "";
     String hora_desde                  = request.getParameter("hora_desde");
     String hora_hasta                  = request.getParameter("hora_hasta");
     String fecha                       = request.getParameter("calendario_registro");
     String tipo_aviario                = request.getParameter("tipo_aviario");
     String tipo_almacenamiento         = request.getParameter("tipo_almacenamiento");
     String responsable                 = request.getParameter("txt_responsable");
     String liberado                    = request.getParameter("txt_liberado");
     String comentario                  = request.getParameter("txt_obs");
     String cbox_reproceso              = request.getParameter("cbox_reproceso");
     String cbox_subproducto            = request.getParameter("cbox_sub");
     String cbox_zona                   = request.getParameter("cbox_zona_liberado");
     String nombre_usuario                   = (String) sesionOk.getAttribute("nombre_usuario");
     int res_out =0; 
     int cantidad_bd=0;
     int resultad_final=0;
     int cantidad_movimiento=0;
     String mensaje="";
     int tipo_respuesta=0;
     String combobox="";
     String empacadora="";
     String empacadora_formateada="";
     String tipo_huevo_formateado=""; 
     String unidad_format="";
     String nrocarro="";
     String lote="";
 String contenido_cajones_cargados= "";
 String table_cuerpo= "";
if (clasificadora.trim().equals("A")||clasificadora.trim().equals("B")||clasificadora.trim().equals("H")){
        categoria="FCO";
 }
else {
      categoria="LDO";
}
     String[] empacadora_obs = request.getParameterValues("nro_empacadora");
    if(clasificadora.equals("A")){
       area="CCHA";
                                    }
    else if(clasificadora.equals("B")){
       area="CCHB";
                                    }
    else {
       area="OVO";
                                    }
                if(nrocarro2.length()==2){
                nrocarro="PALLETS"+nrocarro2;
                                          }
                else if(nrocarro2.length()==1){
                nrocarro="PALLETS0"+nrocarro2;
                                          } 
                else{
                nrocarro=nrocarro2;
                        }                                             
      
            String fecha_puesta_form2= fecha_puesta.replace("/","");
            lote=nrocarro+"_"+fecha_puesta_form2+"_"+categoria+"_"+tipo_huevo;
      
            if(tipo_huevo.equals("8")){
             combobox=cbox_subproducto;
                                            }
            else if(tipo_huevo.equals("RP")) {
            combobox=cbox_reproceso;
                                        }
            else  if(tipo_huevo.equals("9"))  {
            combobox=cbox_zona;
                                        }
            else    {
            combobox="N/A";
                    }
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
         

         /*   if(clasificadora.equals("A")){  deposito="6"; }
           else if(clasificadora.equals("B")){  deposito="7";}
           else  if(clasificadora.equals("O")){  deposito="8"; }*/
      
          
            String resul_cantidad="";
            int resultado_unid=0;
            int cantidad_=0;
            int unidad_medi=0;
            if (unidad_medida.equals("1")){ unidad_format ="GR";}
            else if (unidad_medida.equals("180")){ unidad_format ="CAJ";}
            else if (unidad_medida.equals("360")){ unidad_format ="CAJ";}
            else  { unidad_format ="CAR";}
          
          
            if(unidad_medida.equals("180")){
              cantidad_=Integer.parseInt(cantidad);
              unidad_medi=Integer.parseInt(unidad_medida);
              resultado_unid= cantidad_*unidad_medi;
              resul_cantidad=String.valueOf(resultado_unid);
              }
          
            else   if(unidad_medida.equals("360")){
              cantidad_=Integer.parseInt(cantidad);
              unidad_medi=Integer.parseInt(unidad_medida);
              resultado_unid= cantidad_*unidad_medi;
              resul_cantidad=String.valueOf(resultado_unid);
              }
          
           else if(unidad_medida.equals("4320")){
            
              resultado_unid= 4320;
              resul_cantidad=String.valueOf(resultado_unid);
              }

            else   {
            resul_cantidad=  cantidad;
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
           
           if (unidad_format =="CAR"){
               cantidad_movimiento=12;
           }
           else {
               cantidad_movimiento=Integer.parseInt(cantidad);
           }
           
           
             //SI EXISTE ESE CARRO EN EMBARQUE DETALLE CON ESTADO P O N, ENTONCES REGISTRA.
             
            ResultSet rs_carro_embarque = fuente.obtenerDato("select  * from embarque_det   where SUBSTRING(lote,1,6)='"+nrocarro2+"' and estado in ('N','P','TP','TN')");
              
            
            if (rs_carro_embarque.next())
                {
             cn.setAutoCommit(false);
            CallableStatement  callableStatement=null;   
            String getDBUSERByUserIdSql = "{call pa_liberado(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
            callableStatement = cn.prepareCall(getDBUSERByUserIdSql);
            callableStatement .setString(1,  fecha_puesta );
            callableStatement .setString(2,  fecha );
            callableStatement .setString(3, clasificadora);
            callableStatement .setString(4, nrocarro);
            callableStatement .setString(5, lote);
            callableStatement .setString(6, codigo_borroso);
            callableStatement .setString(7, tipo_maples);
            callableStatement .setString(8, codigo_especial);
            callableStatement .setString(9, tipo_huevo_formateado);
            callableStatement .setInt(10, Integer.parseInt(resul_cantidad ) );
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
           
              
              ResultSet result_cantidad_existente=  fuente.obtenerDato("select sum(cantidad) as cantidad from   "
                      + " ( select  case  when tipo_huevo='G' then sum(convert(int,cantidad))/180   "
                      + "else  sum(convert(int,cantidad))/360 end as cantidad from lotes where cod_carrito='"+nrocarro2+"' and cod_carrito not in (  select  substring(lote,0,7)   from embarque_det where substring(lote,0,7)='"+nrocarro2+"' and estado in  ('P','N')) "
                      + "and estado='a' and tipo_huevo not in ('RP')   group by tipo_huevo  "
                     
                      + " union all   select    case  when t0.itemcode=1 then sum(convert(int,t0.quantity))/180     "
                      + "  else sum(convert(int,t0.quantity))/360 end as cantidad   from maehara.dbo.obtq t0    "
                      + "  inner join maehara.dbo.oitm t1 on t0.itemcode=t1.itemcode    "
                      + " inner join maehara.dbo.obtn t2 on t0.itemcode=t2.itemcode "
                      + " and t0.SysNumber=t2.SysNumber where t2.mnfserial='"+nrocarro2+"'  "
                      + "and t0.quantity>0  and t1.ItemCode not in ('8','9')  and t2.MnfSerial not in(select  substring(lote,0,7) collate database_default from embarque_det where substring(lote,0,7)='"+nrocarro2+"' and estado in  ('P','N'))   "
                      + "group by t0.itemcode		 )   u ");
                
               if (result_cantidad_existente.next())
                {
                 cantidad_bd= result_cantidad_existente.getInt("cantidad");
                }
              
         
            
            
              if(unidad_medida.equals("4320")){
                   cn.setAutoCommit(false);
            CallableStatement  callableStatement=null;   
            String getDBUSERByUserIdSql = "{call pa_liberado(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
            callableStatement = cn.prepareCall(getDBUSERByUserIdSql);
            callableStatement .setString(1,  fecha_puesta );
            callableStatement .setString(2,  fecha );
            callableStatement .setString(3, clasificadora);
            callableStatement .setString(4, nrocarro);
            callableStatement .setString(5, lote);
            callableStatement .setString(6, codigo_borroso);
            callableStatement .setString(7, tipo_maples);
            callableStatement .setString(8, codigo_especial);
            callableStatement .setString(9, tipo_huevo_formateado);
            callableStatement .setInt(10, Integer.parseInt(resul_cantidad ) );
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
            if ((cantidad_bd+cantidad_movimiento)>12){
                res_out= resultad_final;
                tipo_respuesta=2;
                mensaje="CANTIDAD EXCEDIDA, TOTAL DE CAJONES CARGADOS "+cantidad_bd;
                //CANTIDAD EXCEDIDA
  ResultSet consulta_tipos_cargados=  fuente.obtenerDato("select tipo_huevo,sum(cantidad) as cantidad,fecha_puesta,clasificadora_actual,estado"
          + " from ( select  tipo_huevo,convert(varchar,fecha_puesta,103) as fecha_puesta ,"
          + "case  when tipo_huevo='G' then sum(convert(int,cantidad))/180  else  sum(convert(int,cantidad))/360 "
          + "end as cantidad,case when clasificadora_actual='A' THEN 'CCHA' when clasificadora_actual='B' THEN 'CCHB' "
          + "when clasificadora_actual='O' THEN 'OVO' when clasificadora_actual='H' THEN  'CCHH'  END AS clasificadora_actual , case  when right(estado_liberacion,1)='L' then 'LIBERADO' ELSE 'RETENIDO' END AS estado "
          + "from lotes where cod_carrito='"+nrocarro+"'  and estado='a' and tipo_huevo not in ('RP')   "
          + "group by tipo_huevo ,fecha_puesta,clasificadora_actual,estado_liberacion "
          + "union all select  case when t0.itemcode=1 then 'G' "
          + "when t0.itemcode=2 then 'J' when t0.itemcode=3 then 'S' when t0.itemcode=4 then 'A' when t0.itemcode=5 then 'B' when t0.itemcode=6 then 'C' when t0.itemcode=7 "
          + "then 'D'end as tipo,convert(varchar,t2.indate,103)  as fecha_puesta,case  when t0.itemcode=1 then sum(convert(int,t0.quantity))/180      "
          + "else sum(convert(int,t0.quantity))/360 end as cantidad  ,t0.WhsCode as clasificadora_actual , 'LIBERADO' AS estado   from maehara.dbo.obtq t0        "
          + " inner join maehara.dbo.oitm t1 on t0.itemcode=t1.itemcode 	"
          + "inner join maehara.dbo.obtn t2 on t0.itemcode=t2.itemcode   	"
          + "and t0.SysNumber=t2.SysNumber where t2.mnfserial='"+nrocarro+"'  	"
          + "and t0.quantity>0  and t1.ItemCode not in ('8','9')    "
          + "group by t0.itemcode,t2.indate ,t0.WhsCode	) t group by tipo_huevo,fecha_puesta,clasificadora_actual,estado");
 
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
            String getDBUSERByUserIdSql = "{call pa_liberado(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
            callableStatement = cn.prepareCall(getDBUSERByUserIdSql);
            callableStatement .setString(1,  fecha_puesta );
            callableStatement .setString(2,  fecha );
            callableStatement .setString(3, clasificadora);
            callableStatement .setString(4, nrocarro);
            callableStatement .setString(5, lote);
            callableStatement .setString(6, codigo_borroso);
            callableStatement .setString(7, tipo_maples);
            callableStatement .setString(8, codigo_especial);
            callableStatement .setString(9, tipo_huevo_formateado);
            callableStatement .setInt(10, Integer.parseInt(resul_cantidad ) );
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