  var ruta_contenedores="./contenedores/";
  var ruta_controles="./controles/";
  var ruta_grillas="./grillas/";
  var ruta_consultas="./consultas/";
  
function cargar_datos_key_trans() {
        if (event.keyCode == 13 || event.which == 13) {
            consulta_lotes ($('#txt_lote').val());
        }
}


function cargar_datos_key_trans_procesar() 
{
        if (event.keyCode == 13 || event.which == 13) 
        {
            consulta_lotes_procesar ($('#txt_lote').val());
        }
}

function consulta_lotes(id) {
     try {
         $.ajax({
             type: "POST",
            url: ruta_consultas+'transferencia_select_almacenamiento.jsp',
            data: ({ id: id}),
            beforeSend: function() {
               $('#div_cargar').show();
                       },           
            success: function (data) {
               $('#div_cargar').hide();
           $.each(data,function(i, item)
           {  
               if(item.estado==="0"){
                        aviso_existencia(item.nro_carrito);
               }
               else {
                   //alert(item.nro_carrito);
                  cargar_grilla_trans(item.item_codigo,item.nro_carrito,item.cod_lote,item.cantidad,item.fecha_puesta,item.estado,item.id,item.motivo,item.estado_costeo);   
               }
            }    );
               $('#txt_lote').val('');
              //  return data;
             } 
        });
   }
    catch (error) {
        aviso_error();

    }
}




function consulta_lotes_procesar(id) {
       
     try {
         $.ajax({
             type: "POST",
            url: ruta_consultas+'transferencia_select_procesar.jsp',
            data: ({ id: id}),
           // dataType: "html",
            beforeSend: function() {
    $('#div_cargar').show();
            },
            success: function (data) {
               $('#div_cargar').hide();
           $.each(data,function(i, item)
           {  
               if(item.estado==="0"){
                   
                        aviso_existencia(item.nro_carrito);
               }
               else {
                  // alert(item.nro_carrito);
                  cargar_grilla_trans(item.item_codigo,item.nro_carrito,item.cod_lote,item.cantidad,item.fecha_puesta,item.estado,item.id,item.motivo,item.estado_costeo);   

               
               }
            }    );
              
                
                //alert(data.cod_lote);
               $('#txt_lote').val('');
              //  return data;
             },
             timeout:10000,
            error: function () {
                aviso_error_conexion();
            }
        });
   }
    catch (error) {
        aviso_error();

    }
}


function cargar_grilla_trans(item_codigo,nro_carrito,cod_lote,cantidad,fecha_puesta,estado,id,motivo,estado_costeo) {
  
   if (checkId(id)) {
        return aviso_duplicado();
    }  


    $('#grilla_transfer tbody').append('<tr class="suma" id="row' +id + '" > '+
            '<td  class="ocultar" for="id"><b>' + id + '</b></td> '+
            '<td class="ocultar"><b>' + cod_lote +'</b></td>'+
            '<td><b>' +nro_carrito + '</b></td>'+
            '<td><b>' + cantidad+ '</b></td>'+
            '<td><b>' + item_codigo + '</b></td>'+
            '<td><b>' + fecha_puesta + '</b></td>'+
            '<td><b>' +estado +'</b></td>'+
            '<td><b>'+motivo +'</b></td>'+
            '<td><input type="button" value="ELIMINAR" name="remove" id="' + id + '" class="btn btn-danger btn_remove"></td> '+
            '<td><b>' + estado_costeo + '</b></td></tr>');
            calcular_tipos_grilla();
            $(".ocultar").hide();
} 


function checkId(id) {
    let ids = document.querySelectorAll('#grilla_transfer td[for="id"]');

    return [].filter.call(ids, td => td.textContent === id).length === 1;
}
function aviso_duplicado() {
 

    swal.fire({
        type: 'error',
        title: "CARRO DUPLICADO",
        confirmButtonText: "CERRAR"
    });


} 

function aviso_existencia(nro_carro) {
 

    swal.fire({
        type: 'error',
        title: "CARRO NO EXISTE, "+ nro_carro,
        confirmButtonText: "CERRAR"
    });


} 

