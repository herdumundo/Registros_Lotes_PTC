   <!DOCTYPE html>
 <%@ page session="true" %>
<%@include  file="../chequearsesion.jsp" %>
<%    String usuario       = (String) sesionOk.getAttribute("usuario");
      String clasificadora = (String) sesionOk.getAttribute("clasificadora");
      sesionOk.setAttribute("area",clasificadora);
      String user_name = (String) sesionOk.getAttribute("nombre_usuario");
%>
 
    
    
      
              <div class="form-group">
            <div class="input-group">
           
                <input id="calendario_informe"   class="datepicker" type="text"   width="276"    />
           
                 
            <span class="input-group-addon">-</span>
            <div class="input-append">  
        <select class="form-control" name="estado" id="estado"  >
            <OPTION selected value=""  >Estado liberacion</OPTION>
               
        <OPTION VALUE="L">Liberado</OPTION> 
        <OPTION VALUE="R">Retenido</OPTION> 
             
           
            </select>             </div>
          
            <span class="input-group-addon">-</span>
   
           
            </select>   <span class="input-group-addon">-</span>
            
            <!--<input type="button" value="BUSCAR" onclick="grilla_cantidad_liberacion($('#calendario_informe').val()); principal_grilla($('#calendario_informe').val(),$('#estado').val(),$('#tipo_huevo').val());grilla_cajones();grilla_carritos();filtro()" class="form-control btn-primary">
            !-->
            
            <input type="button" value="BUSCAR" onclick=" cargar_grillas();" class="form-control btn-primary">
             </div>
            </div>
          
            <div style="background-color:#ffff66;"  >
                <b>CANTIDAD DE LIBERADOS Y RETENIDOS</b>
            </div>
   
            <table style="background-color:#ffff99;" class="table" id="grilla_total_carros_cajones" data-row-style="rowStyle" data-toggle="table" data-click-to-select="true">
              
            </table>  
               
            <div style="background-color:#ffff66;"  >
              <b>EN CARRITOS</b>
            </div>
   
            <table style="background-color:#ffff99;"  class="table " id="grilla_total_carros" data-row-style="rowStyle" data-toggle="table" data-click-to-select="true">
            
            </table>   
               
            <div  style="background-color:#66ff66;" class="input-append">
              <b>EN CAJONES</b>
            </div>
   
            <table  style="background-color:#99ff99;" class="table" id="grilla_caj_total"   data-row-style="rowStyle" data-toggle="table" data-click-to-select="true">
              
            </table>    
      <br>   
              
    <div id="mi_id">

    </div>

      <form id="formulario_editar" method="post"> 
       <div class="modal fade" id="modal_obs" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">AGREGAR COMENTARIO</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">�</span>
            </button>
          </div>
          <div class="modal-body">
              <input type="text"  id="id_lote" style="display: none" >
              <a>MODIFICAR COMENTARIO</a>
              <input type="text" placeholder="INGRESAR COMENTARIO" id="txt_comentario"> <br>
                        <a>MODIFICAR LIBERADO POR</a>

           <input type="text" placeholder="LIBERADO POR" id="txt_liberado">
          </div>
          <br><br><br>
          <div class="modal-footer">
              <button class="btn btn-primary" type="button"  onclick="insert($('#id_lote').val(),$('#txt_comentario').val(),$('#txt_liberado').val())" data-dismiss="modal" >Registrar </button>
             <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>

          </div>
        </div>
      </div>
    </div></form>