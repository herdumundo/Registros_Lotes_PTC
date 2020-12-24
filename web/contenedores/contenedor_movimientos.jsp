
<%@ page language="java" import="java.sql.*" errorPage="error.jsp" %>
 <jsp:useBean id="conexion" class="clases.bdconexion1" scope="page" />
 <jsp:useBean id="fuente" class="clases.fuentedato" scope="page"/>
 
 <form id="frm_movimiento" method="post">      
    <div class="form-group">
        <select  name="tipo"    id="tipo" class="form-control"   >
            <OPTION selected disabled>SELECCIONAR FILTRO POR FECHA DE PUESTA O CLASIFICACION</OPTION>
            <option value="P">FECHA DE PUESTA</option>
            <option value="C">FECHA DE CLASIFICACION</option>
        </select>
        
        <a> Fecha</a> 
        <div class="input-group">
            <div class="input-append">  
            <input id="calendario_retenido" type="text" class="datepicker"  width="276"/>
            </div> 
            <span class="input-group-addon">-</span>
        <select  name="estado_requerido"     id="estado_requerido" class="form-control"   >
            <OPTION selected disabled>SELECCIONAR ESTADO DE LIBERACIÓN</OPTION>
            <option value="L">LIBERAR</option>
            <option value="R">RETENER</option>
            <option value="Z">RETENER CON REPORTE</option>
        </select>
        </div> 
    </div>
    
    <div class="form-group">
    <center><a >HORARIO</a>  </center>
        <div class="input-group">
        
            <select class="form-control" required="true" name="desde" id="desde">
                 <OPTION VALUE="00" selected="selected">00</OPTION> 
                <OPTION VALUE="01">01</OPTION>
                <OPTION VALUE="02">02</OPTION>
                <OPTION VALUE="03">03</OPTION>
                <OPTION VALUE="04">04</OPTION>
                <OPTION VALUE="05">05</OPTION>
                <OPTION VALUE="06">06</OPTION>
                <OPTION VALUE="07">07</OPTION>
                <OPTION VALUE="08">08</OPTION>
                <OPTION VALUE="09">09</OPTION>
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
                <OPTION VALUE="23" >23</OPTION>

            </select>   
            <span class="input-group-addon">-</span>

            <select class="form-control" required="true" name="hasta" id="hasta">
                 <OPTION VALUE="00">00</OPTION> 
                <OPTION VALUE="01">01</OPTION>
                <OPTION VALUE="02">02</OPTION>
                <OPTION VALUE="03">03</OPTION>
                <OPTION VALUE="04">04</OPTION>
                <OPTION VALUE="05">05</OPTION>
                <OPTION VALUE="06">06</OPTION>
                <OPTION VALUE="07">07</OPTION>
                <OPTION VALUE="08">08</OPTION>
                <OPTION VALUE="09">09</OPTION>
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
                <OPTION VALUE="23" selected="selected">23</OPTION>
            </select> 
        </div> 
    </div>
        <input type="text" placeholder="LIBERADO POR" id="liberado_por" name="liberado_por" class="form-control" style="display: none">
        <br>
    <div class="form-group" id="combo_retenido" style="display: none">
            <div class="input-group">
            <select class="form-control"  name="estado_liberacion" id="estado_liberacion">
                <OPTION value="" selected disabled>Estado de liberación</OPTION>
                <OPTION VALUE="NC">NO CONFORME</OPTION> 
                <OPTION VALUE="PNC">POTENCIALMENTE NO CONFORME</OPTION>
                <OPTION VALUE="PNC-NC">POTENCIALMENTE NO CONFORME - NO CONFORME</OPTION>
            </select>   
                
        <span class="input-group-addon">-</span>
            Motivo de retencion
            <select class="form-control" name="motivo_retencion" id="motivo_retencion" multiple="multiple" >
                <%Connection cn = conexion.crearConexion();
                fuente.setConexion(cn);
                ResultSet rs2 = fuente.obtenerDato("select * from motivo_retencion where tipo='motivo'");
                while(rs2.next())
                {%>    
                <OPTION VALUE="<%=rs2.getString("descripcion")%>"><%=rs2.getString("descripcion")%></OPTION> 
                <%}%>  
            </select>  
            </div> 
            <br>
            <select class="form-control" name="disposicion" id="disposicion"  >
                <OPTION  value="" disabled selected >DISPOSICION</OPTION>
              <%    ResultSet rs4 = fuente.obtenerDato(" select * from motivo_retencion where tipo='disposicion'");
                    while(rs4.next())   
                {%>    
                <OPTION VALUE="<%=rs4.getString("id")%>"><%=rs4.getString("descripcion")%></OPTION> 
                <%}%>  
            </select> 
        </div> 
            <input type="button"   class="form-control btn-light-blue " value="BUSCAR" onclick="buscar_lotes_movimientos();">
            <br>
               <br>
        <div class="input-append" id="divid_grilla_retenido" >
        </div>
        <input type="submit" value="REGISTRAR" class="form-control btn-primary">       
 <table id="tabla_lotes"  data-row-style="rowStyle" class="cell-border stripe hover" data-toggle="table" data-click-to-select="true"">
   <thead>
      <tr>
         <th></th>
         <th>Cod interno</th>
         <th>Cod lote</th>
         <th>Cod carrito</th>
         <th>Tipo huevo</th>
         <th>Estado liberacion</th>
         <th>Tipo</th><!-- "Tipo" NO CAMBIAR, VERIFICA SI SE SELECCIONAN TODAS LAS FILAS, ENTONCES COMPARO SI EN LA POSICION 6 ES IGUAL A Tipo, QUE NO SUME COMO VALOR. -->
         <th>Disposicion</th>
         <th>Estado costeo</th>
      </tr>
   </thead>
   <tbody>
        
   </tbody>
</table>
       
        </form>
       
     