$(document).on('click', '.btn_remove', function () {
    var button_id = $(this).attr("id");
    //cuando da click obtenemos el id del boton
    $('#row' + button_id + '').remove(); //borra la fila
    //limpia el para que vuelva a contar las filas de la tabla
    $("#adicionados").text("");
    var nFilas = $("#grilla_transfer tr").length;
    $("#adicionados").append(nFilas - 1);
    calcular_tipos_grilla();
    // obtener_fila();     
});




function enviar_datos_transferencia(tipo_transferencia){
    
    var filas = document.querySelectorAll("#grilla_transfer tbody tr");
    var cod_lote;
    var id;
    var cod_carrito;
    var estado_liberacion;
    var motivo;
    var estado_costeo;
    var cantidad;
    var tipo;
        
    var c = 0;
    var valores = '';
     // recorremos cada una de las filas
     filas.forEach(function (e) {

        // obtenemos las columnas de cada fila
        var columnas = e.querySelectorAll("td");
      
         // SI C ES 0, ENTONCE NO HACE NADA, POR ALGUNA RAZON LA PRIMERA FILA TOMA COMO UNO, ESTANDO VACIO.
        if(c==0){
                  }
         else {
        id = columnas[0].textContent;
        cod_lote = columnas[1].textContent;  
        cod_carrito = columnas[2].textContent;
        estado_liberacion = columnas[6].textContent;  
        motivo = columnas[7].textContent;  
        cantidad = columnas[3].textContent;  
        tipo = columnas[4].textContent;  
        estado_costeo = columnas[9].textContent;  
        var arr = id + '-' + cod_lote+ '-' + cod_carrito+ '-' + estado_liberacion+'-'+motivo+'-'+estado_costeo+'-'+cantidad+'-'+tipo;
        if (c == 1) {
           
            valores = arr;
 
        }
        else {
            valores = valores + '&' + arr;
                }
         }
      c++;
    });
    
      confirmar_registro_transfer(valores,tipo_transferencia);
     
}


function confirmar_registro_transfer(valor,tipo_transferencia) {
 
    Swal.fire({
           title: 'TRANSFERENCIA DE LOTES',
           text: "DESEA TRANSFERIR LOS LOTES?",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
           confirmButtonText: 'SI, TRANSFERIR!',
           cancelButtonText: 'NO, CANCELAR!'
    }).then((result) => {
        if (result.value) {

       control_transferencia(valor,tipo_transferencia);
      
        }
        });

     
}
 

function control_transferencia(valor,tipo_transferencia){
   var destino = $('#cbox_destino').val();
   var cbox_camion = $('#cbox_camion').val();
   var cbox_chofer = $('#cbox_chofer').val();

      
     
     Swal.fire({
        title: 'PROCESANDO!',
        html: 'ESPERE<strong></strong>...',
        allowOutsideClick: false,
        onBeforeOpen: () => {
            Swal.showLoading()
            timerInterval = setInterval(() => {
                Swal.getContent().querySelector('strong').textContent = Swal.getTimerLeft();
            }, 1000);
        }
    }); 
         $.ajax({
            type: "POST",
            url: ruta_controles+'transferencia_lotes_control.jsp',
            data: ({
                valor: valor,destino:destino,cbox_camion:cbox_camion,cbox_chofer:cbox_chofer,tipo_transferencia:tipo_transferencia}),
             success: function (data) 
            {
                 aviso_registro_transfer(data.tipo,data.mensaje);
                return data;
            } 
        });
}
 
  
function aviso_registro_transfer(tipo,mensaje) {
  //  var resultado = parseInt(resultad_final);
 
    if (tipo == 1) 
    {
 
        swal.fire({
            type: 'success',
            title: mensaje,
            confirmButtonText: "CERRAR"
        });
              ir_transferencia_menu();
    }

    else if (tipo == 3) {

        swal.fire({
            type: 'error',
            title: mensaje,
            confirmButtonText: "CERRAR"
        });
     //   traer_embarque();

    }

   
    else
    {
        swal.fire
            ({
            type: 'error',
            title: mensaje,
            confirmButtonText: "CERRAR"
            });
     }






}
 
