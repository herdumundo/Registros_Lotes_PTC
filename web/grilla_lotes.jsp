<%@page import="javax.swing.JOptionPane"%>
<%@ page language="java" import="java.sql.*" errorPage="error.jsp" %>
<jsp:useBean id="conexion" class="clases.bdconexion1" scope="page" />
<jsp:useBean id="fuente" class="clases.fuentedato" scope="page"/>
<%@include  file="chequearsesion.jsp" %>


<script> 
    
    $("#buscar_retenido").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#tabla_retenido tr").filter(function() {
     $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                                               });
                       });
  
</script>

   <script>
   
    $('#tabla_retenido td:last-child:contains(R)').closest('tr').css('background-color', '#FFA07A');
    $('#tabla_retenido td:last-child:contains(.)').closest('tr').css('background-color', '#00FFFF');
         $('#tabla_retenido td:last-child:contains(L)').closest('tr').css('background-color', '#90EE90');

          $('.record_table tr').click(function (event) {
        if (event.target.type !== 'checkbox') {
            $(':checkbox', this).trigger('click');
        }
    });

    $("input[type='checkbox']").change(function (e) {
        if ($(this).is(":checked")) {
            $(this).closest('tr').addClass("highlight_row");
        } else {
            $(this).closest('tr').removeClass("highlight_row");
        }
    });  
   //$('#tabla_rep td:last-child:contains(R)').closest('tr').css('background-color', '#FFA07A').css('.record_table tr:hover { background: #eee; }');
    	$('#tabla_rep td:last-child:contains(R)').closest('tr').css('background-color', '#FFA07A');
    $('#tabla_rep td:last-child:contains(.)').closest('tr').css('background-color', '#00FFFF');
