<%@ page language="java" import="java.sql.*" errorPage="error.jsp" %>
<jsp:useBean id="conexion" class="clases.bdconexion1" scope="page" />
<jsp:useBean id="fuente" class="clases.fuentedato" scope="page"/>   
<%@include  file="../chequearsesion.jsp" %>
      <%
          String area_registro = (String) sesionOk.getAttribute("clasificadora"); 
          
          String area_format="";
          
          if (area_registro.equals("A")||area_registro.equals("B")) {
              area_format="cch";
          }
          
          if (area_registro.equals("O")) {
              area_format="ovo";
          }
                  
              
          Connection cn = conexion.crearConexion();
	 
	fuente.setConexion(cn);           //CAMBIAR BASE DE DATOS                                                                                                                                                                                                                                                                                                                                                                                                                //CAMBIAR BASE DE DATOS       
        ResultSet rs = fuente.obtenerDato("SELECT  convert(varchar,getdate(),111) as fecha,REPLACE(CONVERT(VARCHAR(10),  convert(varchar,getdate(),103), 5),'/','') ");
       while(rs.next()){          
 %>    
 <form method="post"   id="formulario">
      
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
         <input id="id_date" name="id_date" style="display: none" type="text"  width="276"  value="<%=rs.getString(2)%>"   />
            <input id="id_clasificadora" name="id_clasificadora" style="display: none"  type="text"  width="276"  value="<%=area_registro%>"   />
            
               </div>
            </div>
              <div class="input-append">  
                  <div class="form-groupss " >
         
         <label class="form-control-placeholder"><b>TIPO MAPLES</b></label>
               
               <select style="font-weight: bold;" class="form-control" name="tipo_maples" id="tipo_maples">
            <OPTION style="font-weight: bold;" VALUE="IM">TIPO IM</OPTION>
            <OPTION style="font-weight: bold;" VALUE="IIM">TIPO IIM</OPTION>
            <OPTION style="font-weight: bold;" VALUE="IIH">TIPO IIH</OPTION>
           
             
            </select>  </div></div>
         
            <div class="form-group">
            <div class="input-group">
                <select style   ="font-weight: bold;" class="form-control" name="tipo_huevo" id="tipo_huevo"  
                        onchange="cargar_unidad_medida();visualizar_zona_liberado(),consulta_empacadora()">
            <OPTION style="font-weight: bold;" selected disabled>Seleccione tipo de huevo</OPTION>
            <OPTION style="font-weight: bold;" VALUE="1">G</OPTION>
            <OPTION style="font-weight: bold;" VALUE="2">J</OPTION>
            <OPTION style="font-weight: bold;" VALUE="3">S</OPTION>
            <OPTION style="font-weight: bold;" VALUE="4">A</OPTION>
            <OPTION style="font-weight: bold;" VALUE="5">B</OPTION>
            <OPTION style="font-weight: bold;" VALUE="6">C</OPTION>
            <OPTION style="font-weight: bold;" VALUE="7">4TA</OPTION>
             
            </select>  
            <span class="input-group-addon">-</span>
            <div class="input-append">  
                  <div class="form-groupss " >
         
         <label class="form-control-placeholder"><b>Fecha de puesta</b></label>
            <input style="font-weight: bold;" id="fecha_puesta" name="fecha_puesta" class="datepicker"   width="276" value="<%=rs.getString(1)%>" placeholder="Fecha puesta"  />
    
            <%}
            %> 
                  </div></div>
            </div> 
            </div>
            </div>
   
           
        
            
         
        
            <div class="form-group">
        
           
           <input name="cod_carrito" id="cod_carrito" type="number"  autocomplete="off"  style="font-weight: bold;" placeholder="Codigo carrito,Mesa,Pallet" onkeyup="contar()"  >
            
          
             
       
            </div> 
                
                <div class="input-group">    
                <select style="font-weight: bold;" class="form-control" name="unidad_medida" id="unidad_medida"  onchange="limpiar_cantidad()" > </select>
            
          
            </div>
                <br>
                
                       <div class="input-append">  
                  <div class="form-groupss " >
         
                      <label class="form-control-placeholder"><b>   SELECCIONE NRO DE EMPACADORA</b></label>
             <div id="div_empacadora"> 
            
                <div id="combo" class="form-group">                 
                    <select  name="nro_empacadora"  id="nro_empacadora" class="form-control"  multiple="multiple" >
                    
                    </select>
                </div>
            </div>  </div>  </div>
   
    
        
       
         <div class="form-group">
             <b>Cantidad</b>
        <div class="input-group">
           <input name="txt_cantidad" id="txt_cantidad" style="font-weight: bold;" type="number"   placeholder="Cantidad" onkeyup="calculo()">
          <span class="input-group-addon">-</span>
          
             
            </div> </div>
  
            <div class="form-group">
            <b>Hora de Clasificación</b>
            <div class="input-group">
             
           <select style="font-weight: bold;" class="form-control"  name="hora_desde" id="hora_desde" >
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
          
            <select style="font-weight: bold;" class="form-control"   name="hora_hasta" id="hora_hasta" >
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
  
        
        <div class="form-group" id="div_grupo_aviario_almacenamiento">
            <div class="input-group">
            <select style="font-weight: bold;" class="form-control"   name="tipo_aviario" id="tipo_aviario">
            
            </select>   
                
        <span class="input-group-addon">-</span>
        
        
        <select style="font-weight: bold;" class="form-control" name="tipo_almacenamiento" id="tipo_almacenamiento">
           
            </select>  </div> </div>    
       
        <div id="div_reproceso_liberado" style="display:none">
            
            
            <select class="form-control" name="cbox_reproceso" id="cbox_reproceso">
                <OPTION selected disabled>Tipo de reproceso</OPTION>
               
                 <%  
	                                                                                                                                                                                                                                                                                                                                                                                                           //CAMBIAR BASE DE DATOS       
        ResultSet rs1 = fuente.obtenerDato("select * from fallas where area in ('ccho','"+area_format+"') and tipo in ('rep')");
       while(rs1.next()){
           
                
 %>
            
            <OPTION VALUE="<%=rs1.getString("codigo")%>"><%=rs1.getString("desfallazona")%></OPTION>
             
            <% }%>
                
            </select>   
            
            
            
        </div>
              <div id="div_sub_liberado" style="display:none">
            
            
            <select class="form-control" name="cbox_sub" id="cbox_sub">
                <OPTION selected disabled>Tipo de subproducto</OPTION>
               
                 <%  
	                                                                                                                                                                                                                                                                                                                                                                                                           //CAMBIAR BASE DE DATOS       
        ResultSet rs3 = fuente.obtenerDato("select * from fallas where area in ('ccho','"+area_format+"') and tipo in ('sub')");
       while(rs3.next()){
           
                
 %>
            
            <OPTION VALUE="<%=rs3.getString("codigo")%>"><%=rs3.getString("desfallazona")%></OPTION>
             
            <% }%>
                
            </select>   
            
            
            
        </div>
        
        <div id="div_zona_liberado" style="display:none">
            
            
            <select class="form-control" name="cbox_zona_liberado" id="cbox_zona_liberado">
            <OPTION selected disabled>Zona</OPTION>
               <%  
	                                                                                                                                                                                                                                                                                                                                                                                                               //CAMBIAR BASE DE DATOS       
        ResultSet rs2 = fuente.obtenerDato("select * from fallas where area in ('ccho','"+area_format+"') and tipo in ('rot', 'ROS')");
       while(rs2.next()){
           
                
 %>
            
            <OPTION VALUE="<%=rs2.getString("codigo")%>"><%=rs2.getString("desfallazona")%></OPTION>
             
            <% }%>
             
            </select>   
            
            
            
        </div>
        <br>
        <div class="form-group" id="div_responsable_liberado">
            <div class="input-group">
                
         
         <label class="form-control-placeholder"><b>   Responsable</b></label>
        
                <input name="txt_responsable" style="text-transform: uppercase;font-weight: bold;" autocomplete="off" id="txt_responsable" type="text"   placeholder="Responsable">
               </div>  <span class="input-group-addon">-</span>
           
                  <div class="input-group">
               
         
         <label class="form-control-placeholder"><b>   Liberado por</b></label>
        
               <input name="txt_liberado"  style="text-transform: uppercase;font-weight: bold;" id="txt_liberado" autocomplete="off" required="true" type="text"   placeholder="Liberado por.">
            </div>  </div>  
        
         <div class="input-group">
                
         
         <label class="form-control-placeholder"><b>   Comentario</b></label>
        
         <input name="txt_obs"    style="text-transform: uppercase;font-weight: bold;" id="txt_obs" type="text" autocomplete="off" class="text-negro"     placeholder="Comentario">
              </div>   
            
            <br> 
            <input name="text_resultado" style="display: none"  id="text_resultado" type="text"   lass="form-control">
            <input type="button" value="Registrar" id="btn_registrar" name="btn_registrar" 
                   class="form-control btn btn-primary  " style="  
                   height:70px" onclick="procesar('control_registro');"   />
            <br><br> 

</form>
      
            
            
  
 

   
      
    
     
        
        
        
 