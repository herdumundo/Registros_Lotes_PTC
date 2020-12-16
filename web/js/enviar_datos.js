  var ruta_contenedores="./contenedores/";
  var ruta_controles="./controles/";
  var ruta_grillas="./grillas/";
  var ruta_consultas="./consultas/";
    function ocultar_div_fecha(disposicion) {
    
     $('#div_calendario').val("");
     $('#calendario_registro').val("");
    
    if (disposicion=="7"||disposicion=="6"){
        $('#div_calendario').show();
    }
        else {
            $('#div_calendario').hide();
     }
 }

    function enviar_datos_lotes(tipo_registro)
    {
        var url = ruta_controles+tipo_registro+".jsp";                                      
        $.ajax({                        
           type: "POST",                 
           url: url,                    
           data: $("#formulario").serialize(),
           success: function(data)            
           {
            if(tipo_registro=="control_registro")
                {
                resultado_aviso_registro(data.tipo_respuesta,data.mensaje,'LIBERADO',data.cajones_cargados);
                }
            
            else if (tipo_registro=="control_registro_costeado") 
                {
                resultado_aviso_registro(data.tipo_respuesta,data.mensaje,'LIBERADO_COSTEADO',data.cajones_cargados);
                } 
            else if (tipo_registro=="control_retenidos") 
                {
                resultado_aviso_registro(data.tipo_respuesta,data.mensaje,'RETENIDO',data.cajones_cargados);
                }
            else 
                {
                resultado_aviso_registro(data.tipo_respuesta,data.mensaje,'RETENIDO_COSTEADO',data.cajones_cargados);
                }
            }
                });
      }
    
    function enviar_datos_retenidos2() 
    {

        $.ajax({
        type: "POST",
        url: ruta_controles+"control_insert_retenidos.jsp",
        data: $("#formulario_retenido").serialize(),
        success: function(data) {
         $('#contenido_retenido').html(data);
                                }
                });
    };
                    
    function enviar_datos_carromesa() {

        $.ajax({
          type: "POST",
          url:  ruta_controles+"control_carro_mesa.jsp",
          data: $("#formulario_carro_mesa").serialize(),
          success: function(data) {
                                     }
        });

       };  
     
    function enviar_datos_carromesa() {

        $.ajax({
          type: "POST",
          url:  ruta_controles+"control_carro_mesa.jsp",
          data: $("#formulario_carro_mesa").serialize(),
          success: function(data) {
         //   $('#contenido_reporte').html(data);
                                    }
        });

       };  
      
    function enviar_datos_correccion() {

        $.ajax({
          type: "POST",
          url:  ruta_controles+"control_correccion.jsp",
          data: $("#formulario_correccion").serialize(),
          success: function(data) {
          $('#mensaje_correccion').html(data);
                                    }
        });

       }; 
  
    function insert(lote,comentario,liberado_por){
              
                $.get( ruta_controles+'control_editar_comentario.jsp',{lote:lote,comentario:comentario,liberado_por:liberado_por},
                function(res){
                    
                     $("#container").html(res);
                   principal_grilla($('#calendario_informe').val(),$('#estado').val());
                });
               
            }
            
    function limpiar_datos(){
                    
                    $('#txt_cod_lote').val('');
                    //$('#cantidad_huevos').val('');
                    $('#fecha_involucrada').val('');
                    
                    
                }
                
    function cargar_grillas(){
                  $.get( ruta_grillas+'grilla_total_liberado_retenido.jsp',{calendario_informe:$('#calendario_informe').val()},
                function(res){
                      $("#grilla_total_carros_cajones").html(res);
                        });
                  $.get( ruta_grillas+'grilla_cabecera_carritos.jsp',{calendario_informe:$('#calendario_informe').val()},
                function(res){
                      $("#grilla_total_carros").html(res);
                        }); 
                $.get( ruta_grillas+'grilla_cajones_disponibles.jsp',{calendario_informe:$('#calendario_informe').val()},
                function(res){
                      $("#grilla_caj_total").html(res);
                 });
                $.get( ruta_grillas+'grilla_visualizacion_lotes.jsp',{calendario_informe:$('#calendario_informe').val(),estado:$('#estado').val()},
                function(res){
                      $("#mi_id").html(res);
                      $('#example').DataTable( {  "scrollX": true } );
                });   $('#divid').show();           
                } 
 