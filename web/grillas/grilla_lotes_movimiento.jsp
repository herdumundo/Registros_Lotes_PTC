<%@page import="javax.swing.JOptionPane"%>
<%@ page language="java" import="java.sql.*" errorPage="error.jsp" %>
<jsp:useBean id="conexion" class="clases.bdconexion1" scope="page" />
<jsp:useBean id="fuente" class="clases.fuentedato" scope="page"/>
<%@include  file="../chequearsesion.jsp" %>


<script> 
    
    $("#buscar_retenido").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#tabla_retenido tr").filter(function() {
    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                                               }); });
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
                  Estado liberacion
                </th>
                 <th style="font-weight: bold;">
                  Estado registro
                </th> 
                <th style="font-weight: bold;">
                  Disposicion
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
        String calendario=request.getParameter("fecha_retenido");
        String tipo_consulta    = request.getParameter("tipo");
        String clasificadora    = (String) sesionOk.getAttribute("clasificadora");
        String clasificadora_cch    = (String) sesionOk.getAttribute("area_cch");
          fuente.setConexion(cn); 
        try {
            ResultSet rs = fuente.obtenerDato(" exec [select_movimientos_ptc] @clasificadora='"+clasificadora+"',@fecha='"+calendario+"',@hora_inicio='"+hora_desde+"',@hora_fin='"+hora_fin+"',@tipo_estado='"+combo_estado+"',@tipo_consulta='"+tipo_consulta+"',@clasificadora_cch='"+clasificadora_cch+"'");


                while(rs.next()){
            %>
            <tr style="font-weight: bold;">  
                <td class="chk"  ><%=rs.getString("cod_lote")%></td> 
                <td><%=rs.getString("cod_carrito")%></td>
                <td><%=rs.getString("tipo_huevo")%></td> 
                <td><%=rs.getString("estado_liberacion")%></td> 
                <td><%=rs.getString("tipo")%></td> 
                <td><%=rs.getString("disposicion")%></td> 
                <td><input name="checks[]" class="checkbox" type='checkbox' value="<%=rs.getString("cod_lote")+"-"+rs.getString("cod_interno")+"-"+rs.getString("tipo")+"-"+rs.getString("disposicion")%>"/></td>
            <td style="display: none"><%=rs.getString("estado_liberacion")%></td>       
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