
 <%@ page language="java" import="java.sql.*" errorPage="error.jsp" %>
<jsp:useBean id="conexion" class="clases.bdconexion1" scope="page" />
<jsp:useBean id="fuente" class="clases.fuentedato" scope="page"/>
<%@include  file="chequearsesion.jsp" %>
 
<%
  
// Crear objeto de conexion al DB
 		Connection cn = conexion.crearConexion();
	// Asignar conexion al objeto manejador de datos
	fuente.setConexion(cn);
         String area = (String) sesionOk.getAttribute("clasificadora");
 
String SQL="select convert(varchar,a.fecha,103) as fecha,convert(varchar,a.fecha_puesta,103) as  fecha_puesta,"
        + "a.cod_Carrito,a.cantidad,a.tipo_huevo,right(a.estado_liberacion,1) as estado  ,c.descripcion , a.cod_lote,a.cod_interno ,b.disposicion    "
        + "from lotes a 	   inner join lotes_retenidos b on a.cod_interno=b.id_lote	   "
        + "inner join motivo_retencion c on b.disposicion=c.id  where right(a.estado_liberacion,1) in ('R','Z') 	  and "
        + "a.estado='a' and a.clasificadora_actual='"+area+"' and b.movimiento ='a' order by fecha";
 
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
      
      
         ResultSet rs = fuente.obtenerDato(SQL);
       
     while(rs.next()){
         
            String estado= rs.getString(6);
            String estado_liberacion="";
            if(estado.endsWith("Z")){
            
            estado_liberacion="R.";
                                }
            else  if(estado.endsWith("R")){
            
            estado_liberacion="R";
                                } 
            else  if(estado.endsWith("L")){
            
            estado_liberacion="L";
                                } 

         
 %>
 <tr id="<%=rs.getString("cod_interno")%>">  
        
                            <td><b><%=rs.getString(1)%></b>    </td>
                            <td><b><%=rs.getString(2)%>    </b></td>
                            <td><b><%=rs.getString(3)%>    </b></td>
                            <td><b><%=rs.getString(4)%>    </b></td>
                            <td><b><%=rs.getString(5)%>    </b></td>
                            <td><b><%=estado_liberacion%>    </b></td>
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
   