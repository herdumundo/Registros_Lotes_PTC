 
     
<form id="formulario_reporte_reproceso" name="formulario_reporte_reproceso" action="control_reporte_mixto_variable.jsp" target="_blank">
 
 <div class="custom-control custom-radio">
  <input type="radio" id="customRadio1" name="customRadio" checked="checked"  class="custom-control-input"    >
  <label class="custom-control-label" for="customRadio1">FILTRO POR FECHA DE CLASIFICACION</label>
 </div><br> 
 <div class="custom-control custom-radio">
  <input type="radio" id="customRadio2" value="s" name="customRadio" class="custom-control-input">
  <label class="custom-control-label"  for="customRadio2">FILTRO POR FECHA DE PUESTA</label>
 </div>
   <div class="form-check">
       <br>
    <input type="checkbox" class="form-check-input" id="check_numero" onclick="">
    <label class="form-check-label" for="check_numero">FILTRO POR NUMERO</label>
   </div>
    <script>
        $(document).ready(function(){
            $("#check_numero").change(function() {
                if($(this).prop('checked')) 
                {
                    $("#numero").show();
                    $("#filtro_carro").val("1");
                }        
                else    {
                    $("#numero").hide();
                    $("#filtro_carro").val("0");
                        }
                                });
                $('#combo').hide();
                $("#filtro_carro").val("0");
                $("#filtro_calendario").val("1");//CLASIFICACION
                $("#customRadio2").on( "click", function() {
                $("#filtro_calendario").val("0");//PUESTA
                                            });
                $("#customRadio1").on( "click", function() {
                $("#filtro_calendario").val("1");//CLASIFICACION		 
                                                            }); 
                                         });
 
    </script>	
    <input type="hidden"  id="filtro_calendario" name="filtro_calendario"  >
        <input type="hidden"  id="filtro_carro" name="filtro_carro"  >
    <div class="input-append">  
        <br><br>
        <a>INGRESAR FECHA DESDE</a>
        <input id="calendario_reporte_carros_mixto"  name="calendario_reporte_carros_mixto" class="datepicker" data-format="dd/mm/yyyy"  width="276" required="required"  />
        <a>INGRESAR FECHA HASTA</a>
        <input id="calendario_reporte_carros_mixto_hasta" name="calendario_reporte_carros_mixto_hasta" class="datepicker" data-format="dd/mm/yyyy"  width="276" required="required"  />
    <br>
    <input type="number"  id="numero" name="numero" placeholder="INGRESAR NUMERO" value="0" class="form-control" style="display: none">

    </div> 
    <br> 
            <select class="form-control" name="cbox_estado" id="cbox_estado" required="true"> 
            <OPTION selected disabled>SELECCIONAR ESTADO DE LIBERACION</OPTION>
            <OPTION   VALUE="L">LIBERADO</OPTION>
            <OPTION   VALUE="R">RETENIDO</OPTION>
            </select>   
            <br> 
            <br> 
             <input style="width:260px; height:80px" class="btn btn-success" type="submit"    value="Generar reporte"> 
    </form>  