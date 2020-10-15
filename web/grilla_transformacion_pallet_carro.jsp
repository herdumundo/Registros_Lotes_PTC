
 <%@ page language="java" import="java.sql.*" errorPage="error.jsp" %>
<jsp:useBean id="conexion" class="clases.bdconexion1" scope="page" />
<jsp:useBean id="fuente" class="clases.fuentedato" scope="page"/>
<%@include  file="chequearsesion.jsp" %>
 
<%
  
       Connection cn = conexion.crearConexion();
	// Asignar conexion al objeto manejador de datos
	fuente.setConexion(cn);
       //Parametros
       String fecha_puesta    = request.getParameter("fecha_puesta");
       String area = (String) sesionOk.getAttribute("clasificadora");
      
  
       
String consulta ="select cod_interno,convert(varchar,fecha_puesta,103) as fecha_puesta,cod_carrito,cantidad,tipo_huevo "
        + "from lotes where left(cod_carrito,1)='9' and clasificadora_actual='"+area+"' and fecha_puesta='"+fecha_puesta+"' and estado='a' ";
        
        
   %>
   
   <table id="example" class="table table-striped table-bordered" style="width:100%">
                     <thead>
                    <tr>
                        <th>Id</th>
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
                            <td><b><%=rs.getString("cod_interno")%></b>    </td>
                            <td><b><%=rs.getString("cod_carrito")%>    </b></td>
                            <td><b><%=rs.getString("tipo_huevo")%>    </b></td>
                            <td><b><%=rs.getString("cantidad")%>    </b></td>
                            <td><b><%=rs.getString("fecha_puesta")%>    </b></td>
                            <td><input type="button" value="Cambiar" class="btn btn-primary"  onclick="registro_transformacion_pallet_carro('<%=rs.getString("cod_interno")%>','<%=rs.getString("cod_carrito")%>')"></td>
                        </tr>
                            <% } %>
     
       
         
        <tbody id="tbody_id"> 
             
                 </tbody>
   
     </table>

   