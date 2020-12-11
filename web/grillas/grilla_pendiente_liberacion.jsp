
 <%@ page language="java" import="java.sql.*" errorPage="error.jsp" %>
<jsp:useBean id="conexion" class="clases.bdconexion1" scope="page" />
<jsp:useBean id="fuente" class="clases.fuentedato" scope="page"/>
<%@include  file="../chequearsesion.jsp" %>
 
<%
 Connection cn = conexion.crearConexion();
    fuente.setConexion(cn);
    String area = (String) sesionOk.getAttribute("clasificadora");
    %>
   
   <table id="grilla_lotes_liberacion" class="table table-striped table-bordered" style="width:100%">
                     <thead>
    <tr>
            <th>Fecha clasificacion</th>
            <th>Fecha puesta</th>
            <th>Codigo</th>
            <th>Cantidad</th>
            <th>Tipo huevo </th>
            <th>Estado liberación</th> 
            <th>Disposicion</th> 
            <th>Accion</th> 
     </tr>
    </thead>
        <%
       ResultSet rs = fuente.obtenerDato("exec [select_lotes_pendientes_liberacion] @area='"+area+"'");
       
     while(rs.next()){
   %>
 <tr id="<%=rs.getString("cod_interno")%>">  
        
                            <td><b><%=rs.getString(1)%></b>    </td>
                            <td><b><%=rs.getString(2)%>    </b></td>
                            <td><b><%=rs.getString(3)%>    </b></td>
                            <td><b><%=rs.getString(4)%>    </b></td>
                            <td><b><%=rs.getString(5)%>    </b></td>
                            <td><b><%=rs.getString(6)%>    </b></td>
                            <td><b><%=rs.getString(7)%>    </b></td>
                            <td><input type="button" value="LIBERAR" class="form-control bg-success" onclick="$('#cod_lote').val('<%=rs.getString("cod_lote")%>');
                                $('#cod_interno').val('<%=rs.getString("cod_interno")%>');
                                $('#disposicion').val('<%=rs.getString("disposicion")%>');ocultar_div_fecha('<%=rs.getString("disposicion")%>');$('#div_header').text('LIBERACION DE LOTE '+'<%=rs.getString("cod_carrito")%>'); " data-toggle="modal" data-target="#modal_liberar"></td>

                                                    </tr>
       <% } %>
     
       
         
        <tbody id="tbody_id"> 
             
                 </tbody>
   
     </table>
       
       
  <div class="modal fade" id="modal_liberar"      tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header" id="div_header">
          LIBERACION DE LOTE 
        </div>
            <div class="modal-body">
        <input type="hidden" id="cod_lote">
        <input type="hidden" id="disposicion">
        <input type="hidden" id="cod_interno">
        <A>INGRESAR RESPONSABLE</A>
        <input type="text" id="txt_responsable" placeholder="RESPONSABLE"> <br>
                <div id="div_calendario" style="display: none">  
        <a>INGRESAR FECHA DE ALIMENTACION</a>
        <input style="font-weight: bold;" id="calendario_registro" name="calendario_registro"  class="datepicker"  />
                </div>
            </div>
    <button class="btn btn-secondary" type="button" onclick="liberar_retenidos($('#cod_lote').val()+'-'+$('#cod_interno').val(),$('#txt_responsable').val(),'L',$('#disposicion').val(),$('#calendario_registro').val(),$('#cod_interno').val())" >LIBERAR</button>
        <div id="div_cargar" class="text-center" style="display: none">
  <div class="spinner-border" role="status">
    <span class="sr-only">Loading...</span>
  </div>
              </div> <br>
              <button class="btn btn-danger" type="button" id="btn_cancelar" data-dismiss="modal">CANCELAR</button>
           
       </div>
    </div>
  </div>
   