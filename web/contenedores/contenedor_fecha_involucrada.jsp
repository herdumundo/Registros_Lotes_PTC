 <%@ page language="java" import="java.sql.*" errorPage="error.jsp" %>
 <%@include  file="../chequearsesion.jsp" %>
<%    String usuario = (String) sesionOk.getAttribute("usuario");
String clasificadora = (String) sesionOk.getAttribute("clasificadora");
String user_name = (String) sesionOk.getAttribute("nombre_usuario");

%>
<%@ page language="java" import="java.sql.*" errorPage="error.jsp" %>
 <jsp:useBean id="conexion" class="clases.bdconexion1" scope="page" />
 <jsp:useBean id="fuente" class="clases.fuentedato" scope="page"/>
 
  
      
 
     <div class="container-fluid">
        
   
          
       
     <div class="input-append">  
         <label for="calendario_correccion"><b>FECHA DE PUESTA</b></label>
         <input id="calendario_correccion"  class="datepicker" type="text"  width="276" />
  </div>  
          <button   class=" form-control btn btn-primary " onclick="traer_detalle_fecha_involucrada($('#calendario_correccion').val());filtro_eliminar(); visible_div_eliminar()">BUSCAR</button> 
    <br>
        <div id="div_id_involucrada"   class="input-append">
            
         
        </div>      
        </div>
        
        
        
 <form id="formulario_correccion" action="control_correccion.jsp" method="POST" >  
         <input    id="txt_cod_lote" name="txt_cod_lote" style="display: none" type="text" >

       <div class="modal fade" id="cuadro1" tabindex="1" role="dialog">
                    <div class="modal-dialog" role="document">
                       <div class="modal-content">
                            <div class="modal-footer">
                                <h5 class="modal-title" id="exampleModalLabel"></h5>
                                <div class="form-control-range text-center">
                                   CORRECIONES   
                                
                                </div> <br> 
                            </div>
                <div class="modal-footer">
                <h5 class="modal-title" id="exampleModalLabel"></h5>
                <div class="form-control-range text-center">
<label for="fecha_involucrada">FECHA INVOLUCRADA:</label>
<input type="date" id="fecha_involucrada" name="fecha_involucrada">                </div> 
            
                </div>
   
                <div class="modal-footer">
                <h5 class="modal-title" id="exampleModalLabel"></h5>
                <div class="form-control-range text-center">
                
                    <input type="number" id="cantidad_huevos" name="cantidad_huevos"  style="display: none" value="0"> 
                    
                </div>  </div>  
        
                <div class="modal-footer">
                <h5 class="modal-title" id="exampleModalLabel"></h5>
                <div class="form-control-range text-center">
                    <input type="submit" class="btn btn-primary " id="btn_insertar_correccion" 
                           onclick="validacion_involucrada();" value="REGISTRAR" name="btn_insertar_correccion" data-dismiss="modal" > 
                   
                </div>  </div>   
                </div>
                </div> </div>     </form>
 
 <div id="mensaje_correccion"> </div>
 