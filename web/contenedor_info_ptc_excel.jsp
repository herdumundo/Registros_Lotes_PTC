  <!DOCTYPE html>
 <%@ page session="true" %>
<%@include  file="chequearsesion.jsp" %>
<%    String usuario       = (String) sesionOk.getAttribute("usuario");
      String clasificadora = (String) sesionOk.getAttribute("clasificadora");
      sesionOk.setAttribute("area",clasificadora);
      String user_name = (String) sesionOk.getAttribute("nombre_usuario");
%>
 
    
    
      
              <div class="form-group">
            <div class="input-group">
           
                <input id="calendario_ptc_excel" type="text" class="datepicker"  width="276"    />
             
                 
            <span class="input-group-addon">-</span>
            <div class="input-append">  
<select class="form-control" name="estado" id="estado"  >
            <OPTION selected value=""  >Estado liberacion</OPTION>
               
        <OPTION VALUE="L">Liberado</OPTION> 
        <OPTION VALUE="R">Retenido</OPTION> 
             
           
            </select>             </div>
          
        
            <input type="button" value="BUSCAR" onclick=" principal_excel($('#calendario_ptc_excel').val(),$('#estado').val());" class="form-control btn-primary">
            
            </div>
            </div>
          
          <script>
       
                  function principal_excel(calendario_informe,estado){
          $.get('grilla_ptc_excel.jsp',{calendario_informe:calendario_informe,estado:estado},
                function(res){
                      $("#mobiles").html(res);
                    

                });
                    $('#divid').show();                             }
  
          </script>
        
               
           
      
      <br>   
              
      
     <script>
function exportF(elem) {
  var table =document.getElementById("mobiles"); 
  var html = table.outerHTML;
  var url = 'data:application/vnd.ms-excel,' + escape(html); // Set your html table into url 
    elem.setAttribute("href", url);
    
  elem.setAttribute("download", "REPORTE PTC.xls"); // Choose the file name
  return false;
}
</script>
  <a id="downloadLink" onclick="exportF(this)">EXPORTAR A EXCEL</a>

      
      <div   class="row" id="divid" style="display: none">
        <div class="col-md-12">
        <div class="panel panel-primary">
        <div class="panel-heading" > </div>
        
          <table    id="mobiles"  data-row-style="rowStyle" class="table" data-toggle="table" data-click-to-select="true">
                               
          </table>
        </div> </div> </div>  
      
          <div id="container"></div>
 
     