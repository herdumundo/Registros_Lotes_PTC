 
 
 
 
 
function boton_animacion_eliminar() {
	swal({   
		title: "Registro realizado con exito!!",   
		text: "",   
		timer: 1000,   
               
		showConfirmButton: false 
          
	}
                );
             Eliminar_fila_carro_mesa();

} 

function boton_animacion_validacion_carromesa() {
	swal({   
		title: "Error, debe cargar el numero de mesa.",   
		text: "",   
		timer: 1500,   
               
		showConfirmButton: false 
          
	}
                );
             

} 







function mensaje_error() {
	         swal.fire({
            type: 'error',
            title: "CARGAR DATOS ",
            confirmButtonText: "CERRAR"
        });
} 

 