function calcular_tipos_grilla(){
     // obtenemos todas las filas del tbody
    var filas = document.querySelectorAll("#grilla_transfer tbody tr");
    var total_tipoCC = 0;
    var total_tipoCA = 0;
    var total_tipoCB = 0;
    var total_tipoCD = 0;
    var total_tipoCS = 0;
    var total_tipoCG = 0;
    var total_tipoCJ = 0;
    // recorremos cada una de las filas
    $('#tipo_ca').val('0');
    $('#tipo_cb').val('0');
    $('#tipo_cc').val('0');
    $('#tipo_cd').val('0');
    $('#tipo_cs').val('0');
    $('#tipo_cj').val('0');
    $('#tipo_cg').val('0');
 var c=0;
    filas.forEach(function (e) {
       
        if(c>0){
        // obtenemos las columnas de cada fila
        var columnas = e.querySelectorAll("td");
        // obtenemos los valores de la cantidad y importe
        var cantidad_tipoCC = parseFloat(columnas[3].textContent);
        var cantidad_tipoCA = parseFloat(columnas[3].textContent);
        var cantidad_tipoCB = parseFloat(columnas[3].textContent);
        var cantidad_tipoCD = parseFloat(columnas[3].textContent);
        var cantidad_tipoCS = parseFloat(columnas[3].textContent);
        var cantidad_tipoCJ = parseFloat(columnas[3].textContent);
        var cantidad_tipoCG = parseFloat(columnas[3].textContent); 
        var tipo_carro =  columnas[4].textContent;
         
         //alert(tipo_carro);
 
        if (tipo_carro == 'G' && cantidad_tipoCG=="2160") {
            total_tipoCG += cantidad_tipoCG;
            $('#tipo_cg').val(parseInt(total_tipoCG) / 2160);

        }

        if (tipo_carro == 'J' && cantidad_tipoCJ == "4320") {
            total_tipoCJ += cantidad_tipoCJ;
            $('#tipo_cj').val(parseInt(total_tipoCJ) / 4320);

        }
        if (tipo_carro == 'S' && cantidad_tipoCS == "4320") {
            total_tipoCS += cantidad_tipoCS;
            $('#tipo_cs').val(parseInt(total_tipoCS) / 4320);

        }
        if (tipo_carro == 'A' && cantidad_tipoCA == "4320") {
            total_tipoCA += cantidad_tipoCA;
            $('#tipo_ca').val(parseInt(total_tipoCA) / 4320);

        }
        if (tipo_carro == 'B' && cantidad_tipoCB == "4320") {
            total_tipoCB += cantidad_tipoCB;
            $('#tipo_cb').val(parseInt(total_tipoCB) / 4320);

        }
        if (tipo_carro == 'C' && cantidad_tipoCC == "4320") {

            total_tipoCC += cantidad_tipoCC;
            $('#tipo_cc').val(parseInt(total_tipoCC) / 4320);

        }
        if (tipo_carro == 'D' && cantidad_tipoCD == "4320") {
            total_tipoCD += cantidad_tipoCD;

            $('#tipo_cd').val(parseInt(total_tipoCD) / 4320);
        } }
    c++;
    });
}



function validar_transferencia_almacenamiento(){
    
 var cbox_camion=$('#cbox_camion').val();   
 var cbox_destino=$('#cbox_destino').val();   
 var cbox_chofer=$('#cbox_chofer').val();   
 var x = document.getElementById("grilla_transfer").rows.length;

  if(cbox_camion=="-" ||cbox_destino=="-"||cbox_chofer=="-"|| x=="2") {
      
      swal.fire({
            type: 'error',
            title: "ERROR COMPLETAR DATOS ",
            confirmButtonText: "CERRAR"
                        });
        
  } 
  else {
      
     enviar_datos_transferencia('A');    
  }
 
    
}

function validar_transferencia_procesar(){
    
 var cbox_camion=$('#cbox_camion').val();   
 var cbox_destino=$('#cbox_destino').val();   
 var cbox_chofer=$('#cbox_chofer').val();   
 var x = document.getElementById("grilla_transfer").rows.length;

  if(cbox_camion=="-" ||cbox_destino=="-"||cbox_chofer=="-"|| x=="2") {
      
      swal.fire({
            type: 'error',
            title: "ERROR COMPLETAR DATOS ",
            confirmButtonText: "CERRAR"
                        });
        
  } 
  else {
      
     enviar_datos_transferencia('P');    
  }    
}