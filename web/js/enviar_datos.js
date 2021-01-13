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
            
            
              function principal_grilla(calendario_informe,estado){
      
              
              }
                
                function limpiar_datos(){
                    
                    $('#txt_cod_lote').val('');
                    //$('#cantidad_huevos').val('');
                    $('#fecha_involucrada').val('');
                    
                    
                }
                
                
                
        
  
         
   
   function buscar_lotes_visualizacion(){
       var fecha=$("#calendario_informe").val();
       
        $.get( ruta_grillas+'grilla_total_liberados_retenidos.jsp',{calendario_informe:fecha},
                function(res){
                      $("#contenido_tabla_rl").html(res);
                    });
                    
        $.get( ruta_grillas+'grilla_cajones_disponibles.jsp',{calendario_informe:fecha},
                function(res){
                      $("#tabla_cajones").html(res);
                    });
                
         $.get( ruta_grillas+'grilla_cabecera_carritos.jsp',{calendario_informe:fecha},
                function(res){
                      $("#tabla_carritos").html(res);
                    });
                    
           $.get( ruta_grillas+'grilla_normal.jsp',{calendario_informe:fecha,estado:$('#estado').val()},
                function(res){
                $("#div_tabla_general").html(res);
                $('#example').DataTable( { "scrollX": true } );
                });
        }