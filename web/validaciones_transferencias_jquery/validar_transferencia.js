
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