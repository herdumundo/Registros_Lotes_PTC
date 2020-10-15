    function enviar_movimiento(estado,disposicion,estado_liberacion,liberado_por){
         
         var arr = $('[name="checks[]"]:checked').map(function(){return this.value;}).get();
         var valor_grilla= arr.join(',');
            // $('#resultado_seleccionado').val(resultado_seleccionado);
               // var  select=$("#resultado_seleccionado").val();
 
  if( valor_grilla.length==0){
        swal.fire({
            type: 'error',
            title: "ERROR, SELECCIONE LOTE!!!",
            confirmButtonText: "CERRAR"
                    });
                                        }
     
         
         else {
       
    if( estado==="L"){
        if(liberado_por===""){
        swal.fire({   
        type: 'error',
        title: "ERROR, COMPLETE DATOS REQUERIDOS!!!",   
        timer: 2000,   
        showConfirmButton: false
                }
                    ); 
                            }
     else{
   Swal.fire({
            title: 'CONFIRMACION',
            text: "DESEA LIBERAR LOS CARROS SELECCIONADOS?",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'SI, LIBERAR!',
            cancelButtonText: 'NO, CANCELAR!'
            }).then((result) => {
        if (result.value) {
                Swal.fire({
                title: 'PROCESANDO!',
                html: 'ESPERE<strong></strong>...',
                allowOutsideClick: false,
                onBeforeOpen: () =>     {
                Swal.showLoading();
                    timerInterval = setInterval(() => {
                    Swal.getContent().querySelector('strong')
                    .textContent = Swal.getTimerLeft()
                    }, 1000);
                                        } 
                            });  
                insertar_registro(valor_grilla,liberado_por,estado);
                            }
                                });
                            }   
                                        }

      
else if( estado=="R"|| estado=="Z"){
     
                 var motivo_retencion = $('#motivo_retencion option:selected').toArray().map(item => item.text).join();
          if(disposicion=="-" ||motivo_retencion.length==0|| estado_liberacion=="-"){
                            swal.fire({   
                            title: "ERROR, COMPLETE DATOS REQUERIDOS!!!",   
                            text: "",   
                            timer: 2000,   
                            showConfirmButton: false
                                        }); 
                            }
     else{
                Swal.fire({
                title: 'CONFIRMACION',
                text: "DESEA RETENER LOS CARROS SELECCIONADOS?" +disposicion ,
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'SI, RETENER!',
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
                            .textContent = Swal.getTimerLeft();
                    }, 1000);
                                    } 
                            });  
            insertar_registro_retenido(valor_grilla,disposicion,motivo_retencion, estado ,estado_liberacion);           
                            }
        });  
        
                    }    
                        }
             } 
                            }
         
    function insertar_registro_retenido(id_carro,disposicion,motivo_retencion,estado_requerido,estado_liberacion){
        $.get('control_insert_retenidos.jsp',{id_carro:id_carro,disposicion:disposicion,
        estado_requerido:estado_requerido,motivo_retencion:motivo_retencion,estado_liberacion:estado_liberacion},
            function(res){
                resultado_aviso_movimiento_retenido(res.tipo_mensaje,res.mensaje);  
                            });
                        }   
    
    function insertar_registro(id_carro,responsable,estado_requerido) {
        $.get('control_insert_retenidos.jsp',{id_carro:id_carro,responsable:responsable,estado_requerido:estado_requerido},
            function(res)   {
                resultado_aviso_movimiento_retenido(res.tipo_mensaje,res.mensaje);  
                    });
            }
            
    function agregar_motivo_retencion(){
          //alert(motivo_retencion);
       $.ajax({
                type: "POST",
                url: 'control_agregar_motivo_retencion.jsp',
                data:  $("#form_motivo_retencion").serialize(),
                beforeSend: function() {
                   $('#div_cargar').show();
                    $('#btn_motivo').hide()                     },           
                success: function (res) 
                {  
                    var id= $('#cod_interno').val();

                   $('#'+id).remove();
                                   $('.modal').click();

                $('#div_cargar').hide();
               
                resultado_motivo_retencion(res.tipo_respuesta,res.mensaje);  
                $('#btn_cancelar').show();
 
                } 
                        });
      }    
      
    function reemplazar_motivo_retencion(){
          //alert(motivo_retencion);
       $.ajax({
                type: "POST",
                url: 'control_reemplazar_motivo_retencion.jsp',
                data:  $("#form_motivo_retencion").serialize(),
                beforeSend: function() {
                   $('#div_cargar').show();
                    $('#btn_motivo').hide()                     },           
                success: function (res) 
                {  
                     
                $('#div_cargar').hide();
                $('.modal').click();
                resultado_motivos_panel(res.tipo_respuesta,res.mensaje);  
                $('#btn_cancelar').show();
 
                } 
                        });
      }    
      
    function reemplazar_estado_producto(){
         
       $.ajax({
                type: "POST",
                url: 'control_reemplazar_estado_producto.jsp',
                data:  $("#form_estado_producto").serialize(),
                beforeSend: function() {
                   $('#div_cargar_estado').show();
                   $('#btn_producto').hide();
                      },           
                success: function (res) 
                {
                
                $('.modal').click();
                $('#div_cargar_estado').hide();
               
                resultado_motivos_panel(res.tipo_respuesta,res.mensaje);  
                $('#btn_cancelar').show();
 
                } 
                        });
      }  
      
    function reemplazar_disposicion(){
         
       $.ajax({
                type: "POST",
                url: 'control_reemplazar_disposicion.jsp',
                data:  $("#form_disposicion").serialize(),
                beforeSend: function() {
                   $('#div_cargar_disposicion').show();
                   $('#btn_disposicion').hide();
                      },           
                success: function (res) 
                {
                
                $('.modal').click();
                $('#div_cargar_disposicion').hide();
               
                resultado_motivos_panel(res.tipo_respuesta,res.mensaje);  
                $('#btn_cancelar_disposicion').show();
 
                } 
                        });
      }  
      
    function agregar_estado_producto(){
          //alert(motivo_retencion);
       $.ajax({
                type: "POST",
                url: 'control_agregar_estado_producto.jsp',
                data:  $("#form_estado_producto").serialize(),
                beforeSend: function() {
                   $('#div_cargar_estado').show();
                   $('#btn_producto').hide();
                      },           
                success: function (res) 
                {
                 var id=     $('#cod_interno_estado').val();
                    
                 $('#'+id).remove();
                $('.modal').click();
                $('#div_cargar_estado').hide();
               
                resultado_motivo_retencion(res.tipo_respuesta,res.mensaje);  
                $('#btn_cancelar').show();
 
                } 
                        });
      }  
      
    function liberar_retenidos(id_carro,responsable,estado_requerido,disposicion,calendario_registro,cod_interno) {
        if (disposicion=="7"||disposicion=="6")
                                    {
                if(calendario_registro==""||responsable=="")
                        {
                swal.fire({
                type: 'error',
                title: 'ERROR, COMPLETAR DATOS',
                confirmButtonText: "CERRAR"
                            });   
                        }
        else    {
                $.ajax({
                type: "POST",
                url: 'control_insert_retenidos.jsp',
                data: ({id_carro:id_carro,responsable:responsable,estado_requerido:estado_requerido,fecha_alimentacion:calendario_registro}),
                beforeSend: function() {
                   $('#div_cargar').show();
                   $('#btn_cancelar').hide();
                     },           
                success: function (res) 
                {
                $('#div_cargar').hide();
                $('.modal').click();
                resultado_liberados(res.tipo_mensaje,res.mensaje);  
                $('#btn_cancelar').show();
                $('#'+cod_interno+'').remove();

                } 
                        });             
                }
                                            }
        else {
                if(responsable==""){
                swal.fire   ({
                type: 'error',
                title: 'ERROR, COMPLETAR DATOS',
                confirmButtonText: "CERRAR"
                            });   
                                    }
                else {
                $.ajax  ({
                type: "POST",
                url: 'control_insert_retenidos.jsp',
                data: ({id_carro:id_carro,responsable:responsable,estado_requerido:estado_requerido,fecha_alimentacion:calendario_registro}),
                beforeSend: function() 
                {
                $('#div_cargar').show();
                $('#btn_cancelar').hide();
                },           
                success: function (res) 
                {
                $('#div_cargar').hide();
                $('.modal').click();
                resultado_liberados(res.tipo_mensaje,res.mensaje);  
                $('#'+cod_interno+'').remove();
                $('#btn_cancelar').show();
                } 
                        });          
                          }
                      }
                }           
    
    function resultado_liberados(tipo,mensaje) {
    if(tipo=="1"){
         swal.fire({
            type: 'success',
            title: mensaje,
            confirmButtonText: "CERRAR"
        });
      //  traer_pendiente_liberacion();  
    }
   else   {
         swal.fire({
            type: 'error',
            title: mensaje,
            confirmButtonText: "CERRAR"
        });
    }
  }   
     
    function resultado_motivos_panel(tipo,mensaje) {
    if(tipo==1){
         
         swal.fire({
            type: 'success',
            title: mensaje,
            confirmButtonText: "CERRAR"
        });
        ir_grilla_retenidos_panel();  
             
    }
   else   {
         swal.fire({
            type: 'error',
            html: mensaje,
            confirmButtonText: "CERRAR"
        });
    }
  } 
        
    function resultado_motivo_retencion(tipo,mensaje)  {
    if(tipo==1){
         
         swal.fire({
            type: 'success',
            title: mensaje,
            confirmButtonText: "CERRAR"
        });
       // ir_agregar_motivo_retencion();  
             
    }
   else   {
         swal.fire({
            type: 'error',
            html: mensaje,
            confirmButtonText: "CERRAR"
        });
    }
  } 
      
    function resultado_aviso_movimiento_retenido(tipo,mensaje) {
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
        
    function resultado_aviso_registro(tipo_respuesta,mensaje,tipo_registro,cajones_cargados) {
 
    if(tipo_respuesta==1){
         swal.fire({
            type: 'success',
            title: mensaje,
            confirmButtonText: "CERRAR"
        });
        if (tipo_registro=="LIBERADO") {
            traer_registro();    
        }
        else if(tipo_registro=="RETENIDO") {
            traer_registro_retenido();
        }
        else {
            
             ir_panel(); 
        }
      
                           }
    else  if(tipo_respuesta==57){
       
        swal.fire({
            type: 'error',
            title: "No es posible generar registro. La fecha de clasificacion ya ha sido costeada",
            confirmButtonText: "CERRAR"
        });
                                }  
    else  if(tipo_respuesta==58)
        {
         swal.fire({
            type: 'error',
            title: "ERROR, LA FECHA DE PUESTA ES MAYOR A LA FECHA DE CLASIFICACION",
            confirmButtonText: "CERRAR"
        });
        }  
        
    else  if(tipo_respuesta==30){
       
        swal.fire({
            type: 'error',
            title: "Numero de carrito duplicado para la fecha de puesta ",
            confirmButtonText: "CERRAR"
        });
            }
   
    else  if(tipo_respuesta==40)
                {
         swal.fire({
            type: 'error',
            title: "Fecha de clasificacion incorrecta. Favor verifique",
            confirmButtonText: "CERRAR"
                    });
                }
   
    else  if(tipo_respuesta==0)
            {
         swal.fire({
            type: 'error',
            title: mensaje,
            confirmButtonText: "CERRAR"
                    });
                }
    else  if(tipo_respuesta==2){
       
        swal.fire({
            type: 'error',
             html: mensaje + cajones_cargados,
            confirmButtonText: "CERRAR"
            
        });
                       }
        
 }
 
 
 
   