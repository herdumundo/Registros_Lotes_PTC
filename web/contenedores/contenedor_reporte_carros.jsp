 
     
<form id="formulario_reporte_reproceso" name="formulario_reporte_reproceso" action="" target="_blank">
    
    
    <div class="input-append">  
        <a>FECHA DE PUESTA</a>
        <input id="calendario_reporte_carros" name="calendario_reporte_carros" class="datepicker" type="text"  width="276" required="true"  />
    
    
    </div> 
    
    
     <div class="input-append">  
        <a>FECHA DE CLASIFICACION</a>
        <input id="calendario_reporte_clasificacion" name="calendario_reporte_clasificacion" class="datepicker" type="text"  width="276" required="true"  />
       
    </div> 
             
      <br> 
      <a >ESTADO DE LIBERACION</a> 
      <select class="form-control" name="cbox_estado" id="cbox_estado" required="true"> 
          <OPTION value="" selected disabled>SELECCIONAR ESTADO DE LIBERACION</OPTION>
            <OPTION   VALUE="L">LIBERADO</OPTION>
            <OPTION   VALUE="R">RETENIDO</OPTION>
             </select>   
        
         <br> 
         
         <a >TIPO DE HUEVO</a> 
           <select class="form-control" name="tipo_huevo" id="tipo_huevo" > 
            <OPTION selected  >TODOS</OPTION>
            <OPTION   VALUE="A">A</OPTION>
            <OPTION   VALUE="B">B</OPTION>   
            <OPTION   VALUE="C">C</OPTION>
            <OPTION   VALUE="D">D</OPTION>
            <OPTION   VALUE="S">S</OPTION>   
            <OPTION   VALUE="J">J</OPTION>
            <OPTION   VALUE="G">G</OPTION>
             </select> 
      
             <br> 
             
   <center><a>HORARIO DE CLASIFICACION</a>  </center>
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
              <br>  <br> 
             <input   class="btn  btn-success form-control" type="submit" onclick="reporte_ptc_direccionar();"  value="Generar reporte"> 
        
          
      </form> 
   
