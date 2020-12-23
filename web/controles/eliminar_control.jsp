<%-- 
    Document   : Delete
    Created on : 02/02/2018, 03:34:00 PM
    Author     : Joel
--%>

<%@page import="clases.variables"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.*"%>
<%@include  file="../chequearsesion.jsp" %>
<jsp:useBean id="conexion" class="clases.bdconexion1" scope="page" />
<jsp:useBean id="fuente" class="clases.fuentedato" scope="page"/>
   
    
    
     
    <body>
        <%
    int res_out=1;
    Connection cn = conexion.crearConexion();
     // Asignar conexion al objeto manejador de datos
    fuente.setConexion(cn);   
               
        int id= Integer.valueOf(request.getParameter("id")) ; 
        String cod_lote= request.getParameter("cod_lote") ;
        String usuario                     = (String) sesionOk.getAttribute("usuario");

    CallableStatement  callableStatement=null;   
    callableStatement = cn.prepareCall("{call [mae_cch_pa_eliminar_lotes](?,?,?,?)}");
    callableStatement .setInt(1,  id );
    callableStatement .setString(2,  cod_lote );
    callableStatement .setString(3,  usuario );
    callableStatement.registerOutParameter("mensaje", java.sql.Types.INTEGER);
    callableStatement.execute();
    res_out = callableStatement.getInt("mensaje");
        
       
       %>
          
    </body>
</html>
