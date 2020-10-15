 function 
 filtro_eliminar(){
                    $("#buscar_eliminar").on("keyup", function() {
                    var value = $(this).val().toLowerCase();
                     $("#grilla_eliminar tr").filter(function() {
                     $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                        });
                       });
                      };
                      
     
         function traer_detalle_eliminar(fecha)
         {
               $.get('grilla_eliminar.jsp',{fecha:fecha},function(res){
                    $("#id_div").html(res);
                 $('#grilla_eliminar').DataTable();
    });  } 

     function traer_detalle_fecha_involucrada(fecha){
               $.get('grilla_fecha_involucrada.jsp',{fecha:fecha},function(res){
                    $("#div_id_involucrada").html(res);
                     $('#grilla_involucrada').DataTable();
    });  } 

         function visible_div_eliminar(){
             var elemento = document.getElementById("div_eliminar");
             elemento.style.display = 'block';
    
}

        
        