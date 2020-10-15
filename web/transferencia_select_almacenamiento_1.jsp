 <%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="application/json; charset=utf-8" %>
<%@ page language="java" import="java.sql.*" errorPage="error.jsp" %>
 <jsp:useBean id="conexion" class="clases.bdconexion2" scope="page" />
 <jsp:useBean id="fuente" class="clases.fuentedato2" scope="page"/>   
 <jsp:useBean id="conexion_GM" class="clases.bdconexion1" scope="page" />
 <jsp:useBean id="fuente_GM" class="clases.fuentedato" scope="page"/>   
 <%@include  file="chequearsesion.jsp" %>




<%                          
        JSONObject ob = new JSONObject();
        JSONArray jarray = new JSONArray();         
    try {
           
            String grupomaehara="grupomaehara";
            String area =(String) sesionOk.getAttribute("clasificadora");
            String carro =  request.getParameter("id");
            String area_gm = (String) sesionOk.getAttribute("area_gm");   
            ResultSet rs_GM,rs_maehara,rs_maehara_transferidos;
            String area_cch =(String) sesionOk.getAttribute("area_cch");
            List<String> id_lote = new ArrayList<String>();
            List<String> cod_lote = new ArrayList<String>(); 
            List<String> nro_carrito = new ArrayList<String>(); 
            List<String> tipo_huevo = new ArrayList<String>(); 
            List<String> cantidad = new ArrayList<String>(); 
            List<String> fecha_puesta = new ArrayList<String>(); 
            List<String> estado = new ArrayList<String>(); 
            List<String> motivo = new ArrayList<String>(); 
            List<String> estado_costeo = new ArrayList<String>(); 

                Connection cn_GM = conexion_GM.crearConexion();
                fuente_GM.setConexion(cn_GM);  
                Connection cn = conexion.crearConexion();
                fuente.setConexion(cn); 
                
       String res_tipo_sql = "";
       String verificador="0";
       String verificador_SAP="0";
       
        
        
       String sql_maehara=" select l.cod_interno,a.itemcode as tipo_huevo ,case a.itemcode when '1' then 'G' when '2' then 'J' when '3' then 'S' when '4' then 'A' "
               + " WHEN '5' THEN 'B' WHEN '6' THEN 'C' WHEN '7' THEN 'D' else '0' end as tipo_nombre,"
               + " a.mnfserial as cod_carrito,a.DistNumber as cod_lote,convert(int,b.quantity) as cantidad,  "
               + " convert(varchar,a.indate,103) as fecha_puesta,l.estado_liberacion,isnull(lr.motivo_retencion,'N/A') as motivo_retencion  "
               + " from obtn a    inner join obtq b on  a.ItemCode=b.ItemCode   inner join oitm c on c.ItemCode=b.ItemCode   "
               + " and a.SysNumber=b.SysNumber and b.Quantity>0   inner join  grupomaehara.dbo.lotes  l  on l.cod_lote collate database_default=a.distnumber     "
               + " left outer join grupomaehara.dbo.lotes_retenidos  lr on l.cod_lote=lr.cod_lote and lr.movimiento='a'   "
               + " where     a.itemcode in ('1','2', '3', '4', '5', '6', '7') and b.WhsCode='"+area_cch+"'  and a.MnfSerial='"+carro+"'  	"
               + " and 	convert(date,a.InDate)<= convert(date,getdate()) and a.Distnumber not in ( select cod_lote collate database_default from "+grupomaehara+".dbo.lotes_transferencia a   "
               + " inner join "+grupomaehara+".dbo.lotes_transferencia_detalle b on a.id =b.id_cab   where b.cod_carrito='"+carro+"' and b.estado in ('N','P') and b.ubicacion='A' and a.area='"+area+"' UNION ALL select lote collate database_default from "+grupomaehara+".dbo.embarque_det where estado in ('P','TP','N','TN')) ";
            
       
        String sql_maehara_transferidos=" select l.cod_interno,a.itemcode as tipo_huevo , a.mnfserial as cod_carrito,a.DistNumber as "
                + "cod_lote,convert(int,b.quantity) as cantidad,  "
               + " convert(varchar,a.indate,103) as fecha_puesta,l.estado_liberacion,isnull(lr.motivo_retencion,'N/A') as motivo_retencion  "
               + " from obtn a    inner join obtq b on  a.ItemCode=b.ItemCode   inner join oitm c on c.ItemCode=b.ItemCode   "
               + " and a.SysNumber=b.SysNumber and b.Quantity>0   inner join  grupomaehara.dbo.lotes  l  on l.cod_lote collate database_default=a.distnumber     "
               + " left outer join "+grupomaehara+".dbo.lotes_retenidos  lr on l.cod_lote=lr.cod_lote and lr.movimiento='a'   "
               + " where     a.itemcode in ('1','2', '3', '4', '5', '6', '7') and  a.MnfSerial='"+carro+"'  	"
               + " and 	convert(date,a.InDate)<= convert(date,getdate()) and a.Distnumber   in ( select cod_lote collate database_default from "+grupomaehara+".dbo.lotes_transferencia a   "
               + " inner join "+grupomaehara+".dbo.lotes_transferencia_detalle b on a.id =b.id_cab   where b.cod_carrito='"+carro+"' and b.estado in ('N','P') and b.ubicacion='A' and a.destino='"+area+"' UNION ALL select lote collate database_default from "+grupomaehara+".dbo.embarque_det where estado in ('P','TP','N','TN')) ";
            
        String sql="select a.tipo_huevo,a.cod_interno,a.cod_carrito,a.cod_lote,a.cantidad,a.estado_liberacion,  convert(varchar,a.fecha_puesta,103) as   fecha_puesta,"
                        + "isnull(b.motivo_retencion,'N/A')  as motivo_retencion    from lotes a left outer join lotes_retenidos b on a.cod_lote=b.cod_lote and b.movimiento='a'   "
                        + " where a.cod_carrito='"+carro+"' and a.estado='A' and a.clasificadora_actual='"+area+"'  and  a.tipo_huevo not in ('RP','PI','RP')  "
                        + "and    right(a.estado_liberacion,1) in ('L') and a.cod_lote not in (select lote collate database_default from "+grupomaehara+".dbo.embarque_det where estado in ('P','TP','N','TN'))   ";
                         
                      rs_maehara_transferidos = fuente.obtenerDato(sql_maehara_transferidos) ;
                     while(rs_maehara_transferidos.next())
                                {      
                                verificador_SAP= rs_maehara_transferidos.getString("tipo_huevo");  
                               id_lote.add(rs_maehara_transferidos.getString("cod_interno"));  
                               tipo_huevo.add(rs_maehara_transferidos.getString("tipo_huevo"));  
                               nro_carrito.add(  rs_maehara_transferidos.getString("cod_carrito"));   
                               cod_lote.add( rs_maehara_transferidos.getString("cod_lote"));  
                               cantidad.add( rs_maehara_transferidos.getString("cantidad"));  
                               fecha_puesta.add( rs_maehara_transferidos.getString("fecha_puesta"));  
                               estado.add( rs_maehara_transferidos.getString("estado_liberacion"));  
                               motivo.add( rs_maehara_transferidos.getString("motivo_retencion")); 
                               estado_costeo.add("P");     
                                    }
                        rs_maehara = fuente.obtenerDato(sql_maehara) ;

                         while(rs_maehara.next())
                                {      
                                verificador_SAP= rs_maehara.getString("tipo_nombre");  
                               id_lote.add(rs_maehara.getString("cod_interno"));  
                               tipo_huevo.add(rs_maehara.getString("tipo_nombre"));  
                               nro_carrito.add(  rs_maehara.getString("cod_carrito"));   
                               cod_lote.add( rs_maehara.getString("cod_lote"));  
                               cantidad.add( rs_maehara.getString("cantidad"));  
                               fecha_puesta.add( rs_maehara.getString("fecha_puesta"));  
                               estado.add( rs_maehara.getString("estado_liberacion"));  
                               motivo.add( rs_maehara.getString("motivo_retencion")); 
                               estado_costeo.add("P");     
                                    }
                         rs_GM = fuente_GM.obtenerDato(sql) ;
                           while(rs_GM.next())
                               {      
                               verificador_SAP= rs_GM.getString("tipo_huevo");  
                               id_lote.add(rs_GM.getString("cod_interno"));  
                               tipo_huevo.add(rs_GM.getString("tipo_huevo"));  
                               nro_carrito.add(  rs_GM.getString("cod_carrito"));   
                               cod_lote.add( rs_GM.getString("cod_lote"));  
                               cantidad.add( rs_GM.getString("cantidad"));  
                               fecha_puesta.add( rs_GM.getString("fecha_puesta"));  
                               estado.add( rs_GM.getString("estado_liberacion"));  
                               motivo.add( rs_GM.getString("motivo_retencion"));  
                               estado_costeo.add("N");     
                                    }
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                            if(verificador_SAP.equals("0"))
                                { 
                                tipo_huevo.add("0");   
                                nro_carrito.add(carro);   
                                cod_lote.add("0");  
                                cantidad.add("0");  
                                fecha_puesta.add("0");  
                                estado.add("0"); 
                                id_lote.add("0");  
                                motivo.add("0");
                                estado_costeo.add("0");
                                }
                    
        
        for (int i = 0; i < tipo_huevo.size(); i++) 
        {
            ob=new JSONObject();
            ob.put("id", id_lote.get(i));
             ob.put("item_codigo", tipo_huevo.get(i));
             ob.put("nro_carrito", nro_carrito.get(i));
            ob.put("cod_lote", cod_lote.get(i));
            ob.put("cantidad", cantidad.get(i));
            ob.put("fecha_puesta", fecha_puesta.get(i));
            ob.put("estado", estado.get(i));
            ob.put("motivo", motivo.get(i));
            ob.put("estado_costeo", estado_costeo.get(i));
            jarray.put(ob);  
        }
 
    rs_GM.close();
    cn_GM.close();

  
               } catch (Exception e) 
               
        {
                   String a=e.toString();
        } 
  out.print(jarray); 

    %>


