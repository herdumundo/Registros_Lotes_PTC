
<%@page import="javax.swing.JOptionPane"%>
<%@ page language="java" import="java.sql.*" errorPage="error.jsp" %>
<jsp:useBean id="conexion" class="clases.bdconexion1" scope="page" />
<jsp:useBean id="fuente" class="clases.fuentedato" scope="page"/>
<%@include  file="../chequearsesion.jsp" %>
<%
  
// Crear objeto de conexion al DB
	// Crear objeto de conexion al DB
	Connection cn = conexion.crearConexion();
	// Asignar conexion al objeto manejador de datos
	fuente.setConexion(cn);
       //Parametros
        String calendario    = request.getParameter("calendario_informe");
        String area = (String) sesionOk.getAttribute("clasificadora");
        String cbox_estado_liberacion =request.getParameter("estado");
        try {
        String SQL="";
        String sql_liberado="[select_excel_lotes_PTC_fp] @fecha='"+calendario+"' ,@area='"+area+"' ";
        String sql_retenido="[select_excel_lotes_PTC_fp_retenidos] @fecha='"+calendario+"' ,@area='"+area+"' ";

        if(cbox_estado_liberacion.equals("L")){
            SQL=sql_liberado;
            }
        else {
        SQL=sql_retenido;
            }
%>
                <tr>                         
                        <th>FECHA DE REGISTRO</th>
                        <th>FECHA DE PUESTA</th>
                        <th>FECHA DE CLASIFICACION</th>
                        <th>HORA DE EMPAQUE</th>
                        <th>CODIGO DEL CARRITO</th>
                        <th>CODIGO DE PALLET</th> 
                        <th>FECHAS DE PUESTAS INVOLUCRADAS</th>
                        <th>TIPO DE HUEVO </th>
                        <th>TIPO DE MAPLES</th>
                        <th>EMPACADORA</th>
                        <th>CATEGORIA</th> 
                        <th>AVIARIO</th> 
                        <th>TIPO ALMACENAMIENTO</th> 
                        <th>RESPONSABLE</th>  
                        <th>ESTADO DE LIBERACION</th> 
                        <th>CODIGO BORROSO</th> 
                        <th>ESTADO DEL PRODUCTO</th> 
                        <th>MOTIVO</th> 
                        <th>DISPOSICION</th> 
                         <th>LIBERADO POR</th> 
                        <th>FECHA DE EMBARQUE</th> 
                </tr>
        <%
        ResultSet rs = fuente.obtenerDato(SQL);
            while(rs.next()){
            %>
            <tr>  
                <td><%=rs.getString("fecha_registro")%>         </td>
                <td><%=rs.getString("fecha_puesta")%>           </td>
                <td><%=rs.getString("fecha")%>                  </td>
                <td><%=rs.getString("hora_clasificacion")%>     </td>
                <td><%=rs.getString("cod_carrito")%>            </td>
                <td><%=rs.getString("pallet")%>                 </td>
                <td><%=rs.getString("fecha_involucrada")%>      </td>
                <td><%=rs.getString("tipo_huevo")%>             </td>  
                <td><%=rs.getString("tipo_maples")%>            </td>  
                <td><%=rs.getString("empacadora")%>             </td>  
                <td><%=rs.getString("cod_clasificacion")%>      </td>  
                <td><%=rs.getString("aviario")%>                </td> 
                <td><%=rs.getString("tipo_almacenamiento")%>    </td>  
                <td><%=rs.getString("resp_control_calidad")%>   </td>  
                <td><%=rs.getString("estado_liberacion")%>      </td>  
                <td><%=rs.getString("codigo_borroso")%>         </td> 
                <td><%=rs.getString("estado_retencion")%>       </td> 
                <td><%=rs.getString("motivo_retencion")%>       </td> 
                <td><%=rs.getString("disposicion")%>            </td> 
                <td><%=rs.getString("liberado_por")%>           </td> 
                <td><%=rs.getString("fecha_embarque")%>         </td> 
            </tr>
       <% }       
            } catch (Exception e) {
                        String a=e.toString();
                                    }%>
     
       
        