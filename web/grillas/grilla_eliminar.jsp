 <%@ page language="java" import="java.sql.*" errorPage="error.jsp" %>
<%@include  file="../chequearsesion.jsp" %>
<%    String usuario = (String) sesionOk.getAttribute("usuario");
String clasificadora = (String) sesionOk.getAttribute("clasificadora");
String user_name = (String) sesionOk.getAttribute("nombre_usuario");
   String calendario= request.getParameter("fecha");
  %>
<%@ page language="java" import="java.sql.*" errorPage="error.jsp" %>
 <jsp:useBean id="conexion" class="clases.bdconexion1" scope="page" />
 <jsp:useBean id="fuente" class="clases.fuentedato" scope="page"/>
 
 <form method="post" id="formulario_eliminar">
                 <table id="grilla_eliminar" class="table table-striped table-bordered" style="width:100%">

          <thead>
                   
               
                <th  >
                  Nro carro
                </th>
                <th  >
                  Fecha de puesta
                </th>
                 <th >
                 Tipo Huevo
                 </th>
                 <th>
                 Cantidad
                 </th>
                  <th>
                  ACCION
                </th>   
              </thead>
              <tbody id="grilla_eliminar">
                  <%
                      Connection cn = conexion.crearConexion();
	// Asignar conexion al objeto manejador de datos
	fuente.setConexion(cn);
      ResultSet rs = fuente.obtenerDato(" exec [select_eliminar_lotes_ptc] @fecha='"+calendario+"',@area='"+clasificadora+"'");
       
    String tipohuevo="";
              
             
     while(rs.next()){
      
if(rs.getString("tipo_huevo").equals("G"))
{
    tipohuevo="Gigante";
}
if(rs.getString("tipo_huevo").equals("J"))
{
    tipohuevo="Jumbo";
}
if(rs.getString("tipo_huevo").equals("S"))
{
    tipohuevo="Super";
}
if(rs.getString("tipo_huevo").equals("A"))
{
    tipohuevo="A";
}
if(rs.getString("tipo_huevo").equals("B"))
{
    tipohuevo="B";
}
if(rs.getString("tipo_huevo").equals("C"))
{
    tipohuevo="C";
}
if(rs.getString("tipo_huevo").equals("7"))
{
    tipohuevo="4TA";
}

else {
tipohuevo=rs.getString("tipo_huevo");
}
 

 %>  
    
     
    <tr id="<%=rs.getString("cod_lote")%>">  
        
        <td id="nro_carro"> <b><%=rs.getString("cod_carrito")%>  </b></td>
       <td id="fecha_puesta"> <b><%=rs.getString("Fecha_eliminar")%></b></td>
       <td id="tipo_huevo"> <b><%=tipohuevo%></b></td> 
       <td id="cantidad"> <b><%=rs.getString("cantidad")%></b></td>
             <td>
            

                 <input type="button" id="<%=rs.getString("cod_lote")%>" onclick="  var cod_lote='<%=rs.getString("cod_lote")%>' ; $('#text_id_eliminar').val(cod_lote); 
   
    
      Swal.fire({
           title: '¿Seguro que deseas ELIMINAR el registro?',
  text: 'Eliminar carro Nº <%=rs.getString("cod_carrito")%> ' ,
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
           confirmButtonText: 'SI, ELIMINAR!',
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
           traer_control_eliminar('<%=rs.getString("cod_interno")%>','<%=rs.getString("cod_lote")%>');
         
        }
        });  
     
     //   
   
  
    
    
    
    
    
    
    " class="btn btn-danger " value="Eliminar">
                                </td>  
                <%}%>   </tr> </tbody>   
         </table>   
       </form>
        
              
            
               
               
     
 
    
           
           
  
 
 

        
        
      
      
        
 

        
        
        
        
        
      