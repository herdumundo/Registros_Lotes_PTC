         function detalle_reproceso(calendario,combo_disposicion){
        $.get('grilla_reproceso.jsp',{calendario:calendario,combo_disposicion:combo_disposicion},function(res){
        $("#contenedor_grilla_reproceso").html(res);
        $("#box_reproceso").on('click',function(){
        chequear_reproceso();
                                                    });
                                                                            });
                          gatillar_diposicion_cambio();                                          

                                                }
                                                
                                                
  //Esta es la función que una vez se cargue el documento será gatillada.
    function gatillar_diposicion_cambio (){
        $("#disposicion_insert").val($("#disposicion").val());
    }  
             function chequear_reproceso(){
            var checked = $("#box_reproceso").prop('checked');
            $('#contenedor_grilla_reproceso').find('input:checkbox').prop('checked', checked);
                                            }
            function setear_check()    {     
            var arr = $('[name="checks[]"]:checked').map(function(){
            return this.value;
            }).get();
            var resultado_seleccionado = arr.join(',');
            $('#caja_check').val(resultado_seleccionado);
                                        }    
                    
        
        
        function enviar_datos_insert (){
            
          setear_check();
                var fecha_alimentacion= $("#calendario_alimentacion").val();
                var liberado_por= $("#txt_lib").val();
                var fecha_clasificacion= $("#calendario_reproceso").val();
                var  disposicion_insert=$("#disposicion_insert").val();
                var combo_disposicion=$("#disposicion").val();
                var resultado=$("#caja_check").val();  
                
                  
                
                if(disposicion_insert==="8"&&combo_disposicion==="8"||disposicion_insert==="9"&&combo_disposicion==="9"
             ||disposicion_insert==="27"&&combo_disposicion==="27"||disposicion_insert==="30"&&combo_disposicion==="30"){
                    
                   aviso_duplicado_disposicion(); 
                    
                }
                else {
                  
             if(disposicion_insert==="6" &&combo_disposicion==="6"||disposicion_insert==="7"&&combo_disposicion==="7"){
                 
             if(resultado==="")   {
                aviso("ERROR, SELECCIONAR LOTE");
                                                                                     }
                                                                                     
                     if(liberado_por==="")   {
                aviso("ERROR, COMPLETAR DATOS");
                                                                                     }
             else if(fecha_alimentacion==="")   {
                aviso("ERROR, INGRESAR FECHA DE ALIMENTACION");
                                                                                     }
             else if(fecha_clasificacion==="")   {
                aviso("ERROR, INGRESAR FECHA DE CLASIFICACION");
                                                                                     }
                else {
                    
  Swal.fire({
           title: 'CONFIRMACION',
           text: "DESEA APLICAR LOS CAMBIOS A LOS LOTES SELECCIONADOS?",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
           confirmButtonText: 'SI!',
           cancelButtonText: 'NO, CANCELAR!'
    }).then((result) => {
        if (result.value) {
 Swal.fire({
                title: 'PROCESANDO!',
                html: 'ESPERE<strong></strong>...',
                allowOutsideClick: false,
                onBeforeOpen: () => {
                    Swal.showLoading()
                    timerInterval = setInterval(() => {
                        Swal.getContent().querySelector('strong')
                            .textContent = Swal.getTimerLeft()
                    }, 1000)
                } 
            });  
 
              enviar_datos_reproceso(); 
          
                            }
        });                          
                    }
                              }
                              
           // else   if(disposicion_insert==="8"||disposicion_insert==="9"||disposicion_insert==="27"||disposicion_insert==="30"){
            else {
                   
               if(resultado===""  )   {
                aviso("ERROR, SELECCIONAR LOTE");
                                                                                     }
           else if( fecha_clasificacion==="")   {
                aviso("ERROR, INGRESAR FECHA DE CLASIFICACION");
               }
                else {
                       Swal.fire({
           title: 'CONFIRMACION',
           text: "DESEA APLICAR LOS CAMBIOS A LOS LOTES SELECCIONADOS?",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
           confirmButtonText: 'SI!',
           cancelButtonText: 'NO, CANCELAR!'
    }).then((result) => {
        if (result.value) {
 Swal.fire({
                title: 'PROCESANDO!',
                html: 'ESPERE<strong></strong>...',
                allowOutsideClick: false,
                onBeforeOpen: () => {
                    Swal.showLoading()
                    timerInterval = setInterval(() => {
                        Swal.getContent().querySelector('strong')
                            .textContent = Swal.getTimerLeft()
                    }, 1000)
                } 
            });  
 
              enviar_datos_reproceso(); 
          
                            }
        });

                    }
                      }          
                     } 
                     }    
                            
                            
 function enviar_datos_reproceso() 
        {
        $.ajax({
        type: "POST",
        url: "control_reproceso.jsp",
        data: $("#formulario_reproceso").serialize(),
        success: function(data) {
        // $('#contenedor_grilla_reproceso').html(data);
       
            aviso_registrado_dispo(data.tipo_mensaje,data.mensaje);
        
        }
                });
 
                                              };     
                                        
            function aviso(mensaje){
                                            
                             
              swal.fire({   
                type:"error",
		title: mensaje,   
		text: "",   
		showConfirmButton: true
          
                    }
                        ); 
            
            $.preloader.stop();
            }
            
                                       
            function aviso_duplicado_disposicion(){
                                            
                             
              swal.fire({ 
                type:"error",
		title: "ERROR, DEBE CAMBIAR A OTRO TIPO DE DISPOSICION",   
		text: "",   
		   
               
		showConfirmButton: true
          
                    }
                        ); 
            
            $.preloader.stop();
            }
        function aviso2(){
                                            
                             
              swal.fire({   
		title: "CORRECTO",   
		text: "",   
		timer: 2000,   
               
		showConfirmButton: false
          
                    }
                        ); 
                      }
                      
             function aviso_registrado_dispo(tipo,mensaje){
    if(tipo=="1"){
         swal.fire({
            type: 'success',
            title: mensaje,
            confirmButtonText: "CERRAR"
        });
        traer_menu();  
    }
   else   {
         swal.fire({
            type: 'error',
            title: mensaje,
            confirmButtonText: "CERRAR"
        });
       }
                      }
            
            
            
            function ver_div(){
                var disposicion=$("#disposicion").val();
                
                if (disposicion==="6"||disposicion==="7"){
              $("#calendario_alimentacion").val('');
                $("#div_fecha_ali").show();
                $("#div_registro").show();
             $("#div_disposicion").show();
         }
            
         if (disposicion==="8"||disposicion==="9"|| disposicion==="30"){
             $("#calendario_alimentacion").val('');
                $("#div_fecha_ali").hide();
                $("#div_registro").show();
                $("#div_disposicion").show();
                }
                                }  
                                
         
         function funcion_disposicion(){
                var disposicion_insert=$("#disposicion_insert").val();
                var disposicion=$("#disposicion").val();
                
                if (disposicion_insert==="7"&&disposicion==="7"||disposicion_insert==="6"&&disposicion==="6"){
               
                $("#div_fecha_ali").show();
                $("#div_registro").show();
                $("#div_disposicion").show();
                $("#txt_lib").show();
         } 
           /*  else if (disposicion_insert==="30"&&disposicion==="7"||disposicion_insert==="30"&&disposicion==="6"){

                $("#div_fecha_ali").show();
                $("#div_registro").show();
                $("#div_disposicion").show();
                $("#txt_nro_mesa").hide();
                $("#txt_lib").hide();


                
         } */
            else 
                {
                    $("#div_fecha_ali").hide();
                    $("#div_registro").show();
                    $("#div_disposicion").show();
                    $("#txt_lib").hide();
                }
             }
            
                function accion_combo(){
                var disposicion=$("#disposicion").val();
                
                if (disposicion==="6"||disposicion==="7"){
              $("#calendario_alimentacion").val('');
                $("#div_fecha_ali").show();
                $("#div_registro").show();
             $("#div_disposicion").show();
         }
            
          if (disposicion==="8"||disposicion==="9"|| disposicion==="30" ||disposicion==="27"){
             $("#calendario_alimentacion").val('');
                $("#div_fecha_ali").hide();
                $("#div_registro").show();
                $("#div_disposicion").show();
                }
                        
                
                
            detalle_reproceso($('#calendario_reproceso').val(),$('#disposicion').val())
            }  
                          
            