<%-- 
    Document   : control_editar_comentario
    Created on : 22/05/2019, 10:38:11 AM
    Author     : hvelazquez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.*"%>
<%@include  file="../chequearsesion.jsp" %>
<jsp:useBean id="conexion" class="clases.bdconexion1" scope="page" />
<jsp:useBean id="fuente" class="clases.fuentedato" scope="page"/>
   
    
    
     
    <body>
        <%
            
     Connection cn = conexion.crearConexion();
     // Asignar conexion al objeto manejador de datos
     fuente.setConexion(cn);   
        
    String cod_lote= request.getParameter("lote") ;
    String comentario= request.getParameter("comentario") ;
    String liberado_por= request.getParameter("liberado_por") ;
        PreparedStatement ps2 = cn.prepareStatement("update  lotes set comentario='"+comentario+"',liberado_por='"+liberado_por+"' where cod_lote='"+cod_lote+"'");
        ps2.executeUpdate(); 
                     
   
        
       %>
          <script>
              
               swal({   
		title: "Registrado!!!" ,   
		text: "",   
		timer: 2000,   
               
		showConfirmButton: false
          
	}
               ); 
       
       principal($('#calendario_informe').val(),$('#estado').val(),$('#tipo_huevo').val());
       //traer_informe();
           </script>
    </body>
</html>
