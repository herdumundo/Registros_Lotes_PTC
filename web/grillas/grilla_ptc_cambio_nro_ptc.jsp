
 <%@ page language="java" import="java.sql.*" errorPage="error.jsp" %>
<jsp:useBean id="conexion" class="clases.bdconexion1" scope="page" />
<jsp:useBean id="fuente" class="clases.fuentedato" scope="page"/>
<%@include  file="../chequearsesion.jsp" %>
 
<%
  
       Connection cn = conexion.crearConexion();
	// Asignar conexion al objeto manejador de datos
	fuente.setConexion(cn);
       //Parametros
       String fecha_puesta    = request.getParameter("fecha_puesta");
       String area = (String) sesionOk.getAttribute("clasificadora");
       String area_cch = (String) sesionOk.getAttribute("area_cch");
      
  
       
String consulta ="exec [select_lotes_cambio_fp_ptc_test] @area='"+area+"',@area_cch='"+area_cch+"',@fecha_puesta='"+fecha_puesta+"' ";
        
        
   %>
   
   <table id="example" class="table table-striped table-bordered" style="width:100%">
                     <thead>
                    <tr>
                       
                        <th>Carro nro</th>
                        <th>Tipo</th>
                        <th>Cantidad</th>
                        <th>Fecha puesta </th>
                        
                        <th>ACCION</th>      
                    </tr>
                    </thead>
        <%
            ResultSet rs = fuente.obtenerDato(consulta);
            while(rs.next()){
        %>
                        <tr>  
                            <td><b><%=rs.getString("cod_carrito")%>    </b></td>
                            <td><b><%=rs.getString("tipo_huevo")%>    </b></td>
                            <td><b><%=rs.getString("cantidad")%>    </b></td>
                            <td><b><%=rs.getString("fecha_puesta")%>    </b></td>
                            <td><input type="button" value="Cambiar" class="btn btn-primary"  
                            onclick="registro_cambio_nro_ptc('<%=rs.getString("cod_interno")%>','<%=rs.getString("tipo")%>')"></td>
                        </tr>
                            <% } %>
     
       
         
        <tbody id="tbody_id"> 
             
                 </tbody>
   
     </table>

   