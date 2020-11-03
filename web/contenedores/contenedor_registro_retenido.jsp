 <%@ page language="java" import="java.sql.*" errorPage="error.jsp" %>
 <jsp:useBean id="conexion" class="clases.bdconexion1" scope="page" />
 <jsp:useBean id="fuente" class="clases.fuentedato" scope="page"/>   
<!--<link href="estilos/css/styles_loading.css" rel="stylesheet">-->
      <% Connection cn = conexion.crearConexion();
	// Asignar conexion al objeto manejador de datos
	fuente.setConexion(cn);           //CAMBIAR BASE DE DATOS                                                                                                                                                                                                                                                                                                                                                                                                                //CAMBIAR BASE DE DATOS       
        ResultSet rs = fuente.obtenerDato("select convert(varchar,getdate(),111) as fecha");
       while(rs.next()){          
 %>    
 <form method="post" id="formulario" action="../controles/control_retenidos.jsp"  >
    
    <div class="form-group">
            <div class="input-group">
          <div class="form-groupss " >
         
         <label class="form-control-placeholder"><b>Fecha de clasificación</b></label>
  <input style="font-weight: bold;" id="calendario_registro" name="calendario_registro"  class="datepicker"    value="<%=rs.getString(1)%>"   />
 
      </div>
            <input type="checkbox"   data-toggle="toggle" data-on="BORROSO SI" data-off="BORROSO NO" id="chkToggle2" data-onstyle="success" data-offstyle="warning">
        
            
  <input type="checkbox"   data-toggle="toggle" data-on="ESPECIAL SI" data-off="ESPECIAL NO" id="chkToggle_especial" data-onstyle="primary" data-offstyle="danger">
            <input id="codigo_especial" name="codigo_especial"   value="NO" type="text" style="display: none"  />

            <input id="codigo_borroso" name="codigo_borroso"  style="display: none" value="NO" type="text" />
       
               </div>
            </div>
            
              TIPO MAPLES
               <select style="font-weight: bold;" class="form-control" name="tipo_maples" id="tipo_maples">
            <OPTION VALUE="IM">TIPO IM</OPTION>
            <OPTION VALUE="IIM">TIPO IIM</OPTION>
            <OPTION VALUE="IIH">TIPO IIH</OPTION>
            
               </select>
              <br>
            
            <div class="form-group">
            <div class="input-group">
           
          
                <select style="font-weight: bold;" class="form-control" name="tipo_huevo_retenido" id="tipo_huevo_retenido" required="true"  onchange="cargar_unidad_medida_retenido();consulta_empacadora_retenido();">
            <OPTION selected disabled>Seleccione tipo de huevo</OPTION>
            <OPTION VALUE="1">G</OPTION>
            <OPTION VALUE="2">J</OPTION>
            <OPTION VALUE="3">S</OPTION>
            <OPTION VALUE="4">A</OPTION>
            <OPTION VALUE="5">B</OPTION>
            <OPTION VALUE="6">C</OPTION>
            <OPTION VALUE="7">4TA</OPTION>
            
            </select>   
            <span class="input-group-addon">-</span>
            <div class="input-append">  
                
                
            
                <input style="font-weight: bold;" id="fecha_puesta" class="datepicker" name="fecha_puesta"   width="276" value="<%=rs.getString(1)%>" placeholder="Fecha puesta" required="" />
    
            <%}
            %> 
            </div>
          
            <span class="input-group-addon">-</span>
       
            </div>
            </div>
            <br>
            <div class="form-group">
            <div class="input-group">
                <input style="font-weight: bold;" name="cod_carrito" id="cod_carrito" type="number" autocomplete="off" required class="form-control" placeholder="Codigo carrito,Mesa,Pallet" onkeyup="contar()" onKeyPress="return soloNumeros(event)" >
          
            <span class="input-group-addon">-</span>
            <div class="input-append">  
                
           <select  style="font-weight: bold;" class="form-control" name="unidad_medida_retenido" id="unidad_medida_retenido" required="true" onchange="limpiar_cantidad_retenido()" > </select>

           
           </div> 
            </div>
            </div>
   
            <div> 
                SELECCIONE NRO DE EMPACADORA
                <div id="combo" class="form-group">                 
                    <select   name="nro_empacadora" required="true"   id="nro_empacadora" class="form-control"  multiple="multiple" >
                    
                    </select>
                </div>
            </div>
        
   
          <div> 
                SELECCIONE ESTADO DE RETENCION
                <div id="combo" class="form-group">                 
                    <select style="font-weight: bold;"  name="estado_retenido" required="true"   id="estado_retenido" class="form-control">
                    <option style="font-weight: bold;" value="R">RETENIDO</option>
                    <option style="font-weight: bold;" value="Z">RETENIDO CON REPORTE</option>
                    
                    </select>
                </div>
            </div>
            
   
         <div class="form-group">
       Cantidad
        <div class="input-group">
            <input style="font-weight: bold;" name="txt_cantidad" id="txt_cantidad"  type="number" required="true" class="form-control"  placeholder="Cantidad" onkeyup="calculo()">
          <span class="input-group-addon">-</span>
          
          
            </div> </div>
        <style>
              .cambio {
    color: #000;
    }
  </style>
     
        
 
             <div class="form-group">
            Hora de Clasificación
            <div class="input-group">
             
           <select style="font-weight: bold;" class="form-control" required="true" name="hora_desde" id="hora_desde" >
            <OPTION selected disabled>Hora inicio</OPTION>
          <OPTION VALUE="01">1</OPTION>
            <OPTION VALUE="02">2</OPTION> 
            <OPTION VALUE="03">3</OPTION>
            <OPTION VALUE="04">4</OPTION>
            <OPTION VALUE="05">5</OPTION>
            <OPTION VALUE="06">6</OPTION>
            <OPTION VALUE="07">7</OPTION> 
            <OPTION VALUE="08">8</OPTION>
            <OPTION VALUE="09">9</OPTION>
            <OPTION VALUE="10">10</OPTION> 
            <OPTION VALUE="11">11</OPTION>
            <OPTION VALUE="12">12</OPTION>
            <OPTION VALUE="13">13</OPTION> 
            <OPTION VALUE="14">14</OPTION>
            <OPTION VALUE="15">15</OPTION>
            <OPTION VALUE="16">16</OPTION> 
            <OPTION VALUE="17">17</OPTION>
            <OPTION VALUE="18">18</OPTION>
            <OPTION VALUE="19">19</OPTION> 
            <OPTION VALUE="20">20</OPTION>
            <OPTION VALUE="21">21</OPTION>
            <OPTION VALUE="22">22</OPTION>
            <OPTION VALUE="23">23</OPTION>
            <OPTION VALUE="00">00</OPTION>
            </select>   
            
            
            <span class="input-group-addon">-</span>
          
            <select style="font-weight: bold;" class="form-control" required="true" name="hora_hasta" id="hora_hasta" >
            <OPTION selected disabled>Hora fin</OPTION>
           <OPTION VALUE="01">1</OPTION>
            <OPTION VALUE="02">2</OPTION> 
            <OPTION VALUE="03">3</OPTION>
            <OPTION VALUE="04">4</OPTION>
            <OPTION VALUE="05">5</OPTION>
            <OPTION VALUE="06">6</OPTION>
            <OPTION VALUE="07">7</OPTION> 
            <OPTION VALUE="08">8</OPTION>
            <OPTION VALUE="09">9</OPTION>
            <OPTION VALUE="10">10</OPTION> 
            <OPTION VALUE="11">11</OPTION>
            <OPTION VALUE="12">12</OPTION>
            <OPTION VALUE="13">13</OPTION> 
            <OPTION VALUE="14">14</OPTION>
            <OPTION VALUE="15">15</OPTION>
            <OPTION VALUE="16">16</OPTION> 
            <OPTION VALUE="17">17</OPTION>
            <OPTION VALUE="18">18</OPTION>
            <OPTION VALUE="19">19</OPTION> 
            <OPTION VALUE="20">20</OPTION>
            <OPTION VALUE="21">21</OPTION>
            <OPTION VALUE="22">22</OPTION>
            <OPTION VALUE="23">23</OPTION>
            <OPTION VALUE="00">00</OPTION>
            </select>   </div> </div>
  
        
            <div class="form-group">
            <div class="input-group">
            <select style="font-weight: bold;" class="form-control" required="true" name="tipo_aviario" id="tipo_aviario">
            <OPTION style="font-weight: bold;" selected disabled>Tipo aviario</OPTION>
            <OPTION style="font-weight: bold;"  VALUE="M">M</OPTION> 
            <OPTION style="font-weight: bold;" VALUE="T">T</OPTION>
            </select>   
                
        <span class="input-group-addon">-</span>
        
        
        <select style="font-weight: bold;" class="form-control" name="tipo_almacenamiento" id="tipo_almacenamiento" required="true"  >
            <OPTION style="font-weight: bold;" selected disabled>Tipo almacenamiento</OPTION>
            <OPTION style="font-weight: bold;" VALUE="C">C</OPTION> 
            <OPTION style="font-weight: bold;" VALUE="P">P</OPTION>
            <OPTION style="font-weight: bold;" VALUE="M">M</OPTION>
            </select>  </div> </div>    
       
        
         <div class="form-group">
            <div class="input-group">
            <select style="font-weight: bold;" class="form-control" required="true" name="estado_liberacion" id="estado_liberacion">
            <OPTION style="font-weight: bold;" selected disabled>Estado de liberación</OPTION>
            <OPTION style="font-weight: bold;" VALUE="NC">NO CONFORME</OPTION> 
            <OPTION style="font-weight: bold;"VALUE="PNC">POTENCIALMENTE NO CONFORME</OPTION>
            <OPTION style="font-weight: bold;" VALUE="PNC-NC">POTENCIALMENTE NO CONFORME - NO CONFORME</OPTION>
            </select>   
                
        <span class="input-group-addon">- </span>
        
        Motivo de retencion
        <select style="font-weight: bold;" class="form-control" name="motivo_retencion"  multiple="multiple"  id="motivo_retencion" required="true" >
           
            
            
            
            <%  
	// Asignar conexion al objeto manejador de datos
	fuente.setConexion(cn);           //CAMBIAR BASE DE DATOS                                                                                                                                                                                                                                                                                                                                                                                                                //CAMBIAR BASE DE DATOS       
        ResultSet rs2 = fuente.obtenerDato("select * from motivo_retencion where tipo='motivo'");
       while(rs2.next()){          
 %>    
 <OPTION style="font-weight: bold;" VALUE="<%=rs2.getString("descripcion")%>"><%=rs2.getString("descripcion")%></OPTION> 
             
          <% }  %>  
            </select>  </div> </div>   
        
        
        
 <div  class="input-append">  
            
            
            
            <select  style="font-weight: bold;" class="form-control" required="true" name="disposicion" id="disposicion"  onchange="ver_div()" >
                <OPTION style="font-weight: bold;" selected disabled value="">Disposición</OPTION>
              <%  
	// Asignar conexion al objeto manejador de datos
	fuente.setConexion(cn);           //CAMBIAR BASE DE DATOS                                                                                                                                                                                                                                                                                                                                                                                                                //CAMBIAR BASE DE DATOS       
        ResultSet rs3 = fuente.obtenerDato(" select * from motivo_retencion where tipo='disposicion'");
        while(rs3.next())   {          
                %>    
        <OPTION style="font-weight: bold;" VALUE="<%=rs3.getString("id")%>"><%=rs3.getString("descripcion")%></OPTION> 
             
          <%                }  %>  
            </select>   </div> 
        
         
            <br>
        
      
            <div class="form-group">
            <div class="input-group">
            <input  style="font-weight: bold;" name="txt_responsable" style="text-transform: uppercase;" autocomplete="off" autocomplete="off" id="txt_responsable" type="text" required="true" class="form-control" placeholder="Responsable">
            
             </div>  </div>   
        
            <input style="font-weight: bold;" name="txt_obs" style="text-transform: uppercase;" id="txt_obs" type="text"  required="true"  class="form-control" placeholder="Comentario">
            <br><br>
            <input style="font-weight: bold;" type="button" value="Registrar" id="btn_registrar" name="btn_registrar" 
                   class="form-control btn btn-primary " style="  height:70px"   onclick=" procesar('control_retenidos');" />
            <br> 

</form>
      
            
     

   