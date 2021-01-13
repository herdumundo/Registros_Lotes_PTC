<!DOCTYPE html>
<html lang="en">
<%@ page session="true" %>
<%@include  file="chequearsesion.jsp" %>
<%    String usuario       = (String) sesionOk.getAttribute("usuario");
      String clasificadora = (String) sesionOk.getAttribute("clasificadora");
       if(clasificadora.equals("A")){
      
      clasificadora="CYO-CCHA";
      }
      else if(clasificadora.equals("B")){
      
      clasificadora="CYO-CCHB";
      }
       else if(clasificadora.equals("O")){
      
      clasificadora="CYO-LAVADO";
      }
      
       else if(clasificadora.equals("H")){
      
      clasificadora="CYO-CCHH";
      }
      
       else{
        clasificadora="DEPOSITO-CYO";
        }
      
      
      
      String user_name = (String) sesionOk.getAttribute("nombre_usuario");
      String perfil = (String) sesionOk.getAttribute("perfil");
%>
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Grupo Maehara</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="estilos/css/sweetalert.css" rel="stylesheet" type="text/css"/>
    <link href="estilos/css/styles_loading.css" rel="stylesheet">  
    <link href="estilos/css/bootstrap4-toggle.min.css" rel="stylesheet" type="text/css"/>
    <link href="estilos/css/sb-admin-2.css" rel="stylesheet" type="text/css"/>
    <link href="lib/themes/main.css?v=1.0.2" rel="stylesheet" />
    <link href="lib/themes/default.css?v=1.0.2" rel="stylesheet" id="theme_base" />
    <link href="lib/themes/default.date.css?v=1.0.2" rel="stylesheet" id="theme_date" />
    <link href="estilos/css/colores.css" rel="stylesheet" type="text/css"/>
    <link href="estilos/css/parpadeo.css" rel="stylesheet" type="text/css"/>
    <link href="estilos/efecto_boton.css" rel="stylesheet" type="text/css"/>
      
    <link href="estilos/css/dataTables.css" rel="stylesheet" type="text/css"/>
    <link href="estilos/css/select.dataTables.css" rel="stylesheet" type="text/css"/>
    <link href="estilos/css/checkboxes.css" rel="stylesheet" type="text/css"/>
    <link href="estilos/css/buttons.bootstrap4.css" rel="stylesheet" type="text/css"/>

