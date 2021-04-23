  var ruta_contenedores="./contenedores/";
  var ruta_controles="./controles/";
  var ruta_grillas="./grillas/";
  var ruta_consultas="./consultas/";
  $(document).ready(function(){
     no_volver_atras();
     traer_menu();
  
    });
    function comprobar_clasificadora(){
    var clasificadora=$('#clasificadora_menu').val();
    
        if (clasificadora=="O"||clasificadora=="C"){
           // $("#liberado_por").prop('required', 'required');
            $('#div_aviarios').hide();
            $('#cbox_aviarios').removeAttr('required');
        }

    }
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
            cargar_estilo_calendario();
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
                    "pageLength": 100, 
                    "language": {
                    "sUrl": "js/Spanish.txt"
        }
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
                                    
    function ir_transformacion_ptc(){
            $.ajax({
            type: "POST",
            url: ruta_contenedores+'contenedor_transformacion_PTC.jsp',
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
            "pageLength": 100,
             "language": {
              "sUrl": "js/Spanish.txt"
                }
                        } );
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

    function traer_menu()
    {
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
            success: function (res) 
            {
            $('#div_cargar_menu').hide();
            $("#contenido").html(res);
            $('#contenido').show();
            
             $.get(ruta_consultas+'consulta_pendientes_retenidos.jsp',function(res){
                parpadeo(res.cantidad,res.fecha_vieja_retenido,res.fecha_vieja); 
        
             });
           
            if(perfil=="U")
                {
                 $('#div_panel').hide(); 
                 $('#panel').hide(); 
                 $('#panel_tit').hide(); 
                 }
            else 
                {
                $('#div_panel').show(); 
                $('#panel').show(); 
                $('#panel_tit').hide(); 

                    } 
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
            success: function (res) 
            {
                $('#div_cargar_menu').hide();
                $("#contenido_2").html(res);
                $("#contenido_2").show();
                $('.checkbox').bootstrapToggle();
                $(".dtBox").DateTimePicker();
                cargar_toggles();
                cargar_estilo_calendario_insert();
                inicializar_unidad_medida();
                document.getElementById("boxColor").style.backgroundColor = "lightblue";
                $('#formulario').on('submit', function(event)
                {
                    event.preventDefault();
                    procesar('control_registro_costeado');
                    event.stopPropagation();
                }); 
                comprobar_clasificadora();
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
            success: function (res) 
            {
                $('#div_cargar_menu').hide();
                $("#contenido_2").html(res);
                $("#contenido_2").show();
                $('.checkbox').bootstrapToggle();
                $(".dtBox").DateTimePicker();
                cargar_toggles();
                cargar_estilo_calendario_insert();
                inicializar_unidad_medida();
                document.getElementById("boxColor").style.backgroundColor = "lightblue";
                document.getElementById("boxColor_red").style.backgroundColor = "green";
                $('#formulario').on('submit', function(event)
                {
                    event.preventDefault();
                    procesar('control_registro');
                    event.stopPropagation();
                }); 
                $('#txt_fecha_involucrada').multiDatesPicker({dateFormat: 'yy/mm/dd'});
                comprobar_clasificadora();
            }
                });  
                    }
                    
    function traer_registro_retenido()
    {
        $.ajax(
            {
                type: "POST",
                url: ruta_contenedores+'contenedor_registro_retenido.jsp',
                beforeSend: function() 
                {
                    $('#div_cargar_menu').show();
                    $('#contenido_reporte').html('');
                    $('#contenido').html('');
                    $('#contenido_eliminar').html('');
                    $('#contenido_password').html('');
                    $('#contenido_visualizar').html('');
                    $("#contenido_2").html('');
                },           
                success: function (res) 
                {
                    $('#div_cargar_menu').hide();
                    $("#contenido_2").html(res);
                    $("#contenido_2").show();
                    $('.checkbox').bootstrapToggle();
                    $(".dtBox").DateTimePicker();
                    document.getElementById("boxColor").style.backgroundColor = "lightblue";
                    document.getElementById("boxColor_red").style.backgroundColor = "green";
                    
                    cargar_toggles();
                    cargar_estilo_calendario_insert();
                    $('#formulario').on('submit', function(event)
                    {
                        event.preventDefault();
                        procesar('control_retenidos');
                        event.stopPropagation();
                    });     
                    $('#txt_fecha_involucrada').multiDatesPicker({dateFormat: 'yy/mm/dd'});
                    comprobar_clasificadora();

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
            success: function (res) 
            {
                $('#div_cargar_menu').hide();
                $("#contenido_2").html(res);
                $("#contenido_2").show();
                $('.checkbox').bootstrapToggle();
                $(".dtBox").DateTimePicker();
                document.getElementById("boxColor").style.backgroundColor = "lightblue";
                cargar_toggles();
                cargar_estilo_calendario_insert();
                $('#formulario').on('submit', function(event)
                {
                    event.preventDefault();
                    procesar('control_retenidos_costeados');
                    event.stopPropagation();
                });   
                comprobar_clasificadora();
            }
                });   
          
                                             }
    function validar_fechaInicial_fechaFinal ()
    {
         $('#cbox_aviarios').html('');  
        var fecha_clasificacion_inicial=$('#calendario_registro').val();
        var fecha_clasificacion_final=$('#fecha_clas_final').val();
        var hora_inicial=$('#hora_desde').val();
        var hora_final=$('#hora_hasta').val();
        var date_inicial=new Date(fecha_clasificacion_inicial+' '+hora_inicial+':00') ;
        var date_final=new Date(fecha_clasificacion_final+' '+hora_final+':00') ; 
        var date_inicial_consulta= fecha_clasificacion_inicial+' '+hora_inicial+':59.000';
        var date_final_consulta= fecha_clasificacion_final+' '+hora_final+':00.000';
        
        
        if(fecha_clasificacion_inicial.length>0&&fecha_clasificacion_final.length>0&&hora_inicial.length>0&&hora_final.length>0)
        {
            if(date_inicial>date_final)
            {
               swal.fire({
                        type: 'error',
                        title: "FECHA DE CLASIFICACION INICIAL NO PUEDE SER MAYOR A LA FINAL.!!!",
                        confirmButtonText: "CERRAR"
                        });  
                $('#fecha_clas_final').val('');
               
            }
            else 
            {
                 $.get(ruta_consultas+'consulta_aviarios_hora.jsp',{fecha_inicio:date_inicial_consulta,fecha_final:date_final_consulta},function(res)
                {
                  $('#cbox_aviarios').html(res.aviarios);  
                }); 
            }
        }
    }

      
    function ir_movimiento(){
            $.ajax({
            type: "POST",
            url: ruta_contenedores+'contenedor_movimientos.jsp',
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
            get_checkbox_selected_movimientos();
            $(".dtBox").DateTimePicker();
            $("#boxColor").css('background-color','lightblue');            }
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
                $('#txt_fecha_involucradas').multiDatesPicker({dateFormat: 'yy/mm/dd'});
                $('#formulario_correccion').on('submit', function(event)
                    {
                        event.preventDefault();
                        registrar_fecha_involucradas();
                        event.stopPropagation();
                    });               
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
            url: ruta_contenedores+'contenedor_disposicion.jsp',
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
            success: function (res) 
            {
                $('#div_cargar_menu').hide();
                $("#contenido_2").html(res);
                $("#contenido_2").show();
                cargar_estilo_calendario(); 
                $(".dtBox").DateTimePicker();
                $('.selectpicker').selectpicker();
                $('.checkbox').bootstrapToggle();   
                $('#check_tipo_calendario').change(function () 
                {
                    if ($(this).prop("checked") == true) 
                    {
                        $('#tipo_calendario').val('INVOLUCRADA');
                    }
                    else 
                    {
                        $('#tipo_calendario').val('PUESTA');
                    }
                });
                
                  $('#check_filtro_aviario').change(function () 
                {
                    if ($(this).prop("checked") == true) 
                    {
                        $('#filtro_aviario').val('SI');
                        $('#boxColor').hide();
                        $('#div_aviarios').show();

                    }
                    else 
                    {
                        $('#filtro_aviario').val('NO');
                        $('#boxColor').show();
                        $('#div_aviarios').hide();

                    }
                });
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
            $('.selectpicker').selectpicker();
            $('.checkbox').bootstrapToggle();   
            $('#check_filtro_aviario').change(function () 
                {
                    if ($(this).prop("checked") == true) 
                    {
                        $('#filtro_aviario').val('SI');
                        $('#boxColor').hide();
                        $('#div_aviarios').show();
                        $('#div_filtro_carro').hide();
                        $('#cod_carrito').val('0')();

                    }
                    else 
                    {
                        $('#filtro_aviario').val('NO');
                        $('#boxColor').show();
                        $('#div_aviarios').hide();
                        $('#div_filtro_carro').show();
                        $('#cod_carrito').val('0')();
                    }
                });
              $('#check_filtro_carro').change(function () 
                {
                    if ($(this).prop("checked") == true) 
                    {
                         $('#div_carrito').show();
                    }
                    else 
                    {
                        $('#div_carrito').hide();
                        $('#cod_carrito').val('0')();
                    }
                });  
                

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
            
            ir_reporte_excel_ptc();
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
            $('#grilla_lotes_liberacion').DataTable( {  
                "scrollX": true,     "paging":   false,
        "ordering": false,
        "info":     true 
        ,"language": {
              "sUrl": "js/Spanish.txt"
                }} 
            ,);
                }
                 });   
               } 
   
    function buscar_aviarios_disponibles()
    {
        var fecha_clasificacion_inicial=$('#calendario_registro').val();
        var fecha_clasificacion_final=$('#fecha_clas_final').val();
        var hora_inicial=$('#hora_desde').val();
        var hora_final=$('#hora_hasta').val();
        var date_inicial= fecha_clasificacion_inicial+' '+hora_inicial+':00.000';
        var date_final= fecha_clasificacion_final+' '+hora_final+':59.000';
        
        if(fecha_clasificacion_inicial.length>0&&fecha_clasificacion_final.length>0&&hora_inicial.length>0&&hora_final.length>0)
        {
            $.get(ruta_consultas+'eliminar_control.jsp',{fecha_inicio:date_inicial,fecha_final:date_final},function(res)
            {
              $('#cbox_aviarios').html(res.aviarios)  
            }); 
        }
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
 

    function cargar_unidad_medida(id_select_huevo,id_uMedida) { 
  var tipo=id_select_huevo;
   var html=""; 
 
   if ($('#'+tipo).val()==="1") {
        html="<OPTION style='font-weight: bold;' VALUE='180'>CAJON GIGANTE</OPTION>";
    }
    else { 
      html="<OPTION style='font-weight: bold;' VALUE='' selected >SELECCIONE UNIDAD DE MEDIDA</OPTION>\n\
            <OPTION style='font-weight: bold;' VALUE='4320'>CARRITO NORMAL</OPTION>\n\
            <OPTION style='font-weight: bold;' VALUE='360'>CAJON</OPTION>";
        }
    $('#'+id_uMedida).html(html);

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
       // required:true,
        // editable: true,
        monthsFull: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
        monthsShort: ['ene', 'feb', 'mar', 'abr', 'may', 'jun', 'jul', 'ago', 'sep', 'oct', 'nov', 'dic'],
        weekdaysFull: ['Domingo', 'Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado'],
        weekdaysShort: ['dom', 'lun', 'mar', 'mie', 'jue', 'vie', 'sab']
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

    function parpadeo(cantidad,fecha_vieja_retenido,fecha_vieja){

        if (cantidad=='0'){
        endAnimation();
           $( "#texto_global" ).html( "<font color='black'><center><b>FECHA DE PUESTA MAS VIEJA, "+fecha_vieja+" </b></center></font>" );
            $('#notificacion').hide(true);
    }
        else {
          initAnimation(fecha_vieja_retenido,fecha_vieja);  
            }
       }
    
    function initAnimation(fecha_vieja_retenido,fecha_vieja)
    {
        document.getElementById('div_pendiente').className =' card border-left-success shadow h-100 py-2 animacion';
        $( "#texto" ).html( "<font color='black'><b>TIENE PENDIENTES DE LIBERACION, CON FECHA DE PUESTA MAS VIEJA, "+fecha_vieja_retenido+" </b></font>" );
        $( "#texto_global" ).html( "<font color='black'><center><b>FECHA DE PUESTA MAS VIEJA, "+fecha_vieja+" </b></center></font>" );
        $('#notificacion').show(true);
        
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
                    ,"language": {
                    "sUrl": "js/Spanish.txt"
                    }} );
                                }
                });   
          
                                             }
                                             
    function ir_grilla_transformacion_carro(){
            $.ajax({
            type: "POST",
            url: ruta_grillas+'grilla_transformacion_carro.jsp',
            data:({fecha_puesta:$('#fecha_puesta').val()}),
             beforeSend: function() {
            
                                },           
            success: function (res) {
           $("#contenido_grilla_transformacion_carro").html(res);
             $('#example').DataTable( {
                    "scrollX": true,
                    "pageLength": 100,
                    "language": {
              "sUrl": "js/Spanish.txt"
                }
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
                    "pageLength": 100,
                "language": {
              "sUrl": "js/Spanish.txt"
                }} );
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
                    "pageLength": 100,
                "language": {
              "sUrl": "js/Spanish.txt"
                }} );
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
 
    function liberar_retenidos_mensaje(cod_carrito,cod_lote,disposicion,cod_interno,tipo_registro){
        var html="";
      
        if(disposicion=='7'||disposicion=='6'){
         html="<form> <a>INGRESE EL RESPONSABLE</a>\n\
                <input type='text' class='form-control ' id='res' placeholder='RESPONSABLE' required/> \n\
                <br> <a>FECHA DE ALIMENTACION</a> \n\
                <input type='date' style='font-weight: bold;' min='2020-11-20' max='2030-12-25' id='cal' name='cal' placeholder='INGRESE FECHA' class='form-control '  required/><br><br>\n\
                <input type='submit'  value='REGISTRAR' class='form-control bg-success btn"+cod_interno+"'>\n\
                </form>";  
            
            
            }
        else {
          html="<form> <a>INGRESE EL RESPONSABLE</a> \n\
                <input type='text' class='form-control fu' id='res' placeholder='RESPONSABLE' required/>\n\
                <br><br> \n\
                <input type='hidden' value='' id='cal' ><input type='submit' value='REGISTRAR' class='form-control btn"+cod_interno+"'>\n\
                </form>"; 
            }
         Swal.fire({
            title: 'LIBERACION DE LOTE NRO.'+cod_carrito,
            type: 'warning',
            html: html,
            showCancelButton: false,
            showConfirmButton: false
                    });
        cargar_estilo_calendario();
      $(document).on('click','.btn'+cod_interno,function(){
            control_retenidos_pendientes(cod_lote,$('#res').val(),$('#cal').val(),disposicion,cod_interno,tipo_registro);
        });  
       
    }
    
   
  
  
    function control_retenidos_pendientes(cod_lote,responsable,calendario,disposicion,cod_interno,tipo_registro) {
        $('form').submit(function(evt){
        evt.preventDefault();// to stop form submitting
            $.ajax({
                type: "POST",
                url: ruta_controles+'control_movimientos.jsp',
                data: ({id_carro:cod_lote+"-"+cod_interno+"-"+tipo_registro+"-"+disposicion,responsable:responsable,fecha_alimentacion:calendario,estado_requerido:'L'}),//estado_requerido= LIBERADO O RETENIDO O RETENIDO CON REPORTE.
                beforeSend: function() {
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
                        }); 
                     },           
                success: function (res) 
                {
                 if(res.tipo_mensaje=="1"){
                        swal.fire({
                           type: 'success',
                           title: res.mensaje,
                           confirmButtonText: "CERRAR"
                       });
                    $(this).addClass('selected');
                    var table = $('#grilla_lotes_liberacion').DataTable();
                    table.row('#'+cod_interno).remove().draw( false );
                    $("#grilla_lotes_liberacion").dataTable().fnDestroy();
                    $('#grilla_lotes_liberacion').DataTable( {  "scrollX": true,     "paging":   false, "ordering": false, "info":     true,"language": {
              "sUrl": "js/Spanish.txt"
                } } );
                    }
                    else   {
                          swal.fire({
                             type: 'error',
                             title: res.mensaje,
                             confirmButtonText: "CERRAR"
                         });
                     }
                    } 
                        }); 
              evt.stoppropagation();
            });
            
         }
                       
    function registro_transformacion_ptc(id,nro_carro,tipo,cantidad,fecha_puesta,itemcode_origen,area_cch){
      var option,url;
      if(tipo=="N"){
        url=ruta_controles+"control_transformacion_ptc.jsp";
        option="<select style='font-weight: bold;' class='form-control' name='tipo_huevo' id='tipo_huevo'> <OPTION value='A'>TIPO A</OPTION> <OPTION value='B'>TIPO B</OPTION>   <OPTION value='C'>TIPO C</OPTION> <OPTION value='D'>TIPO 4TA</OPTION> <OPTION value='S'>TIPO SUPER</OPTION> <OPTION value='J'>TIPO JUMBO</OPTION> <OPTION value='G'>TIPO G</OPTION></select>";
      }
      else {
        option="<select style='font-weight: bold;' class='form-control' name='tipo_huevo' id='tipo_huevo'> <OPTION value='4'>TIPO A</OPTION> <OPTION value='5'>TIPO B</OPTION>   <OPTION value='6'>TIPO C</OPTION> <OPTION value='7'>TIPO 4TA</OPTION> <OPTION value='3'>TIPO SUPER</OPTION> <OPTION value='2'>TIPO JUMBO</OPTION> <OPTION value='1'>TIPO G</OPTION><OPTION value='8'>TIPO SUBPRODUCTO</OPTION></select>";
        url="http://192.168.6.162/ws/control_transformar_ptc.aspx"; 
       }
       
         Swal.fire({
            title: 'TRANSFORMACION DE TIPO DE HUEVO',
            type: 'warning',
            html: " <a><strong>PTC NRO "+nro_carro+"</strong> </a><br><br><a>SELECCIONE EL TIPO DE HUEVO</a> "+option,
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'REGISTRAR',
                cancelButtonText: 'CANCELAR'
        }).then((result) => {
            if (result.value) {
      
        $.ajax({
        type: "POST",
        url: url,
        data: ({ cod_interno: id,fecha_puesta:fecha_puesta,cantidad:cantidad,itemcode:$('#tipo_huevo').val(),itemcode_origen:itemcode_origen,clasificadora:area_cch}),
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
                  }
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
                        aviso_transformacion_PTC(data.tipo,data.mensaje);
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
                traer_menu();
        }
      else 
        {
              swal.fire({
              type: 'error',
              html: mensaje,
              confirmButtonText: "CERRAR" });    
        }
  }
    
    function aviso_transformacion_PTC(tipo,mensaje){
      if(tipo==0)
        {
              swal.fire({
              type: 'success',
              title: "TRANSFORMACION REALIZADA CON EXITO.",
              confirmButtonText: "CERRAR" });  
              ir_grilla_transformacion_carro();
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
 
    function cargar_toggles() 
    {
        $('#chkToggle2').change(function () 
        {
            if ($(this).prop("checked") == true) 
            {
                $('#codigo_borroso').val('SI');
            }
            else 
            {
                $('#codigo_borroso').val('NO');
            }
        });
    
        $('#chkToggle_especial').change(function () 
        {
            if ($(this).prop("checked") == true) 
            {
                $('#codigo_especial').val('SI');
            }
            else 
            {
                $('#codigo_especial').val('NO');
            }
        });
     
        $('#chkToggle_cepillado').change(function () 
        {  
            if ($(this).prop("checked") == true) 
            {
                $('#codigo_cepillado').val('SI');
            }
            else 
            {
                $('#codigo_cepillado').val('NO');
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
                 $('#grilla_eliminar').DataTable({ "language": {
              "sUrl": "js/Spanish.txt"
        }});
    });  } 
    
    function traer_detalle_fecha_involucrada(fecha){
        $.get(ruta_grillas+'grilla_fecha_involucrada.jsp',{fecha:fecha},function(res){
        $("#div_id_involucrada").html(res);
        $('#grilla_involucrada').DataTable({"language": {
              "sUrl": "js/Spanish.txt"
                }});
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
 
    function buscar_lotes_movimientos()
    {
        if($("#desde").val()==""||$("#hasta").val() == ""||$("#calendario_retenido").val() == "") 
        {
            alert("ERROR COMPLETAR DATOS"); 
        }
        else 
        {
         var estado= $("#estado_requerido").val();
            if (estado==="R"||estado==="Z"){
           $("#estado_liberacion").prop('required', 'required');
           $("#motivo_retencion").prop('required', 'required');
           $("#disposicion").prop('required', 'required');
           $('#liberado_por').removeAttr('required');
           
            
            $("#combo_retenido").show();
            $("#liberado_por").hide();
        }
        else if (estado==="L"){
            $("#liberado_por").show();
            $("#liberado_por").prop('required', 'required');
            $('#motivo_retencion').removeAttr('required')
            $('#motivo_retencion').removeAttr('required')
            $('#disposicion').removeAttr('required')
            $("#combo_retenido").hide();
            }
        
        $('#tabla_lotes').DataTable ({//INICIO
	"scrollX": true,
        "bPaginate": false,
         "language": {
              "sUrl": "js/Spanish.txt" }, 
        
        "ajax": 
        {
            "url": ruta_grillas+'grilla_lotes_movimiento.jsp',
            "data": 
            {   "fecha_retenido": $("#calendario_retenido").val(), "inicio_retenido":$("#desde").val(), "fin_retenido":$("#hasta").val(),
                "combo_estado_retenido":$("#estado_requerido").val(), "tipo":$("#tipo").val()
            }   
        },  
        "destroy": true,
        'columnDefs': 
        [
            {
                'targets': 0,
                'checkboxes': 
                {
                    'selectRow': true
                } ,
                'render': function (data, type, full, meta)
                {
                return '<input type="checkbox" value="'+data+'" class="dt-checkboxes" autocomplete="off">';
                } 
            },
            
            {
               className: "ocultar", "targets": [ 1,2,6,7,8 ]
               
            }  
        ],  
        'select': 
        {
            'style': 'multi'
        },
        'order': [[1, 'asc']],
        "rowCallback": function( row, data, index ) 
        {
            if ( data[5] == "L" )
            {
                $('td', row).css('background-color', 'Green');
            }
        
            else if(data[5] == "R.")
            {
                $('td', row).css('background-color', 'cyan');
            }
            else
            {
                $('td', row).css('background-color', 'red');
            }
        },
        "initComplete":function( settings, json){ //FUNCION QUE SE EJECUTA DESPUES DE CARGAR EL DATATABLE.
          $('.ocultar').hide();
            // call your function here
        } });//FIN
        }
        
     }
   
    function get_checkbox_selected_movimientos() 
    {  $('#frm_movimiento').on('submit', function(e){
        e.preventDefault();
        //Reference the Table.
        var grid = document.getElementById("tabla_lotes");
        //Reference the CheckBoxes in Table.
        var checkBoxes = grid.getElementsByClassName("dt-checkboxes");
        var grilla_chequeada = "";
        //Loop through the CheckBoxes.
         var c=0;
          
        for (var i = 0; i < checkBoxes.length; i++) 
        { 
            var row = checkBoxes[i].parentNode.parentNode;
          
            
            
                if (checkBoxes[i].checked) 
                {
                    
                    if (c==0)
                    {
                    /*   if(row.cells[6].innerHTML==="Tipo"){
                    }
                        
                    else 
                                 
                    {    */                          
                            grilla_chequeada +=row.cells[2].innerHTML;
                            grilla_chequeada += "-" + row.cells[1].innerHTML;
                            grilla_chequeada += "-" + row.cells[6].innerHTML;
                            grilla_chequeada += "-" + row.cells[7].innerHTML;  
                            c++;      
                    //  } 
                     }
                    else 
                    {
                         
                        grilla_chequeada += ",";
                        grilla_chequeada +=row.cells[2].innerHTML;
                        grilla_chequeada += "-" + row.cells[1].innerHTML;
                        grilla_chequeada += "-" + row.cells[6].innerHTML;
                        grilla_chequeada += "-" + row.cells[7].innerHTML;
                         c++;  
                    }
                 
                } 
                  
                } 
         
        //Display selected Row data in Alert Box.
        
       
      if (grilla_chequeada.length==0){
           Swal.fire({
                    type: 'error',
                    title: 'ATENCION!',
                    html: "DEBE SELECCIONAR ALGUN LOTE." });   
      }
      
      else {
          // alert(grilla_chequeada);
        Swal.fire({
            title: 'DESEAR PROCESAR EL CAMBIO DE LIBERACION?',
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'ACEPTAR!',
            cancelButtonText: 'CANCELAR!'
            }).then((result) => {
        if (result.value) {
            
                $.ajax({
        type: "POST",
       
        url: ruta_controles+"control_movimientos.jsp",
        data: ({    id_carro:           grilla_chequeada,               estado_requerido:   $("#estado_requerido").val(),
                    disposicion:        $("#disposicion").val(),        estado_liberacion:  $("#estado_liberacion").val(),
                    motivo_retencion:   $('#motivo_retencion option:selected').toArray().map(item => item.text).join()   ,   
                    responsable:        $("#liberado_por").val()}),
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
                if(data.tipo_mensaje=="1"){
                Swal.fire({
                    type: 'success',
                    title: 'ATENCION!',
                    text: data.mensaje
                    }); 
  			traer_menu();
                }
                else 
                {
                Swal.fire({
                    type: 'error',
                    title: 'ATENCION!',
                    html: data.mensaje });    
                }
                
            }   });
                             }
                                }); 
        } 
      
      e.stopPropagation();
           }); 
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

   
    function ir_reporte_excel_ptc(){
        
         $(document).on('click','.btn_buscar_excel',function(){
          
         $('#form_excel').on('submit', function(e){
            e.preventDefault();
           
     
        $.get(ruta_grillas+'grilla_ptc_excel.jsp',{calendario_informe:$('#calendario_ptc_excel').val(),estado:$('#estado').val()},
        function(res){
             
      
        $("#ptc_excel").html(res);  
        
  
    var texto;
    if($('#estado').val()=='E'){
        texto="FORMULARIO REGISTROS ELIMINADOS DE HUEVOS CLASIFICADOS FRESCOS Y LAVADOS FECHA DE PUESTA"
        
    }
    else {
        texto="FORMULARIO HUEVOS CLASIFICADOS FRESCOS Y LAVADOS FECHA DE PUESTA"

    }
    
     $('#example tfoot th').each( function (i) {
        var title = $('#example thead th').eq( $(this).index() ).text();
        $(this).html( '<input type="text" placeholder="'+title+'" data-index="'+i+'" />' );
    } );
  
    // DataTable
    var table = $('#example').DataTable( {
        scrollY:        "500px",
        scrollX:        true,
        dom: 'Bfrtip',
        "pageLength": 100,
       
            "language": {
                "sSearch":         "Buscar:",
                "sLengthMenu":     "Mostrar _MENU_ registros",
                "sZeroRecords":    "No se encontraron resultados",
                "sEmptyTable":     "Ningún dato disponible en esta tabla",
                "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
                "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
                "sInfoThousands":  ",",
                "sLoadingRecords": "Cargando...",
            "oPaginate": {
                            "sFirst":    "Primero",
                            "sLast":     "Último",
                            "sNext":     "Siguiente",
                            "sPrevious": "Anterior"
                        }, 
             //  "sUrl": "js/Spanish.txt" ,
               buttons: {
                copyTitle: 'DATOS COPIADOS',
                copySuccess: {
                    _: '%d FILAS COPIADAS' 
                }
            }  
        },
         buttons: [
            {
                extend: 'copyHtml5',
                text: 'COPIAR GRILLA',
                exportOptions: {
                columns: [ 0, ':visible' ]
                    }
            },
            {
                extend: 'excelHtml5',
                title:texto+$('#calendario_ptc_excel').val(),                
                text: 'EXCEL',
                     
            
                exportOptions: {
                    columns: ':visible'
                }
            },
            {
                extend: 'pdfHtml5',
                text: 'PDF',
                title:texto + '\n' + 
                '        FECHA DE PUESTA:'+$('#calendario_ptc_excel').val(),
                orientation: 'landscape',
                pageSize: 'LEGAL',
                customize: function(doc) {
                  
                    doc.styles.title = {
                      color: 'white',
                      fontSize: '20',
                      background: 'black',
                      alignment: 'center'
                      
                    }
                    doc.styles.tableHeader = {
                       fontSize: '6'
                    }
                    doc.styles.tableBodyEven = {
                      fontSize: '6'
                    }
                    doc.styles.tableBodyOdd = {
                       fontSize: '6'
                    }
                   doc.styles.tableFooter = {
                       fontSize: '6'
                    }
                   doc.styles['td:nth-child(2)'] = { 
                      width: '100px',
                      'max-width': '100px'
                    }
                  }   ,
                  
                  
                exportOptions: {
                    columns: ':visible'
                 }
            },
            'colvis'
        ], keys: {
        clipboard: false
    }}) ;
 
    // Filter event handler
    $( table.table().container() ).on( 'keyup', 'tfoot input', function () {
        table
            .column( $(this).data('index') )
            .search( this.value )
            .draw();
    } );
    
    
 /*
  var table=   $('#tabla_ptc_lotes_excel').DataTable ({//INICIO
	"scrollX": true,
        "bPaginate": false,
          dom: 'Bfrtip',
          orderCellsTop: true,
        fixedHeader: true,
        "destroy": true,
        "language": {
              "sUrl": "js/Spanish.txt",
                buttons: {
                copyTitle: 'DATOS COPIADOS',
                copySuccess: {
                    _: '%d FILAS COPIADAS' 
                }
            }
        }, buttons: [
            {
                extend: 'copyHtml5',
                text: 'COPIAR GRILLA',
                exportOptions: {
                    columns: [ 0, ':visible' ]
                    }
            },
            {
                extend: 'excelHtml5',
                title:texto+$('#calendario_ptc_excel').val(),                text: 'EXCEL',
                     
            
                exportOptions: {
                    columns: ':visible'
                }
            },
            {
                extend: 'pdfHtml5',
                text: 'PDF',
                title:texto + '\n' + 
                      '        FECHA DE PUESTA:'+$('#calendario_ptc_excel').val(),
                html:'HOLA MUNDO',
                orientation: 'landscape',
                pageSize: 'LEGAL',
                customize: function(doc) {
                  
                    doc.styles.title = {
                      color: 'white',
                      fontSize: '20',
                      background: 'black',
                      alignment: 'center'
                      
                    }
                    doc.styles.tableHeader = {
                       fontSize: '6'
                    }
                    doc.styles.tableBodyEven = {
                      fontSize: '6'
                    }
                    doc.styles.tableBodyOdd = {
                       fontSize: '6'
                    }
                   doc.styles.tableFooter = {
                       fontSize: '6'
                    }
                   doc.styles['td:nth-child(2)'] = { 
                      width: '100px',
                      'max-width': '100px'
                    }
                  }   ,
                  
                  
                exportOptions: {
                    columns: ':visible'
                 }
            },
            'colvis'
        ], keys: {
        clipboard: false
    }}); 
        */
      
        }); 
        
        e.stopimmediatepropagation();
           }); }); 
     }
    
    function exportar_excel_ptc(elem) {
        var table =document.getElementById("mobiles"); 
        var html = table.outerHTML;
        var url = 'data:application/vnd.ms-excel,' + escape(html); // Set your html table into url 
        elem.setAttribute("href", url);
        elem.setAttribute("download", "REPORTE PTC.xls"); // Choose the file name
        return false;
    }
    
    function registrar_fecha_involucradas(){
       
     $.ajax({                        
           type: "POST",                 
           url: ruta_controles+'control_correccion.jsp',                    
           data: $("#formulario_correccion").serialize(),
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
            
            success: function(data)            
           {
           if(data.tipo_respuesta==1){
               Swal.fire({
                    type: 'success',
                    title: 'ATENCION!',
                    text: data.mensaje
                    }); 
                 $('#cuadro1').modal('toggle');
                 
            }
           else {
               Swal.fire({
                    type: 'error',
                    title: 'ATENCION!',
                    text: data.mensaje
                    }); 
           }
            
           }
                });
        }
        
function remover_required_reporte_ptc(){
 $('#cbox_estado').removeAttr('required');
 $('#calendario_reporte_carros').removeAttr('required') ;
 $('#calendario_reporte_clasificacion').removeAttr('required') ;
 $('#cbox_estado').removeAttr('required') ;
 $('#tipo_huevo').removeAttr('required') ;
 $('#desde').removeAttr('required');
 $('#hasta').removeAttr('required');
 $('#hasta').removeAttr('required');
 $("#txt_fecha_involucrada_rep").prop('required',true);
  }
  
  
  function add_required_reporte_ptc(){
   $('#cuadro1').modal('toggle');
   $('#txt_fecha_involucrada_rep').val("");
   
  $("#cbox_estado").prop('required',true);
 $("#calendario_reporte_carros").prop('required',true);
 $("#calendario_reporte_clasificacion").prop('required',true);
 $("#cbox_estado").prop('required',true);
 $("#tipo_huevo").prop('required',true);
 $("#desde").prop('required',true);
 $("#hasta").prop('required',true);
 $('#txt_fecha_involucrada_rep').removeAttr('required');
   }