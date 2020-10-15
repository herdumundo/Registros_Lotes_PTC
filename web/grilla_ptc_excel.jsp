
<%@page import="javax.swing.JOptionPane"%>
<%@ page language="java" import="java.sql.*" errorPage="error.jsp" %>
<jsp:useBean id="conexion" class="clases.bdconexion1" scope="page" />
<jsp:useBean id="fuente" class="clases.fuentedato" scope="page"/>
<%@include  file="chequearsesion.jsp" %>
<%
  
// Crear objeto de conexion al DB
	// Crear objeto de conexion al DB
	Connection cn = conexion.crearConexion();
	// Asignar conexion al objeto manejador de datos
	fuente.setConexion(cn);
       //Parametros
       String calendario    = request.getParameter("calendario_informe");
       String area = (String) sesionOk.getAttribute("clasificadora");
      String cbox_estado_liberacion =request.getParameter("estado");
            String tipo_huevo =request.getParameter("tipo_huevo");

 
        try {
          
       String SQL="";
String sql_liberado=" select    isnull(stuff(( select '  '+  convert(varchar,[fecha_involucrada],103)  "
        + "from correccion_lotes  where cod_lote = t.cod_lote for XML path('') ),1,1,''),'')   as fecha_involucrada,"
        + "cod_cambio,cod_lote,cod_carrito,codigo_borroso,tipo_maples,fecha_puesta,convert(varchar,fecha,103)as fecha,"
        + "hora_clasificacion,cod_carrito,tipo_huevo,empacadora,categoria,aviario,tipo_almacenamiento,"
        + "resp_clasificacion,estado_liberacion,estado_del_producto,motivo_retencion,Disposicion,liberado_por,"
        + "fecha_alimentacion,mesa_mumero,isnull(convert(varchar,fecha_embarque,103),' ') as fecha_embarque,clasificadora "
        + "from (    select   h.docdate as fecha_embarque, a.cod_lote,isnull(a.cod_cambio,'-') as cod_cambio, "
        + "a.cod_carrito, isnull(a.codigo_borroso,'-') as codigo_borroso,isnull(a.tipo_maples,'-') as tipo_maples, "
        + "'L' as tipo,  convert(varchar,a.fecha_puesta,103) as fecha_puesta,convert(varchar,a.fecha,103) as fecha,"
        + "a.hora_clasificacion,a.tipo_huevo,a.empacadora,a.cod_clasificacion as categoria ,a.aviario,"
        + "a.tipo_almacenamiento,a.resp_clasificacion,replace(a.estado_liberacion,'Z','R.') as estado_liberacion,"
        + "'' as estado_del_producto,'' as motivo_retencion, '' as Disposicion, a.liberado_por, "
        + "'' as fecha_alimentacion,isnull(a.cod_cambio,'-') as mesa_mumero,a.clasificadora "
        + "from   maehara.dbo.odln h  inner join maehara.dbo.oitl b on h.DocEntry =b.DocEntry   "
        + "inner join maehara.dbo.itl1 c on b.LogEntry=c.LogEntry  "
        + "inner join maehara.dbo.obtn d on c.ItemCode=d.ItemCode and c.SysNumber=d.SysNumber  "
        + "right outer join lotes a  on a.cod_lote collate database_default=d.DistNumber where a.estado_liberacion='l'  "
        + " and a.tipo_huevo not in ('RP', 'PI', 'R')  and   convert(varchar,a.fecha_puesta,103)=  '"+calendario+"' "
        + "and a.clasificadora= '"+area+"' and  left(a.cod_carrito,1)not in ('9','P') and a.estado not in ('E') and a.cantidad >= 4320)t "
        + "union all  "
        + "select    isnull(stuff(( select   '  '+  convert(varchar,[fecha_involucrada],103)  "
        + "from correccion_lotes  where cod_lote = t.cod_lote for XML path('') ),1,1,''),'')   "
        + "as fecha_involucrada,cod_cambio,cod_lote,cod_carrito,codigo_borroso,tipo_maples,fecha_puesta,"
        + "convert(varchar,fecha,103)as fecha,hora_clasificacion,cod_carrito,tipo_huevo,"
        + "empacadora,categoria,aviario,tipo_almacenamiento,resp_clasificacion,estado_liberacion,"
        + "estado_del_producto,motivo_retencion,Disposicion,liberado_por,fecha_alimentacion,mesa_mumero,isnull(convert(varchar,fecha_embarque,103),' ') as fecha_embarque,"
        + "clasificadora from (  select  h.docdate as fecha_embarque, a.cod_lote, a.cod_carrito as cod_cambio,"
        + "isnull(a.cod_cambio,'-') as   cod_carrito , isnull(a.codigo_borroso,'-') as codigo_borroso,"
        + "isnull(a.tipo_maples,'-') as tipo_maples, 'L' as tipo, convert(varchar,a.fecha_puesta,103) as fecha_puesta,"
        + "convert(varchar,a.fecha,103) as fecha,a.hora_clasificacion,a.tipo_huevo,a.empacadora,a.cod_clasificacion as categoria ,"
        + "a.aviario,a.tipo_almacenamiento,a.resp_clasificacion,replace(a.estado_liberacion,'Z','R.') as estado_liberacion,'' "
        + "as estado_del_producto,'' as motivo_retencion, '' as Disposicion, a.liberado_por, '' as fecha_alimentacion,'' as mesa_mumero,"
        + "a.clasificadora from    "
        + "maehara.dbo.odln h  inner join maehara.dbo.oitl b on h.DocEntry =b.DocEntry   "
        + "inner join maehara.dbo.itl1 c on b.LogEntry=c.LogEntry  inner join maehara.dbo.obtn d "
        + "on c.ItemCode=d.ItemCode and c.SysNumber=d.SysNumber  right outer join lotes a  on a.cod_lote"
        + " collate database_default=d.DistNumber    where a.estado_liberacion='l'   and a.tipo_huevo not in ('RP', 'PI', 'R') and  "
        + "(left(a.cod_carrito,1)='9' or left(a.cod_carrito,1)='p')  and  convert(varchar,a.fecha_puesta,103)='"+calendario+"'   "
        + "and a.clasificadora= '"+area+"' and a.cantidad >= 4320 and a.estado not in ('E') )t "
        + " union all select   "
        + " isnull(stuff(( select   '  '+  convert(varchar,[fecha_involucrada],103)  from correccion_lotes  "
        + "where cod_lote = t.cod_lote for XML path('') ),1,1,''),'')   as fecha_involucrada,cod_cambio,cod_lote,cod_carrito,"
        + "codigo_borroso,tipo_maples,fecha_puesta,convert(varchar,fecha,103)as fecha,hora_clasificacion,cod_carrito,tipo_huevo,"
        + "empacadora,categoria,aviario,tipo_almacenamiento,resp_clasificacion,estado_liberacion,estado_del_producto,"
        + "motivo_retencion,Disposicion,liberado_por,fecha_alimentacion,mesa_mumero,isnull(convert(varchar,fecha_embarque,103),' ') as fecha_embarque,clasificadora from ( select min(b.fecha) as fecha,   h.docdate as fecha_embarque,c.cod_lote,isnull(c.cod_cambio,'-')as cod_cambio, c.cod_carrito,isnull(c.codigo_borroso,'-') as codigo_borroso, isnull(c.tipo_maples,'-') as tipo_maples,'L' as tipo,convert(varchar,c.fecha_puesta,103) as fecha_puesta ,c.hora_clasificacion, c.tipo_huevo,c.empacadora,c.cod_clasificacion as categoria ,c.aviario,c.tipo_almacenamiento,c.resp_clasificacion,replace(a.estado_liberacion,'Z','R.') as  estado_liberacion,c.estado_retencion as estado_del_producto,c.motivo_retencion,   m.descripcion as Disposicion, c.liberado_por, c.fecha_alimentacion ,isnull(a.cod_cambio,'-') as mesa_mumero,a.clasificadora from maehara.dbo.odln h  inner join maehara.dbo.oitl oi on h.DocEntry =oi.DocEntry  inner join maehara.dbo.itl1 it on oi.LogEntry=it.LogEntry inner join maehara.dbo.obtn d on it.ItemCode=d.ItemCode and it.SysNumber=d.SysNumber   right outer join  lotes a  on a.cod_lote collate database_default=d.DistNumber   inner join lotes_retenidos b on a.cod_lote = b.cod_lote inner join lotes_retenidos c on a.cod_lote = c.cod_lote and c.movimiento = 'a' inner join motivo_retencion m on c.disposicion=m.id where convert(varchar,a.fecha_puesta,103)= '"+calendario+"'  and  left(c.cod_carrito,1)not in ('9','P')and right(a.estado_liberacion,1)='l' and len(a.estado_liberacion)>1 and a.clasificadora='"+area+"' and a.tipo_huevo not in ('RP', 'PI', 'R')  and a.cantidad >= 4320 group by  c.fecha,h.docdate,c.cod_lote,c.cod_cambio,c.cod_carrito,c.codigo_borroso,c.tipo_maples,c.hora_clasificacion, c.tipo_huevo,c.empacadora,c.cod_clasificacion   ,c.aviario,c.tipo_almacenamiento,c.resp_clasificacion,c.fecha_puesta,a.estado_liberacion,c.estado_retencion ,c.motivo_retencion,   m.descripcion  , c.liberado_por, c.fecha_alimentacion ,a.cod_cambio ,a.clasificadora  )t";
   

String sql_retenido="select    isnull(stuff(( select  '  '+  convert(varchar,[fecha_involucrada],103)  "
        + "from correccion_lotes  where cod_lote = t.cod_lote for XML path('') ),1,1,''),'-') as fecha_involucrada,"
        + "cod_cambio,cod_lote,cod_carrito,codigo_borroso,tipo_maples,convert(varchar,fecha_puesta,103)as fecha,"
        + "convert(varchar,fecha,103)as fecha,replace(hora_clasificacion,'-','_') as hora_clasificacion,"
        + "cod_carrito,tipo_huevo,replace(empacadora,'-','_') as empacadora,categoria,aviario,tipo_almacenamiento,"
        + "resp_clasificacion,estado_liberacion,estado_del_producto,motivo_retencion,Disposicion,isnull(liberado_por,'-') as liberado_por,"
        + "isnull(convert(varchar,fecha_alimentacion,103),'-') as fecha_alimentacion, isnull(mesa_numero,'-') as mesa_numero ,"
        + "isnull(convert(varchar,fecha_embarque,103),' ') as fecha_embarque,clasificadora from ( select min(b.fecha) as fecha, "
        + " h.docdate as fecha_embarque,c.cod_lote,isnull(c.cod_cambio,'-')as cod_cambio, c.cod_carrito,isnull(c.codigo_borroso,'-') as codigo_borroso, "
        + "isnull(c.tipo_maples,'-') as tipo_maples,'R' as tipo,convert(varchar,c.fecha_puesta,103) as fecha_puesta ,c.hora_clasificacion, c.tipo_huevo,"
        + "c.empacadora,c.cod_clasificacion as categoria ,c.aviario,c.tipo_almacenamiento,c.resp_clasificacion,replace(a.estado_liberacion,'Z','R.') as  estado_liberacion,"
        + "c.estado_retencion as estado_del_producto,c.motivo_retencion,   m.descripcion as Disposicion, c.liberado_por, c.fecha_alimentacion ,a.cod_cambio as mesa_numero,"
        + "a.clasificadora from maehara.dbo.odln h  inner join maehara.dbo.oitl oi on h.DocEntry =oi.DocEntry inner join maehara.dbo.itl1 it on oi.LogEntry=it.LogEntry "
        + "inner join maehara.dbo.obtn d on it.ItemCode=d.ItemCode and it.SysNumber=d.SysNumber   right outer join  lotes a  on a.cod_lote collate database_default=d.DistNumber   "
        + "inner join lotes_retenidos b on a.cod_lote = b.cod_lote "
        + "inner join lotes_retenidos c on a.cod_lote = c.cod_lote and c.movimiento = 'a' "
        + "inner join motivo_retencion m on c.disposicion=m.id where convert(varchar,a.fecha_puesta,103)= '"+calendario+"'   "
        + "and  left(c.cod_carrito,1)not in ('9','P')and right(a.estado_liberacion,1) in ('R','Z') and a.estado not in ('E')"
        + "and c.clasificadora= '"+area+"' and a.cantidad >= 4320 group by  c.fecha,h.docdate,c.cod_lote,c.cod_cambio,c.cod_carrito,"
        + "c.codigo_borroso,c.tipo_maples,c.hora_clasificacion, c.tipo_huevo,c.empacadora,c.cod_clasificacion   ,"
        + "c.aviario,c.tipo_almacenamiento,c.resp_clasificacion,c.fecha_puesta,a.estado_liberacion,c.estado_retencion , "
        + "c.motivo_retencion,    m.descripcion  ,  c.liberado_por, c.fecha_alimentacion ,a.cod_cambio ,a.clasificadora )t "
        + "union all select    "
        + "isnull(stuff(( select  '  '+  convert(varchar,[fecha_involucrada],103)  "
        + "from correccion_lotes  where cod_lote = t.cod_lote for XML path('') ),1,1,''),'-')  as fecha_involucrada,"
        + "cod_cambio,cod_lote,cod_carrito,codigo_borroso,tipo_maples,convert(varchar,fecha_puesta,103)as fecha,"
        + "convert(varchar,fecha,103)as fecha,replace(hora_clasificacion,'-','_') as hora_clasificacion,cod_carrito,"
        + "tipo_huevo,replace(empacadora,'-','_') as empacadora,categoria,aviario,tipo_almacenamiento,resp_clasificacion,"
        + "estado_liberacion,estado_del_producto,motivo_retencion,Disposicion,isnull(liberado_por,'-') as liberado_por,"
        + "isnull(convert(varchar,fecha_alimentacion,103),'-') as fecha_alimentacion, isnull(mesa_numero,'-') as mesa_numero ,isnull(convert(varchar,fecha_embarque,103),' ') as fecha_embarque,"
        + "clasificadora from (  select min(b.fecha) as fecha,   h.docdate as fecha_embarque,c.cod_lote,isnull(c.cod_cambio,'-')as cod_cambio, c.cod_carrito,"
        + "isnull(c.codigo_borroso,'-') as codigo_borroso, isnull(c.tipo_maples,'-') as tipo_maples,'R' as tipo,convert(varchar,c.fecha_puesta,103) as fecha_puesta ,"
        + "c.hora_clasificacion, c.tipo_huevo,c.empacadora,c.cod_clasificacion as categoria ,c.aviario,c.tipo_almacenamiento,"
        + "c.resp_clasificacion,replace(a.estado_liberacion,'Z','R.') as  estado_liberacion,c.estado_retencion as estado_del_producto, c.motivo_retencion,    "
        + "m.descripcion as Disposicion,  c.liberado_por, c.fecha_alimentacion ,a.cod_cambio as mesa_numero,a.clasificadora from maehara.dbo.odln h  "
        + "inner join maehara.dbo.oitl oi on h.DocEntry =oi.DocEntry inner join maehara.dbo.itl1 it on oi.LogEntry=it.LogEntry "
        + "inner join maehara.dbo.obtn d on it.ItemCode=d.ItemCode and it.SysNumber=d.SysNumber   right outer join  "
        + "lotes a  on a.cod_lote collate database_default=d.DistNumber   inner join lotes_retenidos b on a.cod_lote = b.cod_lote "
        + "inner join lotes_retenidos c on a.cod_lote = c.cod_lote and c.movimiento = 'a' "
        + "inner join motivo_retencion m on c.disposicion=m.id where convert(varchar,a.fecha_puesta,103)= '"+calendario+"'  "
        + "and  left(c.cod_carrito,1)not in ('9','P') and right(a.estado_liberacion,1) in ('R','Z') and len(a.estado_liberacion)>1 and "
        + "left(c.cod_carrito,1)  in ('9','P')  and c.clasificadora='"+area+"' and a.estado not in ('E')  and a.cantidad >= 4320 group by  c.fecha,h.docdate,c.cod_lote,c.cod_cambio,"
        + "c.cod_carrito,c.codigo_borroso,c.tipo_maples,c.hora_clasificacion, c.tipo_huevo,c.empacadora,c.cod_clasificacion   ,"
        + "c.aviario,c.tipo_almacenamiento,c.resp_clasificacion,c.fecha_puesta,a.estado_liberacion,c.estado_retencion , c.motivo_retencion,   "
        + " m.descripcion  ,  c.liberado_por, c.fecha_alimentacion ,a.cod_cambio,a.clasificadora  )t";

   if(cbox_estado_liberacion.equals("L")){
       
       SQL=sql_liberado;
   }
   else {
       SQL=sql_retenido;
   }
%>

   
    <tr>                         
                        <th>AREA</th>
                         <th>FECHA DE PUESTA</th>
                         <th>FECHA DE CLASIFICACION</th>
                        <th>HORA DE EMPAQUE</th>
                        <th>CODIGO DEL CARRITO</th>
                        <th>FECHAS DE PUESTAS INVOLUCRADAS</th>
                        <th>TIPO DE HUEVO </th>
                        <th>TIPO DE MAPLES</th>
                        <th>EMPACADORA</th>
                        <th>CATEGORIA</th> 
                        <th>AVIARIO</th> 
                        <th>TIPO ALMACENAMIENTO</th> 
                        <th>CODIGO DE PALLET</th> 
                        <th>RESPONSABLE</th>  
                        <th>ESTADO DE LIBERACION</th> 
                        <th>CODIGO BORROSO</th> 
                        <th>ESTADO DEL PRODUCTO</th> 
                        <th>MOTIVO</th> 
                        <th>DISPOSICION</th> 
                         <th>LIBERADO POR</th> 
                         
                        <th>FECHA DE EMBARQUE</th> 
                        
    </tr>
        <%
      
      
         ResultSet rs = fuente.obtenerDato(SQL);
       
     while(rs.next()){
         String empacadora=rs.getString(12).replaceAll("-", "_");
     String hora_empaque=rs.getString(9);
     String hora_empaque_format=hora_empaque.replaceAll("-", "_");


         
 %>
    <tr>  
                                     <td><%=rs.getString(25)%>    </td>

                             <td><%=rs.getString(7)%>    </td>
                            <td><%=rs.getString(8)%>    </td>
                            <td><%=hora_empaque_format%>    </td>
                            <td><%=rs.getString(10)%>    </td>
                            <td><%=rs.getString(1)%>    </td>
                            <td><%=rs.getString(11)%>    </td>
                            <td><%=rs.getString(6)%>    </td>  
                            <td><%=empacadora%>    </td>  
                            <td><%=rs.getString(13)%>   </td>  
                            <td><%=rs.getString(14)%>   </td>  
                            <td><%=rs.getString(15)%>   </td> 
                            <td><%=rs.getString(2)%>   </td>  
                            <td><%=rs.getString(16)%>   </td>  
                            <td><%=rs.getString(17)%>   </td>  
                             <td><%=rs.getString(5)%>   </td> 
                             <td><%=rs.getString(18)%>   </td> 
                             <td><%=rs.getString(19)%>   </td> 
                             <td><%=rs.getString(20)%>   </td> 
                             <td><%=rs.getString(22)%>   </td> 
                             <td><%=rs.getString(24)%>   </td> 
                          
                                                    </tr>
       <% }       
            } catch (Exception e) {
String a=e.toString();
            }%>
     
       
        