</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">
      <input type="hidden" id="perfil" value="<%=perfil%>">
    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion toggled" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
    <div class="sidebar-brand-icon rotate-n-15">
      <i class="fas fa-laugh-wink"></i>
    </div>
    <div class="sidebar-brand-text mx-3"><%=clasificadora%> </div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item" onclick="traer_menu()">
    <a class="nav-link" >
      <i class="fas fa-fw fa-tachometer-alt"></i>
      <span>Principal</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
    <%=user_name%>
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item active">
    <a class="nav-link"  data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
      <i class="fas fa-fw fa-cog"></i>
      <span>Registros</span>
    </a>
    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
      <div class="bg-white py-2 collapse-inner rounded">
        <h6 class="collapse-header">Menu registros</h6>
        <a class="collapse-item active"  onclick="traer_registro()">Carros liberados</a>
        <a class="collapse-item active" onclick="traer_registro_retenido()()" >Carros retenidos</a>
        <a class="collapse-item active" onclick="ir_movimiento()" >Movimientos</a>
        <a class="collapse-item active" onclick="ir_transformacion_pallet_carro()" >Pallets a carros</a>
        <a class="collapse-item active"onclick="traer_grilla_retenido()" >Cambio de disposicion</a>
        <a class="collapse-item active"  onclick="traer_fecha_involucrada()">Fechas involucradas</a>
       </div>
    </div>
      </li>

      <!-- Nav Item - Utilities Collapse Menu -->
      <li class="nav-item">
    <a class="nav-link collapsed"   data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
      <i class="fas fa-fw fa-wrench"></i>
      <span>Reportes</span>
    </a>
    <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
      <div class="bg-white py-2 collapse-inner rounded">
        <h6 class="collapse-header">Menu</h6>
        <a class="collapse-item" onclick="traer_reporte_lotes()" >PTC</a>
        <a class="collapse-item" onclick="traer_reporte_mixtos_historial()" >Mixtos</a>
        <a class="collapse-item" onclick="traer_reporte_mixtos()" >Mixtos disponibles</a>
        <a class="collapse-item" onclick="traer_reporte_ptc_excel()" >PTC en excel</a>
        <a class="collapse-item" onclick="traer_reporte_clasificados()" >Stock huevos clasificados</a>
        <a class="collapse-item" onclick="traer_reporte_transferencia()">Transferencias</a>
      </div>
    </div>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading" id="panel_tit">
    Perfil admin.
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item" id="panel">
    <a class="nav-link collapsed"  data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
      <i class="fas fa-fw fa-folder"></i>
      <span>Panel de control</span>
    </a>
    <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
      <div class="bg-white py-2 collapse-inner rounded">
        <h6 class="collapse-header">Modificaciones</h6>
        <a class="collapse-item " onclick="ir_modificacion_lotes()">Disposicion,motivo,estado. </a>
        <a class="collapse-item" onclick="ir_configuracion_empacadora()" >Empacadoras</a>
        <a class="collapse-item" onclick="ir_cambio_fp_ptc()">Fechas de puestas</a>
        <a class="collapse-item" onclick="ir_cambio_nro_ptc()" >Nro de carro</a>
        <a class="collapse-item" onclick="ir_transformacion_ptc()" >Tipos de huevos</a>
        <div class="collapse-divider"></div>
        <h6 class="collapse-header">Registros costeados</h6>
        <a class="collapse-item"  onclick="ir_liberados_viejo()">Liberados </a>
        <a class="collapse-item" onclick="traer_registro_retenido_costeado()">Retenidos</a>
        <div class="collapse-divider"></div>
        <h6 class="collapse-header">Reportes</h6>
        <a href="reportes/reporte_lotes_mixtos.jasper"></a>
        <a class="collapse-item" onclick="ir_reporte_historico_lotes()">Historicos retenidos</a>

      </div>
    </div>
      </li>

    

      
      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
    <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

    <!-- Topbar -->
    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 fixed-top shadow">

      <!-- Sidebar Toggle (Topbar) -->
      <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
        <i class="fa fa-bars"></i>
      </button>

      <!-- Topbar Search -->
      <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
          <a onclick="traer_menu()"><%=clasificadora%></a> 
      </form>

      <!-- Topbar Navbar -->
      <ul class="navbar-nav ml-auto">

     

        <!-- Nav Item - Alerts -->
        <li class="nav-item dropdown no-arrow mx-1"  id="notificacion">
          <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <i class="fas fa-bell fa-fw"></i>
        <!-- Counter - Alerts -->
        <span class="badge badge-danger badge-counter">1</span>
          </a>
          <!-- Dropdown - Alerts -->
          <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
        <h6 class="dropdown-header bg-danger">
          Alerta retenido
        </h6>
        <a class="dropdown-item d-flex align-items-center" >
          <div class="mr-3">
            <div class="icon-circle bg-danger">
              <i class="fas fa-file-alt text-white"></i>
            </div>
          </div>
          <div onclick="traer_pendiente_liberacion()" > 
              <div class="small text-gray-500" >Aviso</div>
            <span class="font-weight-bold">Cuenta con lotes pendientes a liberar</span>
          </div>
        </a>
         
           </div>
        </li>

        <!-- Nav Item - Messages -->
       

        <div class="topbar-divider d-none d-sm-block"></div>

        <!-- Nav Item - User Information -->
        <li class="nav-item dropdown no-arrow">
          <a class="nav-link dropdown-toggle"   id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%=user_name%></span>
        <img class="img-profile rounded-circle" src="img/yemita.jpg">
         
          </a>
          <!-- Dropdown - User Information -->
          <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
         
          <a class="dropdown-item" onclick="traer_contendor_cambiar_pass_jsp()">
          <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
          Contrase�a
        </a>
          
        <div class="dropdown-divider"></div>
        <a class="dropdown-item"  data-toggle="modal" data-target="#logoutModal">
          <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
          Cerrar sesion
        </a>
          </div>
        </li>

      </ul>

    </nav>
      
    
    
    <div id="div_cargar_menu" class="text-center" style="display: none">
        <div class="spinner-grow" style="width: 3rem; height: 3rem;" role="status">
          <span class="sr-only">Loading...</span>
        </div>
    </div>
    
    <br><br>   <br>  <br> 
    
     <div  class="col-lg-12 mb-4">
    <div   id="contenido" class="row">
    
    </div>
    
    <div id="contenido_2" style="display:none ">
    
    </div>
      
    <div id="contenido_reporte" style="display:none ">
    
    </div> 
      
    <div id="contenido_visualizar"  style="display:none"  >
     
    </div>
       
    <div id="contenido_password" style="display:none ">
    
    </div>
      
    <div id="contenido_retenido" style="display:none ">
    
    </div>   
      <br><br><br><br>
    <div id="contenido_eliminar" style="display:none ">
    
    </div> </div>
      
    
    
      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      
       <footer class="sticky-footer bg-white fixed-bottom ">
    <div class="container my-auto">
      <div class="copyright text-center my-auto">
        <span>Registro PTC 2021 V.1.0</span>
      </div>
    </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
    <div class="modal-header">
      <h5 class="modal-title" id="exampleModalLabel">Preparado para salir?</h5>
      <button class="close" type="button" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">�</span>
      </button>
    </div>
    <div class="modal-body">Selecciona "Salir" si realmente desea terminar la sesion actual.</div>
    <div class="modal-footer">
      <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
      <a class="btn btn-primary" href="cerrarsesion.jsp">Salir</a>
    </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
    <script src="js/jquery-3.5.1.js" type="text/javascript"></script>
    <script src="js/dataTables.js" type="text/javascript"></script>
    <script src="js/dataTables.select.js" type="text/javascript"></script>
    <script src="estilos/js/checkboxes.js" type="text/javascript"></script>
    <script src="estilos/js/dataTables.buttons.js" type="text/javascript"></script>
    <script src="estilos/js/buttons.bootstrap4.min.js" type="text/javascript"></script>
    <script src="estilos/js/jszip.min.js" type="text/javascript"></script>
    <script src="estilos/js/pdfmake.min.js" type="text/javascript"></script>
    <script src="estilos/js/vfs_fonts.js" type="text/javascript"></script>
    <script src="estilos/js/buttons.html5.min.js" type="text/javascript"></script>
    <script src="estilos/js/buttons.print.min.js" type="text/javascript"></script>
    <script src="js/buttons.colVis.min.js.js" type="text/javascript"></script>
    <script src="estilos/js/dataTables.fixedHeader.min.js" type="text/javascript"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="js/sb-admin-2.min.js"></script>
    <script src="estilos/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="js/multiselect.js"></script>
    <script src="js/bootstrap4-toggle.js" type="text/javascript"></script>
    <script src="js/swetalert_net.js" type="text/javascript"></script>
    <script src="lib/picker.js?v=1.0.0"></script>
    <script src="lib/picker.date.js?v=1.1.0"></script>
    <script src="lib/legacy.js?v=1.1.0"></script>
    <script src="js/enviar_datos.js?v=1.1.2" type="text/javascript"></script>
    <script src="js/traer_clases.js?v=1.1.2" type="text/javascript"></script>
    <script src="js/envio_retenido_liberado.js?v=1.1.2" type="text/javascript"></script>
    <script src="js/transferencia.js?v=1.1.2" type="text/javascript"></script>
    <script src="js/grilla.js" type="text/javascript"></script>

  <!-- Custom scripts for all pages-->
 
</body>

</html>
