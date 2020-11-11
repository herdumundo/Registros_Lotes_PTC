  var ruta_contenedores="./contenedores/";
  var ruta_controles="./controles/";
  var ruta_grillas="./grillas/";
  var ruta_consultas="./consultas/";
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
            url: ruta_contenedores+'contenedor_transferencia.jsp',
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
            url: ruta_contenedores+pagina+'.jsp',
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
            $.get(ruta_consultas+'consulta_fecha.jsp',function(data){ $("#fecha").val(data.fecha);});
            $('.datepicker').pickadate({ format: 'dd/mm/yyyy'});
            $("#contenido_2").show();
            $('#grilla_transfer').bootstrapTable({"scrollX": true,"pageLength": 100}); 
           
            
            }
                           
                        });  
        
         
        }       
        
    function ir_panel(){
            $.ajax({
            type: "POST",
            url: ruta_contenedores+'contenedor_menu_panel.jsp',
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
            url: ruta_contenedores+'contenedor_registro_liberados_viejos.jsp',
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
            url: ruta_grillas+'grilla_motivo_retencion.jsp',
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
            url: ruta_contenedores+'contenedor_reemplazo_motivos.jsp',
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
            url: ruta_contenedores+'contenedor_reporte_retenidos_historico.jsp',
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
                                             
    function ir_configuracion_empacadora(){
            $.ajax({
            type: "POST",
            url: ruta_contenedores+'contenedor_empacadora.jsp',
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
                ir_grilla_empacadoras();
                                    }
                                        });   
                                            }
 
                                              
    function ir_cambio_fp_ptc(){
            $.ajax({
            type: "POST",
            url: ruta_contenedores+'contenedor_cambio_fp.jsp',
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
                                          
      function ir_cambio_nro_ptc(){
            $.ajax({
            type: "POST",
            url: ruta_contenedores+'contenedor_cambio_nro_ptc.jsp',
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
            url: ruta_contenedores+'contenedor_transformacion_pallet_carro.jsp',
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
            url: ruta_grillas+'grilla_retenidos_panel.jsp',
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
            url: ruta_contenedores+'contenedor_registro_retenido_costeados.jsp',
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
            url: ruta_contenedores+'contenedor_menu_reporte.jsp',
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

    function traer_menu(){
        var perfil=$('#perfil').val();
            $.ajax({
                type: "POST",
                url: ruta_contenedores+'contenedor_menu.jsp',
             beforeSend: function() 
             {
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
            url: ruta_contenedores+'contenedor_registro.jsp',
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
    
    function traer_registro_retenido(){
            $.ajax({
            type: "POST",
            url: ruta_contenedores+'contenedor_registro_retenido.jsp',
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
            url: ruta_contenedores+'contenedor_retenidos.jsp',
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
            url: ruta_contenedores+'contenedor_retenidos_puesta.jsp',
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
           
             $.get(ruta_contenedores+'contenedor_fecha_involucrada.jsp',function(res)
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
            url: ruta_contenedores+'contenedor_eliminar.jsp',
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
            url: ruta_contenedores+'contenedor_informe.jsp',
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
           
          $.get(ruta_controles+'lotes_control.jsp',function(res){
                    $("#contenido_2").html(res);
          });
           $('#contenido').hide();
            $('#contenido_2').show();
          
      }
      
    function traer_control(){
           $.get(ruta_controles+'control_registro.jsp',function(res){
                    $("#contenido_2").html(res);
                                         });
                     $('#contenido_2').show();
                    $('#contenido').hide();  
      }
      
    function traer_contendor_cambiar_pass_jsp(){
            $.ajax({
            type: "POST",
            url: ruta_contenedores+'contenedor_password.jsp',
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
            url: ruta_contenedores+'contenedor_pdf.jsp',
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
            url: ruta_contenedores+'contenedor_carro_mesa.jsp',
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
            url: ruta_contenedores+'contenedor_pdf_reproceso.jsp',
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
            url: ruta_contenedores+'contenedor_grilla_reproceso.jsp',
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
                url: ruta_contenedores+'contenedor_reporte_carros.jsp',
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
                url: ruta_contenedores+'contenedor_reporte_mixtos_variable.jsp',
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
            url: ruta_contenedores+'contenedor_reporte_carros_mixtos.jsp',
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
            url: ruta_contenedores+'contenedor_reporte_clasificados.jsp',
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
            url: ruta_contenedores+'contenedor_info_ptc_excel.jsp',
            
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
            url: ruta_contenedores+'contenedor_reporte_transferencia.jsp',
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
        url: ruta_contenedores+"acordeon_transferencia.jsp",
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
            url: ruta_grillas+'grilla_pendiente_liberacion.jsp',
            
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
            $('#grilla_lotes_liberacion').DataTable( {  "scrollX": true,    "pageLength": 100 } );
                }
                 });   
               } 

    function traer_control_eliminar(id,cod_lote) 
    {
            $.get(ruta_controles+'eliminar_control.jsp',{id:id,cod_lote:cod_lote},function(res)
            {
            Eliminar_fila_grilla_eliminar(cod_lote);
            traer_detalle_eliminar($('#calendario_eliminar').val());
            swal.fire({
            type: 'error',
            title: "REGISTRO ELIMINADO ",
            confirmButtonText: "CERRAR"
            });
            });
    }
    function traer_grilla_reproceso(){
        $.get(ruta_grillas+'grilla_reproceso.jsp',function(res){
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
      nombre_option[0] = "SELECCIONE UNIDAD DE MEDIDA"; 
      cantidad[0] = "0"; 
      nombre_option[1] = "CARRITO NORMAL";
      cantidad[1] = "4320"; 
       nombre_option[2] = "CAJON";
      cantidad[2] = "360"; 
      
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
        nombre_option[0] = "SELECCIONE UNIDAD DE MEDIDA"; 
        cantidad[0] = "0"; 
        nombre_option[1] = "CARRITO NORMAL";
        cantidad[1] = "4320"; 
        nombre_option[2] = "CAJON";
        cantidad[2] = "360"; 
        
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
            url: ruta_grillas+'grilla_transformacion_pallet_carro.jsp',
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
   function ir_grilla_cambio_fp_ptc(){
            $.ajax({
            type: "POST",
            url: ruta_grillas+'grilla_ptc_cambio_fp.jsp',
            data:({fecha_puesta:$('#fecha_puesta').val()}),
            beforeSend: function() {
            
                                },           
            success: function (res) {
                $("#contenido_grilla_cambio_fp").html(res);
                $('#example').DataTable( {
                    "scrollX": true,
                    "pageLength": 100   } );
                                }
                });   
          
                                             }  
 
     function ir_grilla_cambio_nro_ptc(){
            $.ajax({
            type: "POST",
            url: ruta_grillas+'grilla_ptc_cambio_nro_ptc.jsp',
            data:({fecha_puesta:$('#fecha_puesta').val()}),
            beforeSend: function() {
            
                                },           
            success: function (res) {
                $("#contenido_grilla_cambio_fp").html(res);
                $('#example').DataTable( {
                    "scrollX": true,
                    "pageLength": 100   } );
                                }
                });   
          
                                             }  
                                             
    function registro_transformacion_pallet_carro(id,nro_pallet,tipo){
      
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
      var url;
      if(tipo=="N"){
          url=ruta_controles+"control_tranformacion_pallet_ptc.jsp";
      }
      else {
          url="http://192.168.6.162/ws/ptc_upd.aspx";
      }
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
        url: url,
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
                    }, 1000); }
                        });  },
        success: function (data) {
                aviso_transformacion(data.tipo,data.mensaje);
            }   });
                }   }
        });
  }
  
  
  
  
  
                                         
    function registro_cambio_fp_ptc(id,tipo){
      
         Swal.fire({
            title: 'CAMBIO DE FECHA DE PUESTA DEL LOTE',
            type: 'warning',
            html: "</a><br><br><a>INGRESE LA FECHA DE PUESTA</a> <input type='text' class='datepicker' id='txt_fecha' placeholder='INGRESE FECHA DE PUESTA'/><br><br><br><br>",
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'REGISTRAR',
                cancelButtonText: 'CANCELAR'
        }).then((result) => {
            if (result.value) {
      var url;
      if(tipo=="N"){
          url=ruta_controles+"control_cambio_fp_ptc.jsp";
      }
      else {
          url="http://192.168.6.162/ws/ptc_upd_fp.aspx";
      }
       var txt_fecha_puesta = $('#txt_fecha').val();

                if (txt_fecha_puesta.length==0) {
                    Swal.fire({
                        title: 'ERROR, DEBE INGRESAR LA FECHA DE PUESTA.',
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
        url: url,
        data: ({ id: id,fecha_puesta:txt_fecha_puesta}),
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
                    }, 1000); }
                        });  },
        success: function (data) 
            {
                aviso_transformacion(data.tipo,data.mensaje);
            }   });
                }   }
        });
        
                    cargar_estilo_calendario();

  }
  
  
  
     function registro_cambio_nro_ptc(id,tipo){
      
         Swal.fire({
            title: 'CAMBIO DE NRO DEL LOTE',
            type: 'warning',
            html: "</a><br><br><a>INGRESE EL NUEVO NUMERO DE CARRO</a> <input type='number' class='form-control' id='nro_carrito' placeholder='INGRESE NRO DE CARRO'/><br><br><br><br>",
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'REGISTRAR',
                cancelButtonText: 'CANCELAR'
        }).then((result) => {
            if (result.value) {
      var url;
      if(tipo=="N"){
          url=ruta_controles+"control_cambio_nro_ptc.jsp";
      }
      else  {
          url="http://192.168.6.162/ws/ptc_upd_nro_carrito.aspx";
            }
       var nro_carrito = $('#nro_carrito').val();

                if (nro_carrito.length<6||nro_carrito.length>6) {
                    Swal.fire({
                        title: 'ERROR, CODIGO DE CARRO INGRESADO INVALIDO.',
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
                url: url,
                data: ({ id: id,cod_carrito:nro_carrito}),
                beforeSend: function () {
                    Swal.fire({
                        title: 'PROCESANDO!',
                        html: '<strong>ESPERE</strong>...',
                        allowOutsideClick: false,
                        onBeforeOpen: () => {
                            Swal.showLoading();
                            timerInterval = setInterval(() => {
                                Swal.getContent().querySelector('strong').textContent = Swal.getTimerLeft();
                           }, 1000); }
                                });  },
                success: function (data) 
                    {
                        aviso_transformacion(data.tipo,data.mensaje);
                    }   });
                        }   }
                });

                  

  }
   
  
    function aviso_transformacion(tipo,mensaje){
      if(tipo==0)
        {
              swal.fire({
              type: 'success',
              title: "TRANSFORMACION REALIZADA CON EXITO.",
              confirmButtonText: "CERRAR" });  
              ir_grilla_transformacion_pallet_carro();
        }
      else 
        {
              swal.fire({
              type: 'error',
              html: mensaje,
              confirmButtonText: "CERRAR" });    
        }
  }
  
    function cuadro_empacadoras(){
 Swal.fire({
            title:  'ACTIVAR EMPACADORA',
            html:   "<a>SELECCIONE EMPACADORA</a><br><select style='font-weight: bold;' class='form-control' name='empacadora' id='empacadora'  > "+
                    "<OPTION style='font-weight: bold;' VALUE='0'>0</OPTION> "+
                    "<OPTION style='font-weight: bold;' VALUE='1'>1</OPTION> "+
                    "<OPTION style='font-weight: bold;' VALUE='2'>2</OPTION>"+
                    "<OPTION style='font-weight: bold;' VALUE='3'>3</OPTION>"+
                    "<OPTION style='font-weight: bold;' VALUE='4'>4</OPTION>"+
                    "<OPTION style='font-weight: bold;' VALUE='5'>5</OPTION>"+
                    "<OPTION style='font-weight: bold;' VALUE='6'>6</OPTION>"+
                    "<OPTION style='font-weight: bold;' VALUE='7'>7</OPTION>"+
                    "<OPTION style='font-weight: bold;' VALUE='8'>8</OPTION>"+
                    "<OPTION style='font-weight: bold;' VALUE='9'>9</OPTION>"+
                    "<OPTION style='font-weight: bold;' VALUE='10'>10</OPTION>"+
                    "<OPTION style='font-weight: bold;' VALUE='11'>11</OPTION>"+
                    "<OPTION style='font-weight: bold;' VALUE='12'>12</OPTION>"+
                    "</select> <br><a>SELECCIONE TIPO DE HUEVO</a><br>"+ 
                    "<select style='font-weight: bold;' class='form-control' name='tipo_huevo' id='tipo_huevo'  > "+
                    "<OPTION style='font-weight: bold;' VALUE='G'>G</OPTION>"+
                    "<OPTION style='font-weight: bold;' VALUE='J'>J</OPTION>"+
                    "<OPTION style='font-weight: bold;' VALUE='S'>S</OPTION>"+
                    "<OPTION style='font-weight: bold;' VALUE='A'>A</OPTION>"+
                    "<OPTION style='font-weight: bold;' VALUE='B'>B</OPTION>"+
                    "<OPTION style='font-weight: bold;' VALUE='C'>C</OPTION>"+
                    "<OPTION style='font-weight: bold;' VALUE='D'>4TA</OPTION>"+
                    "</select> ",
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor:  '#d33',
            confirmButtonText:  'ACTIVAR',
            cancelButtonText:   'CANCELAR'
                    }).then((result) => {
            if (result.value) {
 
                
    $.ajax({
        type: "POST",
        url: ruta_controles+"control_empacadora.jsp",
        data: ({ empacadora: $('#empacadora').val(), tipo_huevo: $('#tipo_huevo').val()}),
        beforeSend: function () {
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
        },
        success: function (data) {
            
            Swal.close();
           if(data.tipo_respuesta==0){
               swal.fire({
            type: 'success',
            title: data.mensaje,
            confirmButtonText: "CERRAR"
        });
          ir_grilla_empacadoras();
           }
           else {
               
                 swal.fire({
            type: 'error',
            html: data.mensaje,
            confirmButtonText: "CERRAR"
        });   
           }
           
        } 
    });
               
            }
        });
  }
  
    function ir_grilla_empacadoras(){
    $.ajax({
        type: "POST",
        url: ruta_grillas+'grilla_empacadora.jsp',
        beforeSend: function() { 
                       },           
        success: function (data) {
        $("#div_tabla").html(data);
        }
        }); 
  }
  
    function consulta_empacadora(){
    $.ajax({
        type: "POST",
        url: ruta_consultas+'grilla_option_empacadoras.jsp',
        data:({tipo_huevo:$('#tipo_huevo option:selected').text()}),
        beforeSend: function() { 
                       },           
        success: function (data) {
        //$("#nro_empacadora").html(data.mensaje);
          $("#nro_empacadora").empty();
        $("#nro_empacadora").append(data.mensaje);
        }
        }); 
  }
  
    function consulta_empacadora_retenido(){
    $.ajax({
        type: "POST",
        url: ruta_consultas+'grilla_option_empacadoras.jsp',
        data:({tipo_huevo:$('#tipo_huevo_retenido option:selected').text()}),
        beforeSend: function() { 
                       },           
        success: function (data) {
        //$("#nro_empacadora").html(data.mensaje);
          $("#nro_empacadora").empty();
        $("#nro_empacadora").append(data.mensaje);
        }
        }); 
  }
  
    function cerrar_empacadora(id){
        
        Swal.fire({
            title: 'EMPACADORA',
            type: 'warning',
            text: "DESEA CERRAR LA EMPACADORA",
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'ACEPTAR',
                cancelButtonText: 'CANCELAR'
        }).then((result) => {
            if (result.value) {
    $.ajax({
            type: "POST",
            url: ruta_controles+'control_cerrar_empacadora.jsp',
            data:({id:id}),
             beforeSend: function() {
            
                                },           
            success: function (data) {
         
                  Swal.close();
           if(data.tipo_respuesta==0){
               swal.fire({
            type: 'success',
            title: data.mensaje,
            confirmButtonText: "CERRAR"
        });
          ir_grilla_empacadoras();
           }
           else {
               
                 swal.fire({
            type: 'error',
            html: data.mensaje,
            confirmButtonText: "CERRAR"
        });   
           }
                                }
                });   
    }
        });
         }
         
    function habilitar_boton_registrar() {
	$('#tipo_almacenamiento').change(function(){
        $('#btn_registrar').removeAttr('disabled');
        });}
 
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

    function  filtro_eliminar(){
                    $("#buscar_eliminar").on("keyup", function() {
                    var value = $(this).val().toLowerCase();
                     $("#grilla_eliminar tr").filter(function() {
                     $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                        });
                       });
                      };
                      
    function traer_detalle_eliminar(fecha)  {
               $.get(ruta_grillas+'grilla_eliminar.jsp',{fecha:fecha},function(res){
                    $("#id_div").html(res);
                 $('#grilla_eliminar').DataTable();
    });  } 
    
    function traer_detalle_fecha_involucrada(fecha){
        $.get(ruta_grillas+'grilla_fecha_involucrada.jsp',{fecha:fecha},function(res){
        $("#div_id_involucrada").html(res);
        $('#grilla_involucrada').DataTable();
    });  } 

    function visible_div_eliminar(){
        var elemento = document.getElementById("div_eliminar");
        elemento.style.display = 'block';
    }
    
    function filtrar_grilla_retenido (){
        $("#buscar_retenido").on("keyup", function() {
            var value = $(this).val().toLowerCase();
            $("#tabla_retenido tr").filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                        });
                       });
                      }
    
    function setear_grilla(){     
        var arr = $('[name="checks[]"]:checked').map(function(){
        return this.value;
        }).get();
        var resultado_seleccionado = arr.join(',');
        $('#resultado_seleccionado').val(resultado_seleccionado);
        var combo=$('#estado_requerido').val(); 
        var  select=$("#resultado_seleccionado").val();
        var txt_liberado= $('#liberado_por').val();  
        var estado_liberacion= $('#estado_liberacion').val();  
        var motivo_retencion= $('#motivo_retencion').val();  
        var disposicion= $('#disposicion').val();  
        if( select==="")
            {
            swal({   
            title: "ERROR, SELECCIONE LOTE!!!",   
            text: "",   
            timer: 2000,   
            showConfirmButton: false
            });
               $.preloader.stop();
            }
            else    {
                if(combo==="L"){
                if(txt_liberado==="")
                {
                swal({   
                title: "ERROR, COMPLETE TODOS LOS DATOS!!!",   
                text: "",   
                timer: 2000,   
                showConfirmButton: false
                        }); 
                }
                else{
                    imprimir();
                    enviar_datos_retenidos2();    
                                }
            }
            if(combo==="R"){
            if(estado_liberacion===null||motivo_retencion===null||disposicion===null ){
                swal({   
                    title: "ERROR, COMPLETE TODOS LOS DATOS!!!",   
                    text: "",   
                    timer: 2000,   
                    showConfirmButton: false
                        }   ); 
                    $.preloader.stop(); 
            }
            else{
                imprimir();
                enviar_datos_retenidos2();    
                }
            }
        }
    } 
   
    function validar_seleccion(){
      if($("#resultado_seleccionado").val()=="") {
          alert("DEBE SELECCIONAR AL MENOS UN LOTE"); 
      }
 }
 
    function ir_control_movimiento_retenido_liberado(clase)
    {
        if($("#desde").val()==""||$("#hasta").val() == ""||$("#calendario_retenido").val() == "") 
        {
            alert("ERROR COMPLETAR DATOS"); 
        }
        else 
        {
            $.get(ruta_grillas+clase+'.jsp',{fecha_retenido:$("#calendario_retenido").val(),inicio_retenido:$("#desde").val(),fin_retenido:$("#hasta").val(),combo_estado_retenido:$("#estado_requerido").val()},function(res){
            $("#divid_grilla_retenido").html(res);
            $("#box_retenidos").on('click',function(){
            chequear_todos_retenidos2();
                    }); });
            $('#divid_grilla_retenido').show(); 
            $('#btn_registrar_retenido').show(); 
        }
         visible();
    }
         
            
    function chequear_todos_retenidos2(){
        var checked = $("#box_retenidos").prop('checked');
        $('#divid_grilla_retenido').find('input:checkbox').prop('checked', checked);
    }
    
    function traer_grilla_carromesa(fecha_carromesa){
        $.get('grillas/grilla_carros_mesas.jsp',{fecha_carromesa:fecha_carromesa},function(res){
        $("#tabla_carromesa").html(res);
        });
            }
            
    function filtrar_grilla_carromesa (){
        $("#buscar_carromesa").on("keyup", function() {
        var value = $(this).val().toLowerCase();
        $("#tabla_carromesa tr").filter(function() {
        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                        });
                       });
                      }
                      
    function validar_carro_mesa() {
                          
        if ($('#codigo_mesa').val()==='') {
        boton_animacion_validacion_carromesa();  
        return false;
            }
    else{
        
        boton_animacion_eliminar();
        }
    }

    function visible(){
    var estado= $("#estado_requerido").val();
        if (estado==="R"||estado==="Z"){
            $("#combo_retenido").show();
            $("#liberado_por").hide();
        }
        if (estado==="L"){
            $("#liberado_por").show();
            $("#combo_retenido").hide();
            }
        }

    function imprimir(){
        $.preloader.start({
        modal: true,
        src : 'sprites2.png'
                });
                };
 
        
    function reporte_ptc_direccionar(){
        var combo =$("#cbox_estado").val();
        if (combo==="L"){
            $('#formulario_reporte_reproceso').attr('action', ruta_controles+'control_reporte_carros.jsp');
                        }
        if (combo==="R") {
            $('#formulario_reporte_reproceso').attr('action', ruta_controles+'control_reporte_carros_retenidos.jsp');
            }
        }
    
    function ir_reporte_excel_ptc(calendario_informe,estado){
        $.get(ruta_grillas+'grilla_ptc_excel.jsp',{calendario_informe:calendario_informe,estado:estado},
        function(res){
        $("#mobiles").html(res);    });
        $('#divid').show();                            
    }
    
    function exportar_excel_ptc(elem) {
        var table =document.getElementById("mobiles"); 
        var html = table.outerHTML;
        var url = 'data:application/vnd.ms-excel,' + escape(html); // Set your html table into url 
        elem.setAttribute("href", url);
        elem.setAttribute("download", "REPORTE PTC.xls"); // Choose the file name
        return false;
    }
    
 
  function validacion_involucrada(){
      
    var txt_cod_lote=  $('#txt_cod_lote').val();
    var cantidad_huevos=   $('#cantidad_huevos').val();
    var fecha_involucrada=  $('#fecha_involucrada').val();     
  
  if (txt_cod_lote==""||fecha_involucrada==""){
      
  
  swal.fire({
            type: 'error',
            html: "COMPLETAR DATOS!",
            confirmButtonText: "CERRAR"
        });  
  }
  
  else { 
      enviar_asignacion(); 
  }
 }
  
    function enviar_asignacion() 
        {
        var txt_cod_lote=  $('#txt_cod_lote').val();
        var cantidad_huevos=   $('#cantidad_huevos').val();
        var fecha_involucrada=  $('#fecha_involucrada').val();   
        insertar_registro_involucrada(txt_cod_lote,cantidad_huevos,fecha_involucrada);
        }
             
  
    function insertar_registro_involucrada(txt_cod_lote,cantidad_huevos,fecha_involucrada){
        $.get(ruta_controles+'control_correccion.jsp',{txt_cod_lote:txt_cod_lote,cantidad_huevos:cantidad_huevos,fecha_involucrada:fecha_involucrada},
        function(res){
            $("#mensaje_correccion").html(res);
                });
            }