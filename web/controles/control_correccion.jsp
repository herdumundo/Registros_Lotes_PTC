  <%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<jsp:useBean id="conexion" class="clases.bdconexion1" scope="page" />
<jsp:useBean id="fuente" class="clases.fuentedato" scope="page"/>
<%@include  file="../chequearsesion.jsp" %>
<%Connection cn = conexion.crearConexion();
     // Asignar conexion al objeto manejador de datos
     fuente.setConexion(cn);
  
         // Crear objeto de conexion al DB     
     String cod_lote            = request.getParameter("txt_cod_lote");
     String usuario             = (String) sesionOk.getAttribute("usuario");
     String clasificadora       = (String) sesionOk.getAttribute("clasificadora");
     String cantidad_huevos     = request.getParameter("cantidad_huevos");
     String fecha_involucrada   = request.getParameter("fecha_involucrada");
                 
    PreparedStatement ps = cn.prepareStatement("  insert into correccion_lotes "
            + "(fecha_involucrada,fecha,cantidad,cod_lote,usuario,clasificadora) values "
            + "(convert(date,'"+fecha_involucrada+"'),CURRENT_TIMESTAMP,'"+cantidad_huevos+"','"+cod_lote+"','"+usuario+"','"+clasificadora+"')");
    ps.executeUpdate(); 
  
       %> 
  <script>
                swal.fire({ 
                    type:"success",
		title: "REGISTRADO.",
		text: "",   
		timer: 2000,   
                showConfirmButton: false
                      }
                    );  
        limpiar_datos();
                     </script>
     
   
   
   
 
          
          
          
          
          
         
