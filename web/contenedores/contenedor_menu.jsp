<%@ page language="java" import="java.sql.*" errorPage="error.jsp" %>
<jsp:useBean id="conexion" class="clases.bdconexion1" scope="page" />
<jsp:useBean id="fuente" class="clases.fuentedato" scope="page"/>
<%@include  file="../chequearsesion.jsp" %>
  
  
  
     <input type="text" style="display: none"  id="contador_text" >
    
       <div class="form-control bg-warning"  >
              <a class="navbar-brand "     id="texto_global" >TIENE PENDIENTES DE LIBERACION</a>
          </div>
      
     
     <div class="col-lg-3 col-md-6 col-sm-6" id="div_principal_pendiente" >
              <div class="card card-stats" onclick="traer_pendiente_liberacion()">
                <div class="card-header card-header-da card-header-icon">
                  <div class="card-icon">
                    <i class="material-icons  animacion " >notification_important</i>
                  </div>
                  <p class="card-category">Aviso</p>
                  <h3 class="card-title" id="div_pendiente"> Pendientes de liberacion
                    <small> </small>
                  </h3>
                </div>
                <div class="card-footer">
                  <div class="stats">
                    <i class="material-icons text-danger">play_arrow</i>
                    <a  >Ir</a>
                  </div>
                </div>
              </div>
            </div>
     
     
     <div class="col-lg-3 col-md-6 col-sm-6" >
              <div class="card card-stats" onclick="traer_registro()">
                <div class="card-header card-header-success card-header-icon">
                  <div class="card-icon">
                    <i class="material-icons">launch</i>
                  </div>
                  <p class="card-category">REGISTRO</p>
                  <h3 class="card-title">Carros Liberados
                    <small> </small>
                  </h3>
                </div>
                <div class="card-footer">
                  <div class="stats">
                    <i class="material-icons text-danger">play_arrow</i>
                    <a  >Ir</a>
                  </div>
                </div>
              </div>
            </div>
     
     <div class="col-lg-3 col-md-6 col-sm-6" >
              <div class="card card-stats" onclick="traer_registro_retenido()">
                <div class="card-header card-header-danger card-header-icon">
                  <div class="card-icon">
                    <i class="material-icons">launch</i>
                  </div>
                  <p class="card-category">REGISTRO</p>
                  <h3 class="card-title">Carros Retenidos
                    <small> </small>
                  </h3>
                </div>
                <div class="card-footer">
                  <div class="stats">
                    <i class="material-icons text-danger">play_arrow</i>
                    <a  >Ir</a>
                  </div>
                </div>
              </div>
            </div>
 

         <div class="col-lg-3 col-md-6 col-sm-6" >
              <div class="card card-stats" onclick="ir_transformacion_pallet_carro()">
                <div class="card-header card-header-warning card-header-icon">
                  <div class="card-icon">
                    <i class="material-icons">transform</i>
                  </div>
                  <p class="card-category">TRANSFORMACION</p>
                  <h3 class="card-title">Pallets a carros
                    <small> </small>
                  </h3>
                </div>
                <div class="card-footer">
                  <div class="stats">
                    <i class="material-icons text-danger">play_arrow</i>
                    <a  >Ir</a>
                  </div>
                </div>
              </div>
            </div>
     
     
  
         <div class="col-lg-3 col-md-6 col-sm-6">
              <div class="card card-stats"  onclick="traer_retenido()">
                <div class="card-header card-header-primary card-header-icon">
                  <div class="card-icon">
                    <i class="material-icons">sync_alt</i>
                  </div>
                  <p class="card-category">REGISTRO</p>
                  <h3 class="card-title">Movimientos de liberados y retenidos                    <small> </small>
                  </h3>
                </div>
                <div class="card-footer">
                  <div class="stats">
                    <i class="material-icons text-danger">play_arrow</i>
                    <a  >Ir</a>
                  </div>
                </div>
              </div>
            </div>
           

      <div class="col-lg-3 col-md-6 col-sm-6" >
              <div class="card card-stats" onclick="ir_cambio_disposicion()">
                <div class="card-header card-header-primary card-header-icon">
                  <div class="card-icon">
                    <i class="material-icons">loop</i>
                  </div>
                  <p class="card-category">REGISTRO CAMBIOS</p>
                  <h3 class="card-title">Disposicion y liberacion de reprocesos
                    <small> </small>
                  </h3>
                </div>
                <div class="card-footer">
                  <div class="stats">
                    <i class="material-icons text-danger">play_arrow</i>
                    <a  >Ir</a>
                  </div>
                </div>
              </div>
            </div>
      
            
   
      <div class="col-lg-3 col-md-6 col-sm-6" >
              <div class="card card-stats" onclick="traer_fecha_involucrada()">
                <div class="card-header card-header-danger card-header-icon">
                  <div class="card-icon">
                    <i class="material-icons">addchart</i>
                  </div>
                  <p class="card-category">REGISTRO</p>
                  <h3 class="card-title">Fechas involucradas
                    <small> </small>
                  </h3>
                </div>
                <div class="card-footer">
                  <div class="stats">
                    <i class="material-icons text-danger">play_arrow</i>
                    <a  >Ir</a>
                  </div>
                </div>
              </div>
            </div>
               
 
        
           <div class="col-lg-3 col-md-6 col-sm-6" >
              <div class="card card-stats" onclick="traer_eliminar()">
                <div class="card-header card-header-danger card-header-icon">
                  <div class="card-icon">
                    <i class="material-icons">delete</i>
                  </div>
                  <p class="card-category">ACTUALIZACION</p>
                  <h3 class="card-title">Eliminacion de registros
                    <small> </small>
                  </h3>
                </div>
                <div class="card-footer">
                  <div class="stats">
                    <i class="material-icons text-danger">play_arrow</i>
                    <a  >Ir</a>
                  </div>
                </div>
              </div>
            </div> 
            
            
           <div class="col-lg-3 col-md-6 col-sm-6" >
              <div class="card card-stats" onclick="traer_informe()">
                <div class="card-header card-header-success card-header-icon">
                  <div class="card-icon">
                    <i class="material-icons">visibility</i>
                  </div>
                  <p class="card-category">INFORME</p>
                  <h3 class="card-title">Visualizacion de registros
                    <small> </small>
                  </h3>
                </div>
                <div class="card-footer">
                  <div class="stats">
                    <i class="material-icons text-danger">play_arrow</i>
                    <a  >Ir</a>
                  </div>
                </div>
              </div>
            </div> 
            
     
      <div class="col-lg-3 col-md-6 col-sm-6">
              <div class="card card-stats"  onclick="ir_reportes_varios()">
                <div class="card-header card-header-success card-header-icon">
                  <div class="card-icon">
                    <i class="material-icons">grading</i>
                  </div>
                  <p class="card-category">MENU</p>
                  <h3 class="card-title">Reportes
                    <small> </small>
                  </h3>
                </div>
                <div class="card-footer">
                  <div class="stats">
                    <i class="material-icons text-danger">play_arrow</i>
                    <a  >Ir</a>
                  </div>
                </div>
              </div>
            </div> 
            
     
     
      <div class="col-lg-3 col-md-6 col-sm-6">
              <div class="card card-stats" onclick="ir_transferencia_menu()">
                <div class="card-header card-header-success card-header-icon">
                  <div class="card-icon">
                    <i class="material-icons">production_quantity_limits</i>
                  </div>
                  <p class="card-category">MENU REGISTRO</p>
                  <h3 class="card-title"> Transferencias
                    <small> </small>
                  </h3>
                </div>
                <div class="card-footer">
                  <div class="stats">
                    <i class="material-icons text-danger">play_arrow</i>
                    <a  >Ir</a>
                  </div>
                </div>
              </div>
            </div> 
             
                                  

                                               
          
      <div class="col-lg-3 col-md-6 col-sm-6">
              <div class="card card-stats"  onclick="ir_agregar_motivo_retencion()">
                <div class="card-header card-header-success card-header-icon">
                  <div class="card-icon">
                    <i class="material-icons">remove_shopping_cart</i>
                  </div>
                  <p class="card-category">REGISTRO</p>
                  <h3 class="card-title"> Motivo de retencion
                    <small> </small>
                  </h3>
                </div>
                <div class="card-footer">
                  <div class="stats">
                    <i class="material-icons text-danger">play_arrow</i>
                    <a  >Ir</a>
                  </div>
                </div>
              </div>
            </div> 
               
  
            