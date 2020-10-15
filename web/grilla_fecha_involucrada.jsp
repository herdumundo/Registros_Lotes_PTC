 <%@ page language="java" import="java.sql.*" errorPage="error.jsp" %>
<%@include  file="chequearsesion.jsp" %>
<%    String usuario = (String) sesionOk.getAttribute("usuario");
String clasificadora = (String) sesionOk.getAttribute("clasificadora");
String user_name = (String) sesionOk.getAttribute("nombre_usuario");
   String calendario= request.getParameter("fecha");
  %>
<%@ page language="java" import="java.sql.*" errorPage="error.jsp" %>
 <jsp:useBean id="conexion" class="clases.bdconexion1" scope="page" />
 <jsp:useBean id="fuente" class="clases.fuentedato" scope="page"/>
 
 <form method="post" id="formulario_eliminar">
              <table id="grilla_involucrada" class="table table-striped table-bordered" style="width:100%">
   
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
                  ACCION
                </th>   
              </thead>
            
                  <%
        Connection cn = conexion.crearConexion();
	// Asignar conexion al objeto manejador de datos
	fuente.setConexion(cn);
            ResultSet rs = fuente.obtenerDato("select  *,convert(varchar,fecha_puesta,103) as Fecha_eliminar "
            + "from lotes where convert(varchar,fecha_puesta,103)= '"+calendario+"'  "
            + "and clasificadora_actual='"+clasificadora+"'and tipo_huevo not in ('RP','PI','R') and estado in ('A','C')");
       
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
        
       <td id="nro_carro"><b><%=rs.getString("cod_carrito")%></b></td>
       <td id="fecha_puesta"><b><%=rs.getString("Fecha_eliminar")%></b></td>
       <td id="tipo_huevo"><b><%=tipohuevo%></b></td> 
              <td>
                 <input type="button" id="<%=rs.getString("cod_lote")%>" data-toggle="modal" data-target="#cuadro1" onclick="$('#txt_cod_lote').val('<%=rs.getString("cod_lote")%>');"     class="btn btn-success " value="INGRESAR DATOS">
                                </td>  
                <%}%>   </tr> 
              
              
                <tbody id="grilla_eliminar">
              
              </tbody>   
          </table>
       </form>
        
              
              
               
               
     
 
    
           
           
  
 
 

        
        
      
      
        




        
        
        
        
        
      