$("tr").not(':first').hover(
  function () {
    $(this).css("background","yellow");
  }, 
  function () {
    $('#tabla_retenido td:last-child:contains(R)').closest('tr').css('background-color', '#FFA07A');
    $('#tabla_retenido td:last-child:contains(.)').closest('tr').css('background-color', '#00FFFF');
     $('#tabla_retenido td:last-child:contains(L)').closest('tr').css('background-color', '#90EE90');
}
);
   //$('#tabla_rep td:last-child:contains(R)').hover("background","yellow");

               
        </script>
            <div   class="row">
            <div class="col-md-12">
                <div class="panel panel-primary">
                    
                    <input class="form-control" id="buscar_retenido" type="text" placeholder="Buscar">
                        <table  id="tabla_retenido" data-row-style="rowStyle" class="table record_table"data-toggle="table" data-click-to-select="true">
              
              
               <thead  >
                  <th style="font-weight: bold;">
                 Id
                </th>
                <th style="font-weight: bold;">
                 Carro
                </th>
                <th style="font-weight: bold;" >
                  Tipo
                </th>
                 <th style="font-weight: bold;">
                  Estado
                </th>
   
                 <th><input type="checkbox" id="box_retenidos"> 
                 <label style="font-weight: bold;" for="box_retenidos">SELECCIONAR</label></th>
                   
              </thead>
              <tbody id="tabla_retenido">
                  <%
        Connection cn = conexion.crearConexion();
        String hora_desde  = request.getParameter("inicio_retenido");
        String combo_estado=request.getParameter("combo_estado_retenido");
        String hora_fin  = request.getParameter("fin_retenido");
        String inicio_fin= hora_desde+"-"+hora_fin;
        String calendario=request.getParameter("fecha_retenido");
        String clasificadora    = (String) sesionOk.getAttribute("clasificadora");
        String sql_global="";
        String liberar_retenido="";
        fuente.setConexion(cn); 
        try {
            
               liberar_retenido="   select a.cod_interno,a.cod_lote,a.cod_carrito,a.tipo_huevo,   replace(right (replace(a.estado_liberacion,'Z','R.'),1),'.','R.') as local   "
                      + " from lotes  a inner join lotes_retenidos b on a.cod_interno=b.id_lote  and b.disposicion not in('7','6') and b.movimiento='a'   "
                      + " where	 "
                      + " convert(int,right('00' + ltrim(rtrim(ltrim(rtrim(substring(a.hora_clasificacion,1,charindex('-',a.hora_clasificacion,1)-1))))),2))>='"+hora_desde+"' "
                      + "  and  convert(int,right('00' + ltrim(rtrim(ltrim(rtrim(substring(a.hora_clasificacion,1,charindex('-',a.hora_clasificacion,1)-1))))),2))<='"+hora_fin+"'     "
                      + " and convert(int,right('00' + ltrim(rtrim(ltrim(rtrim(substring(a.hora_clasificacion,charindex('-',a.hora_clasificacion,1)+1,len(a.hora_clasificacion)))))),2))<='"+hora_fin+"'                              "
                      + " and convert(int,right('00' + ltrim(rtrim(ltrim(rtrim(substring(a.hora_clasificacion, charindex('-',a.hora_clasificacion,1)+1,len(a.hora_clasificacion)))))),2))>='"+hora_desde+"' 		"
                      + " and  convert(varchar,a.fecha,103)='"+calendario+"' and  right(a.estado_liberacion,1)in   ('Z','R')   and a.hora_clasificacion!='-' and a.tipo_huevo not in ('PI','R','RP')   "
                      + " and a.clasificadora_actual='"+clasificadora+"' and a.estado='a'   ";
           
              
              String retener_con_reporte_liberado_y_retenido="	select a.cod_interno,a.cod_lote,a.cod_carrito,a.tipo_huevo,   replace(right (replace(a.estado_liberacion,'Z','R.'),1),'.','R.') as local   	"
                      + " from lotes  a left outer join lotes_retenidos b on a.cod_lote=b.cod_lote  and b.movimiento='a' "
                      + "where	 convert(int,right('00' + ltrim(rtrim(ltrim(rtrim(substring(a.hora_clasificacion,1,charindex('-',a.hora_clasificacion,1)-1))))),2))>='"+hora_desde+"'                   "
                      + "and  convert(int,right('00' + ltrim(rtrim(ltrim(rtrim(substring(a.hora_clasificacion,1,charindex('-',a.hora_clasificacion,1)-1))))),2))<='"+hora_fin+"'      "
                      + "and convert(int,right('00' + ltrim(rtrim(ltrim(rtrim(substring(a.hora_clasificacion,charindex('-',a.hora_clasificacion,1)+1,len(a.hora_clasificacion)))))),2))<='"+hora_fin+"' "
                      + "  and convert(int,right('00' + ltrim(rtrim(ltrim(rtrim(substring(a.hora_clasificacion, charindex('-',a.hora_clasificacion,1)+1,len(a.hora_clasificacion)))))),2))>='"+hora_desde+"' "
                      + "  and  convert(varchar,a.fecha,103)='"+calendario+"' and  right(a.estado_liberacion,1) in   ('R','L')   and a.hora_clasificacion!='-' and a.tipo_huevo not in ('PI','R','RP') "
                      + "  and a.clasificadora_actual='"+clasificadora+"' and a.estado='a' and a.cod_lote not in (select lote from embarque_det where estado in ('N','P'))  ";
              
                 
              String retener_liberado=" select cod_interno,cod_lote,cod_carrito,tipo_huevo,   replace(right (replace(estado_liberacion,'Z','R.'),1),'.','R.') as local  "+
                       " from lotes  "  +
                       " where	 "+
                       " convert(int,right('00' + ltrim(rtrim(ltrim(rtrim(substring(hora_clasificacion,1,charindex('-',hora_clasificacion,1)-1))))),2))>='"+hora_desde+"' "+
                       " and  convert(int,right('00' + ltrim(rtrim(ltrim(rtrim(substring(hora_clasificacion,1,charindex('-',hora_clasificacion,1)-1))))),2))<='"+hora_fin+"'  "   +
                       " and convert(int,right('00' + ltrim(rtrim(ltrim(rtrim(substring(hora_clasificacion,charindex('-',hora_clasificacion,1)+1,len(hora_clasificacion)))))),2))<='"+hora_fin+"'  "     +                       
                       " and convert(int,right('00' + ltrim(rtrim(ltrim(rtrim(substring(hora_clasificacion, charindex('-',hora_clasificacion,1)+1,len(hora_clasificacion)))))),2))>='"+hora_desde+"' "	+	
                       " and  convert(varchar,fecha,103)='"+calendario+"' and  right(estado_liberacion,1)in   ('L')   and hora_clasificacion!='-' and tipo_huevo not in ('PI','R','RP')   "+
                       " and clasificadora_actual='"+clasificadora+"' and estado='a' and  cod_lote not in (select lote from embarque_det where estado in ('N','P'))";
              
        if  (combo_estado.equals("Z")) 
            {
               sql_global=retener_con_reporte_liberado_y_retenido;
            }
        else if  (combo_estado.equals("R")) 
            {
               sql_global=retener_liberado;
            }
        else if  (combo_estado.equals("L")) 
            {
               sql_global=liberar_retenido;
            }
        ResultSet rs = fuente.obtenerDato(sql_global);
    
        while(rs.next()){
            %>
        <tr style="font-weight: bold;">  
       <td class="chk"  ><%=rs.getString("cod_lote")%></td> 
       <td><%=rs.getString("cod_carrito")%></td>
       <td><%=rs.getString("tipo_huevo")%></td> 
       <td><%=rs.getString("local")%></td> 
       <td><input name="checks[]" class="checkbox" type='checkbox' value="<%=rs.getString("cod_lote")+"-"+rs.getString("cod_interno")%>"/></td>
        <td style="display: none"><%=rs.getString("local")%></td>       
    <%}
               
                 } catch (Exception e) 
            {
            }
               %>   
        </tr> 
                </tbody>  
                     </table>
                </div> 
            </div> 
          </div> 
  
