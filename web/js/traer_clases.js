  $(document).ready(function(){
     no_volver_atras();
     traer_menu();
 });
    function no_volver_atras(){
 
(function (global) { 

    if(typeof (global) === "undefined") {
        throw new Error("window is undefined");
    }

    var _hash = "!";
    var noBackPlease = function () {
        global.location.href += "#";

        // making sure we have the fruit available for juice (^__^)
        global.setTimeout(function () {
            global.location.href += "!";
        }, 50);
    };

    global.onhashchange = function () {
        if (global.location.hash !== _hash) {
            global.location.hash = _hash;
        }
    };

    global.onload = function () {            
        noBackPlease();

        // disables backspace on page except on input fields and textarea..
        document.body.onkeydown = function (e) {
            var elm = e.target.nodeName.toLowerCase();
            if (e.which === 8 && (elm !== 'input' && elm  !== 'textarea')) {
                e.preventDefault();
            }
            // stopping event bubbling up the DOM tree..
            e.stopPropagation();
        };          
    };

})(window);
}

    function ir_transferencia_menu() {
            $.ajax({
            type: "POST",
            url: 'contenedor_transferencia.jsp',
             beforeSend: function() {
            $('#div_cargar_menu').show();
            $('#contenido_reporte').html('');
            $('#contenido').html('');
            $('#contenido_eliminar').html('');
            $('#contenido_password').html('');
            $('#contenido_visualizar').html('');
            $("#contenido_2").html('');
                                              },           
            success: function (res) {
            $('#div_cargar_menu').hide();
            $("#contenido_2").html(res);
            $("#contenido_2").show();
 
                           }
            
        });  
         
        }      
        
    function ir_transferencia(pagina) {
            $.ajax({
            type: "POST",
            url: pagina+'.jsp',
             beforeSend: function() {
            $('#div_cargar_menu').show();
            $('#contenido_reporte').html('');
            $('#contenido').html('');
            $('#contenido_eliminar').html('');
            $('#contenido_password').html('');
            $('#contenido_visualizar').html('');
            $("#contenido_2").html('');
                                        },           
            success: function (res) {
            $('#div_cargar_menu').hide();
            $("#contenido_2").html(res);
            $("#contenido_2").show();
            $('#grilla_transfer').bootstrapTable({
            "scrollX": true,
            "pageLength": 100
            } ); 
                           }
                        });  
        
         
        }       
        
    function ir_panel(){
            $.ajax({
            type: "POST",
            url: 'contenedor_menu_panel.jsp',
             beforeSend: function() {
            $('#div_cargar_menu').show();
            $("#contenido_2").html('');
            $("#contenido").html('');
            $("#contenido_2").html('');
            $('#contenido_reporte').html('');
            $('#contenido_eliminar').html('');
            $('#contenido_password').html('');
            $('#contenido_visualizar').html('');
                                },           
            success: function (res) {
            $('#div_cargar_menu').hide();
            $('#contenido').html(res);
                        }
                });  
                        }    
                                 
    function ir_liberados_viejo(){
            $.ajax({
            type: "POST",
            url: 'contenedor_registro_liberados_viejos.jsp',
             beforeSend: function() {
            $('#div_cargar_menu').show();
            $('#contenido_reporte').html('');
            $('#contenido').html('');
            $('#contenido_eliminar').html('');
            $('#contenido_password').html('');
            $('#contenido_visualizar').html('');
            $("#contenido_2").html('');
                           },           
            success: function (res) {
            $('#div_cargar_menu').hide();
            $("#contenido_2").html(res);
            $("#contenido_2").show();
            $('#chkToggle2').bootstrapToggle();
            $('#chkToggle_especial').bootstrapToggle();
            cargar_toggles();
            cargar_estilo_calendario_insert();
            inicializar_unidad_medida();
                           }
                });      
      }   

    function ir_agregar_motivo_retencion(){
            $.ajax({
            type: "POST",
            url: 'grilla_motivo_retencion.jsp',
             beforeSend: function() {
            $('#div_cargar_menu').show();
            $('#contenido_reporte').html('');
            $('#contenido').html('');
            $('#contenido_eliminar').html('');
            $('#contenido_password').html('');
            $('#contenido_visualizar').html('');
            $("#contenido_2").html('');
                                    },           
            success: function (res) {
            $('#div_cargar_menu').hide();
            $("#contenido_2").html(res);
            $("#contenido_2").show();
            $('#chkToggle2').bootstrapToggle();
            $('#chkToggle_especial').bootstrapToggle();
            cargar_toggles();
            cargar_estilo_calendario_insert();
            inicializar_unidad_medida();
                $('#grilla_lotes_liberacion').DataTable( {
                    "scrollX": true,
                    "pageLength": 100
                    } );
                           }
                });      
                        }   

    function ir_modificacion_lotes(){
            $.ajax({
            type: "POST",
            url: 'contenedor_reemplazo_motivos.jsp',
             beforeSend: function() {
            $('#div_cargar_menu').show();
            $('#contenido_reporte').html('');
            $('#contenido').html('');
            $('#contenido_eliminar').html('');
            $('#contenido_password').html('');
            $('#contenido_visualizar').html('');
            $("#contenido_2").html('');
                        },           
            success: function (res) {
            $('#div_cargar_menu').hide();
            $("#contenido_2").html(res);
            $("#contenido_2").show();
            ir_grilla_retenidos_panel();
                                }
                });   
          
                                             }
                                             
    function ir_reporte_historico_lotes(){
            $.ajax({
            type: "POST",
            url: 'contenedor_reporte_retenidos_historico.jsp',
             beforeSend: function() {
            $('#div_cargar_menu').show();
            $('#contenido_reporte').html('');
            $('#contenido').html('');
            $('#contenido_eliminar').html('');
            $('#contenido_password').html('');
            $('#contenido_visualizar').html('');
            $("#contenido_2").html('');
                                },           
            success: function (res) {
            $('#div_cargar_menu').hide();
            $("#contenido_2").html(res);
            $("#contenido_2").show();
                        cargar_estilo_calendario();

                                }
                });   
          
                                             }     
                                             
                                             
     function ir_transformacion_pallet_carro(){
            $.ajax({
            type: "POST",
            url: 'contenedor_transformacion_pallet_carro.jsp',
             beforeSend: function() {
            $('#div_cargar_menu').show();
            $('#contenido_reporte').html('');
            $('#contenido').html('');
            $('#contenido_eliminar').html('');
            $('#contenido_password').html('');
            $('#contenido_visualizar').html('');
            $("#contenido_2").html('');
                                },           
            success: function (res) {
            $('#div_cargar_menu').hide();
            $("#contenido_2").html(res);
            $("#contenido_2").show();
                        cargar_estilo_calendario();

                                }
                });   
          
                                             }                                               
                                             
                                             
    function ir_grilla_retenidos_panel(){
            $.ajax({
            type: "POST",
            url: 'grilla_retenidos_panel.jsp',
            beforeSend: function() {
            $('#div_cargar_menu').show();
                                    },           
            success: function (res) {
            $('#div_cargar_menu').hide();
            $('#div_grilla').html(res);
            $('#grilla_lotes_motivos').DataTable( {
            "scrollX": true,
            "pageLength": 100
                        } );
                           }
                });  
     
                }
      
    function traer_registro_retenido_costeado(){
            $.ajax({
            type: "POST",
            url: 'contenedor_registro_retenido_costeados.jsp',
             beforeSend: function() {
            $('#div_cargar_menu').show();
            $('#contenido_reporte').html('');
            $('#contenido').html('');
            $('#contenido_eliminar').html('');
            $('#contenido_password').html('');
            $('#contenido_visualizar').html('');
            $("#contenido_2").html('');
                                        },           
            success: function (res) {
            $('#div_cargar_menu').hide();
            $("#contenido_2").html(res);
            $("#contenido_2").show();
            $('#chkToggle2').bootstrapToggle();
            $('#chkToggle_especial').bootstrapToggle();
            cargar_toggles();
            unidad_medida_registrar_retenido();
            cargar_estilo_calendario_insert();
                           }
                });   
          
                                             }
      
    function ir_reportes_varios() {
            
            $.ajax({
            type: "POST",
            url: 'contenedor_menu_reporte.jsp',
             beforeSend: function() {
            $('#div_cargar_menu').show();
            $("#contenido_2").html('');
            $("#contenido").html('');
            $("#contenido_2").html('');
            $('#contenido_reporte').html('');
            $('#contenido_eliminar').html('');
            $('#contenido_password').html('');
            $('#contenido_visualizar').html('');
                                            },           
            success: function (res) {
            $('#div_cargar_menu').hide();
            $('#contenido').html(res);
          
                           }
                });  
            }  

    function habilitar_boton_registrar() {
	$('#tipo_almacenamiento').change(function(){
        $('#btn_registrar').removeAttr('disabled');
        });}
 
    function traer_menu(){
    var perfil=$('#perfil').val();
      $.ajax({
                type: "POST",
                url: 'contenedor_menu.jsp',
             beforeSend: function() {
            $('#div_cargar_menu').show();
            $('#contenido_reporte').hide();
            $('#contenido_2').hide();
            $('#contenido_eliminar').hide();
            $('#contenido_password').hide();
            $('#contenido_visualizar').hide();  
            $('#contenido_retenido').hide(); 

                       },           
            success: function (res) {
            $('#div_cargar_menu').hide();
            $("#contenido").html(res);
            $('#contenido').show();
            parpadeo();
            if(perfil=="U")
                {
                 $('#div_panel').hide(); 
                }
            else 
                {
              $('#div_panel').show(); 
                } 
                                }
                });  
      
 }
      
    function traer_registro(){
    
       $.ajax({
                type: "POST",
                url: 'contenedor_registro.jsp',
             beforeSend: function() {
            $('#div_cargar_menu').show();
            $('#contenido_reporte').html('');
            $('#contenido').html('');
            $('#contenido_eliminar').html('');
            $('#contenido_password').html('');
            $('#contenido_visualizar').html('');
            $("#contenido_2").html('');

                       },           
            success: function (res) {
            $('#div_cargar_menu').hide();
            $("#contenido_2").html(res);
            $("#contenido_2").show();
            $('#chkToggle2').bootstrapToggle();
            $('#chkToggle_especial').bootstrapToggle();
            cargar_toggles();
            cargar_estilo_calendario_insert();
            inicializar_unidad_medida();
                           }
                });  
                
    
                            }
    
    function cargar_toggles() {

    $('#chkToggle2').change(function () {
        if ($(this).prop("checked") == true) {
            $('#codigo_borroso').val('SI');
         }
        else {
     $('#codigo_borroso').val('NO');

        }
    });
    
     $('#chkToggle_especial').change(function () {
        if ($(this).prop("checked") == true) {
            $('#codigo_especial').val('SI');
         }
        else {
     $('#codigo_especial').val('NO');

        }
    });
}
      
    function traer_registro_retenido(){
            $.ajax({
            type: "POST",
            url: 'contenedor_registro_retenido.jsp',
             beforeSend: function() {
            $('#div_cargar_menu').show();
            $('#contenido_reporte').html('');
            $('#contenido').html('');
            $('#contenido_eliminar').html('');
            $('#contenido_password').html('');
            $('#contenido_visualizar').html('');
            $("#contenido_2").html('');

                       },           
            success: function (res) {
            $('#div_cargar_menu').hide();
            $("#contenido_2").html(res);
            $("#contenido_2").show();
            $('#chkToggle2').bootstrapToggle();
            $('#chkToggle_especial').bootstrapToggle();
            cargar_toggles();
            unidad_medida_registrar_retenido();
            cargar_estilo_calendario_insert();
                           }
                });   
                                             }
      
    function traer_retenido(){
            $.ajax({
            type: "POST",
            url: 'contenedor_retenidos.jsp',
             beforeSend: function() {
            $('#div_cargar_menu').show();
            $('#contenido_reporte').html('');
            $('#contenido').html('');
            $('#contenido_eliminar').html('');
            $('#contenido_password').html('');
            $('#contenido_visualizar').html('');
            $("#contenido_2").html('');

                       },           
            success: function (res) {
            $('#div_cargar_menu').hide();
            $("#contenido_2").html(res);
            $("#contenido_2").show();
            cargar_estilo_calendario();
            filtrar_grilla_retenido();
                           }
                });  
                }
                
    function traer_retenido_fecha_puesta(){
            $.ajax({
            type: "POST",
            url: 'contenedor_retenidos_puesta.jsp',
             beforeSend: function() {
            $('#div_cargar_menu').show();
            $('#contenido_reporte').html('');
            $('#contenido').html('');
            $('#contenido_eliminar').html('');
            $('#contenido_password').html('');
            $('#contenido_visualizar').html('');
            $("#contenido_2").html('');

                       },           
            success: function (res) {
            $('#div_cargar_menu').hide();
            $("#contenido_2").html(res);
            $("#contenido_2").show();
            filtrar_grilla_retenido();
            cargar_estilo_calendario();
                           }
            
        }); 
             
      }
      
    function traer_fecha_involucrada(){
           
             $.get('contenedor_fecha_involucrada.jsp',function(res)
                {
             $("#contenido_eliminar").html('');
             $("#contenido_eliminar").html(res);
             $('#contenido_eliminar').show();
             $('#contenido').hide();
             $('#contenido_2').hide();
             $('#contenido_password').hide();
             $('#contenido_reporte').hide();
             $('#contenido_visualizar').hide();
             $('#contenido_retenido').hide(); 
              cargar_estilo_calendario();
        
            
            
                });
                                    }
    
    function traer_eliminar(){
               $.ajax({
                type: "POST",
                url: 'contenedor_eliminar.jsp',
             beforeSend: function() {
            $('#div_cargar_menu').show();
          $('#contenido_reporte').html('');
          $('#contenido').html('');
          $('#contenido_eliminar').html('');
          $('#contenido_password').html('');
          $('#contenido_visualizar').html('');
            $("#contenido_2").html('');

                       },           
            success: function (res) {
            $('#div_cargar_menu').hide();
            $("#contenido_2").html(res);
            $("#contenido_2").show();
            elminar_fila();
            cargar_estilo_calendario();  
                           }
            
        }); 
             
                                    }
      
    function traer_informe(){
               $.ajax({
                type: "POST",
                url: 'contenedor_informe.jsp',
             beforeSend: function() {
            $('#div_cargar_menu').show();
          $('#contenido_reporte').html('');
          $('#contenido').html('');
          $('#contenido_eliminar').html('');
          $('#contenido_password').html('');
          $('#contenido_visualizar').html('');
            $("#contenido_2").html('');

                       },           
            success: function (res) {
            $('#div_cargar_menu').hide();
            $("#contenido_2").html(res);
            $("#contenido_2").show();
            cargar_estilo_calendario();

                           }
            
        }); }
      
    function traer_insert(){
           
          $.get('lotes_control.jsp',function(res){
                    $("#contenido_2").html(res);
          });
           $('#contenido').hide();
            $('#contenido_2').show();
          
      }
      
    function traer_control(){
           $.get('control_registro.jsp',function(res){
                    $("#contenido_2").html(res);
                                         });
                     $('#contenido_2').show();
                    $('#contenido').hide();  
      }
      
    function traer_contendor_cambiar_pass_jsp(){
                $.ajax({
                type: "POST",
                url: 'contenedor_password.jsp',
             beforeSend: function() {
            $('#div_cargar_menu').show();
          $('#contenido_reporte').html('');
          $('#contenido').html('');
          $('#contenido_eliminar').html('');
          $('#contenido_password').html('');
          $('#contenido_visualizar').html('');
            $("#contenido_2").html('');

                       },           
            success: function (res) {
            $('#div_cargar_menu').hide();
            $("#contenido_2").html(res);
            $("#contenido_2").show();
                           }
            
        });
             }
       
    function traer_contendor_pdf_jsp(){
                  
                     $.ajax({
                type: "POST",
                url: 'contenedor_pdf.jsp',
             beforeSend: function() {
            $('#div_cargar_menu').show();
          $('#contenido_reporte').html('');
          $('#contenido').html('');
          $('#contenido_eliminar').html('');
          $('#contenido_password').html('');
          $('#contenido_visualizar').html('');
            $("#contenido_2").html('');

                       },           
            success: function (res) {
            $('#div_cargar_menu').hide();
            $("#contenido_2").html(res);
            $("#contenido_2").show();
            $("#calendario").datepicker();
                          }
            
        });
                 }
                                     
    function traer_carro_mesa(){
                     
            $.ajax({
                type: "POST",
                url: 'contenedor_carro_mesa.jsp',
             beforeSend: function() {
            $('#div_cargar_menu').show();
            $('#contenido_reporte').html('');
            $('#contenido').html('');
            $('#contenido_eliminar').html('');
            $('#contenido_password').html('');
            $('#contenido_visualizar').html('');
            $("#contenido_2").html('');

                       },           
            success: function (res) {
            $('#div_cargar_menu').hide();
            $("#contenido_2").html(res);
            $("#contenido_2").show();
            $("#calendario_mesa").datepicker();
            filtrar_grilla_carromesa();     
            elminar_fila();                }
            
        });       }                 
                 
    function traer_contendor_pdf_reproceso(){
            $.ajax({
                type: "POST",
                url: 'contenedor_pdf_reproceso.jsp',
             beforeSend: function() {
            $('#div_cargar_menu').show();
            $('#contenido_reporte').html('');
            $('#contenido').html('');
            $('#contenido_eliminar').html('');
            $('#contenido_password').html('');
            $('#contenido_visualizar').html('');
            $("#contenido_2").html('');
                                    },           
            success: function (res) {
            $('#div_cargar_menu').hide();
            $("#contenido_2").html(res);
            $("#contenido_2").show();
            $('#calendario_reporte_reproceso').datepicker();
                }
            
        });  
                }  
                                     
    function traer_grilla_retenido(){
           
            $.ajax({
                type: "POST",
                url: 'contenedor_grilla_reproceso.jsp',
             beforeSend: function() {
            $('#div_cargar_menu').show();
            $('#contenido_reporte').html('');
            $('#contenido').html('');
            $('#contenido_eliminar').html('');
            $('#contenido_password').html('');
            $('#contenido_visualizar').html('');
            $("#contenido_2").html('');

                       },           
            success: function (res) {
            $('#div_cargar_menu').hide();
            $("#contenido_2").html(res);
            $("#contenido_2").show();
            cargar_estilo_calendario(); 
             }
            
        }); 
          }             
    
    function traer_reporte_lotes() {
             $.ajax({
                type: "POST",
                url: 'contenedor_reporte_carros.jsp',
             beforeSend: function() {
            $('#div_cargar_menu').show();
          $('#contenido_reporte').html('');
          $('#contenido').html('');
          $('#contenido_eliminar').html('');
          $('#contenido_password').html('');
          $('#contenido_visualizar').html('');
            $("#contenido_2").html('');

                       },           
            success: function (res) {
            $('#div_cargar_menu').hide();
          $("#contenido_2").html(res);
          $("#contenido_2").show();
            cargar_estilo_calendario(); 
             }
            
        }); 
        
         
        }                    
                                     
    function traer_reporte_mixtos_historial() {
 
            $.ajax({
                type: "POST",
                url: 'contenedor_reporte_mixtos_variable.jsp',
             beforeSend: function() {
            $('#div_cargar_menu').show();
            $('#contenido_reporte').html('');
            $('#contenido').html('');
            $('#contenido_eliminar').html('');
            $('#contenido_password').html('');
            $('#contenido_visualizar').html('');
            $("#contenido_2").html('');
                                        },           
            success: function (res) {
            $('#div_cargar_menu').hide();
            $("#contenido_2").html(res);
            $("#contenido_2").show();
              cargar_estilo_calendario(); 
             }
            }); 
             }  

    function traer_reporte_mixtos() {
 
            $.ajax({
                type: "POST",
                url: 'contenedor_reporte_carros_mixtos.jsp',
             beforeSend: function() {
            $('#div_cargar_menu').show();
            $('#contenido_reporte').html('');
            $('#contenido').html('');
            $('#contenido_eliminar').html('');
            $('#contenido_password').html('');
            $('#contenido_visualizar').html('');
            $("#contenido_2").html('');
                       },           
            success: function (res) {
            $('#div_cargar_menu').hide();
            $("#contenido_2").html(res);
            $("#contenido_2").show();
            cargar_estilo_calendario(); 
             }
            
        }); 
             }       

    function traer_reporte_clasificados() {
            $.ajax({
             type: "POST",
            url: 'contenedor_reporte_clasificados.jsp',
             beforeSend: function() {
            $('#div_cargar_menu').show();
            $('#contenido_reporte').html('');
            $('#contenido').html('');
            $('#contenido_eliminar').html('');
            $('#contenido_password').html('');
            $('#contenido_visualizar').html('');
            $("#contenido_2").html('');
                       },           
            success: function (res) {
            $('#div_cargar_menu').hide();
            $("#contenido_2").html(res);
            $("#contenido_2").show();
         
            cargar_estilo_calendario(); 
             }
            
        });   
           }  

    function traer_reporte_ptc_excel() {
           $.ajax({
             type: "POST",
            url: 'contenedor_info_ptc_excel.jsp',
            
            beforeSend: function() {
            $('#div_cargar_menu').show();
            $('#contenido_reporte').html('');
            $('#contenido').html('');
            $('#contenido_eliminar').html('');
            $('#contenido_password').html('');
            $('#contenido_visualizar').html('');
            $("#contenido_2").html('');
                       },           
            success: function (res) {
            $('#div_cargar_menu').hide();
            $("#contenido_2").html(res);
            $("#contenido_2").show();
         
            cargar_estilo_calendario(); 
             }
            
        });   
              }  

    function traer_reporte_transferencia() {
            
            
              $.ajax({
             type: "POST",
            url: 'contenedor_reporte_transferencia.jsp',
            
            beforeSend: function() {
               $('#div_cargar_menu').show();
             $('#contenido_reporte').html('');
          $('#contenido').html('');
          $('#contenido_eliminar').html('');
          $('#contenido_password').html('');
          $('#contenido_visualizar').html('');
           $("#contenido_2").html('');
                       },           
            success: function (res) {
           $('#div_cargar_menu').hide();
           $("#contenido_2").html(res);
          $("#contenido_2").show();
         
            cargar_estilo_calendario(); 
             }
            
        });   
        }  

    function ir_grilla_transferencia(fecha,tipo) {
    $.ajax({
        type: "POST",
        url: "acordeon_transferencia.jsp",
        data: {fecha:fecha,tipo:tipo},
        
         beforeSend: function() {
    $('#div_cargar').show();
            },
        success: function(data) {
         $('#div_grilla_tipo_transferencia').html(data);
         $('#div_cargar').hide();
                                }
                });
 
 
        }  

    function traer_pendiente_liberacion() {
            
             $.ajax({
             type: "POST",
            url: 'grilla_pendiente_liberacion.jsp',
            
            beforeSend: function() {
          $('#div_cargar_menu').show();
          $('#contenido_reporte').html('');
          $('#contenido').html('');
          $('#contenido_eliminar').html('');
          $('#contenido_password').html('');
          $('#contenido_visualizar').html('');
          $("#contenido_2").html('');
                       },           
            success: function (data) {
          $('#div_cargar_menu').hide();
          $("#contenido_2").html(data);
          $("#contenido_2").show();
         
            cargar_estilo_calendario(); 
            $('#grilla_lotes_liberacion').DataTable( {
                "scrollX": true,
                "pageLength": 100
                        } );
             
             }
                 });   
               } 

    function traer_control_eliminar(id,cod_lote){
                    
                    $.get('eliminar_control.jsp',{id:id,cod_lote:cod_lote},function(res){
                          Eliminar_fila_grilla_eliminar();
                          traer_detalle_eliminar($('#calendario_eliminar').val());
        swal.fire({
            type: 'error',
            title: "REGISTRO ELIMINADO ",
            confirmButtonText: "CERRAR"
        });
                                                                        });
                                        }
                                        
    function traer_grilla_reproceso(){
           
          $.get('grilla_reproceso.jsp',function(res){
           $("#contenedor_grilla_reproceso").html(res);
           
         
                                                  });
         
                                     }                                     
 
    function inicializar_unidad_medida(){
    medida=$("#unidad_medida");     
    tipo_huevo=$("#tipo_huevo");
    tipo_huevo.change(cargar_unidad_medida);
 }

    function unidad_medida_registrar_retenido(){
    medida=$("#unidad_medida_retenido");     
    tipo_huevo=$("#tipo_huevo_retenido");
    tipo_huevo.change(cargar_unidad_medida_retenido);
 }

    function cargar_unidad_medida() { 
 
    medida.children().remove();  
 
 if (tipo_huevo.val()==="2"||tipo_huevo.val()==="3"||tipo_huevo.val()==="4"||tipo_huevo.val()==="5"
    ||tipo_huevo.val()==="6"||tipo_huevo.val()==="SC"||tipo_huevo.val()==="7") { 
      var nombre_option = new Array();
      var cantidad = new Array();
      nombre_option[0] = "CAJON"; 
      cantidad[0] = "360"; 
      nombre_option[1] = "CARRITO NORMAL";
      cantidad[1] = "4320"; 
      
      for(var i=0; i< nombre_option.length; i++) {
            medida.append('<option value="' + cantidad[i] + '">' +   nombre_option[i] + '</option>');
      }
 }
 
  else if (tipo_huevo.val()==="1") {
      var nombre_option = new Array(); 
      var valores = new Array();
      nombre_option[0] = "CAJON GIGANTE"; 
      valores[0] = "180";
      
       for(var i=0; i< nombre_option.length; i++) {
           medida.append('<option value="' + valores[i] + '">' +   nombre_option[i] + '</option>');
      }

 }

else if (tipo_huevo.val()==="9" ||tipo_huevo.val()==="8"||tipo_huevo.val()==="RP") {
      var nombre_option = new Array(); 
      var valores = new Array();
      var id_fecha= $('#id_date').val();
      nombre_option[0] = "GRANEL"; 
      valores[0] = "1";
      
       for(var i=0; i< nombre_option.length; i++) {
           medida.append('<option value="' + valores[i] + '">' +   nombre_option[i] + '</option>');
      }
      
      $('#cod_carrito').val(id_fecha);
      
 }

}         

    function cargar_unidad_medida_retenido() { 
 
    medida.children().remove();  
 
 if (tipo_huevo.val()==="2"||tipo_huevo.val()==="3"||tipo_huevo.val()==="4"||tipo_huevo.val()==="5"
    ||tipo_huevo.val()==="6"||tipo_huevo.val()==="7") { 
      var nombre_option = new Array();
      var cantidad = new Array();
      nombre_option[0] = "CAJON"; 
      cantidad[0] = "360"; 
      nombre_option[1] = "CARRITO NORMAL";
      cantidad[1] = "4320"; 
      
      for(var i=0; i< nombre_option.length; i++) {
            medida.append('<option value="' + cantidad[i] + '">' +   nombre_option[i] + '</option>');
      }
 }
 
  else if (tipo_huevo.val()==="1") {
      var nombre_option = new Array(); 
      var valores = new Array();
      nombre_option[0] = "CAJON GIGANTE"; 
      valores[0] = "180";
      
       for(var i=0; i< nombre_option.length; i++) {
           medida.append('<option value="' + valores[i] + '">' +   nombre_option[i] + '</option>');
      }

 }


}

    function cargar_estilo_calendario(){
    
       $('.datepicker').pickadate({
        // Escape any “rule” characters with an exclamation mark (!).
        format: 'dd/mm/yyyy',
        formatSubmit: 'dd/mm/yyyy',
        hiddenPrefix: 'prefix__',
        hiddenSuffix: '__suffix',
        cancel: 'Cancelar',
        clear: 'Limpiar',
        done: 'Ok',
        today: 'Hoy',
        close: 'Cerrar',
        max: true,
        monthsFull: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
        monthsShort: ['ene', 'feb', 'mar', 'abr', 'may', 'jun', 'jul', 'ago', 'sep', 'oct', 'nov', 'dic'],
        weekdaysFull: ['Domingo', 'Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado'],
        weekdaysShort: ['dom', 'lun', 'mar', 'mie', 'jue', 'vie', 'sab'],
     });
            
}
 
    function cargar_estilo_calendario_insert(){
    
       $('.datepicker').pickadate({
        // Escape any “rule” characters with an exclamation mark (!).
        format: 'yyyy/mm/dd',
        formatSubmit: 'yyyy/mm/dd',
        hiddenPrefix: 'prefix__',
        hiddenSuffix: '__suffix',
        cancel: 'Cancelar',
        clear: 'Limpiar',
        done: 'Ok',
        today: 'Hoy',
        close: 'Cerrar',
        max: true,
        monthsFull: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
        monthsShort: ['ene', 'feb', 'mar', 'abr', 'may', 'jun', 'jul', 'ago', 'sep', 'oct', 'nov', 'dic'],
        weekdaysFull: ['Domingo', 'Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado'],
        weekdaysShort: ['dom', 'lun', 'mar', 'mie', 'jue', 'vie', 'sab'],
     });
            
}

    function parpadeo(){
    var contador=$('#contador_text').val();
    if (contador=='0'){
        endAnimation();
    }
        else {
          initAnimation();  
    }
       }
    
    function initAnimation(){
   document.getElementById('div_pendiente').className =' card border-left-success shadow h-100 py-2 animacion';
}

    function endAnimation(){
    document.getElementById('div_pendiente').className ='';
    document.getElementById('div_principal_pendiente').className ='ocultar_div';
}


    function ir_grilla_transformacion_pallet_carro(){
            $.ajax({
            type: "POST",
            url: 'grilla_transformacion_pallet_carro.jsp',
            data:({fecha_puesta:$('#fecha_puesta').val()}),
             beforeSend: function() {
            
                                },           
            success: function (res) {
           $("#contenido_grilla_transformacion_pallet_carro").html(res);
             $('#example').DataTable( {
                    "scrollX": true,
                    "pageLength": 100
                    } );
                                }
                });   
          
                                             }
                                             
                                             
  function registro_transformacion_pallet_carro(id,nro_pallet){
      
         Swal.fire({
            title: 'TRANSFORMACION DE PALLET A CARRO',
            type: 'warning',
            html: " <a><strong>PALLET NRO"+nro_pallet+"</strong> </a><br><br><a>INGRESE EL NUMERO DE CARRO</a> <input type='number' class='form-control' id='txt_nro_carro' placeholder='INGRESE NRO'/>",
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'REGISTRAR',
                cancelButtonText: 'CANCELAR'
        }).then((result) => {
            if (result.value) {

                var cod_carrito = $('#txt_nro_carro').val();

                if (cod_carrito.length <6) {
                    Swal.fire({
                        title: 'ERROR, DEBE INGRESAR UN NUMERO DE CARRO VALIDO.',
                        type: 'error',
                        animation: true,
                        customClass: {
                            popup: 'animated tada'
                        }
                    });
                }

                else {
                    
                     $.ajax({
        type: "POST",
        url: "control_tranformacion_pallet_ptc.jsp",
        data: ({ id: id,cod_carrito:cod_carrito}),
        beforeSend: function () {
            Swal.fire({
                title: 'PROCESANDO!',
                html: '<strong>ESPERE</strong>...',
                allowOutsideClick: false,
                onBeforeOpen: () => {
                    Swal.showLoading()
                    timerInterval = setInterval(() => {
                        Swal.getContent().querySelector('strong')
                            .textContent = Swal.getTimerLeft()
                    }, 1000);
                }
            });
        },
        success: function (data) {

            aviso_transformacion(data.tipo,data.mensaje);
             
        } 
    });
                    
                }
    }
        });
  }
  
  
  function aviso_transformacion(tipo,mensaje){
      if(tipo==0){
         swal.fire({
            type: 'success',
            title: "TRANSFORMACION REALIZADA CON EXITO.",
            confirmButtonText: "CERRAR"
        });  
        ir_grilla_transformacion_pallet_carro();
      }
      else {
          
          swal.fire({
            type: 'error',
            html: mensaje,
            confirmButtonText: "CERRAR"
        });    
      }
     
  }
  
  