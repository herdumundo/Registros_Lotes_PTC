 <!DOCTYPE html>
 <html lang="en"  >
<%@ page session="true" %>
<%@include  file="chequearsesion.jsp" %>
<%    String usuario       = (String) sesionOk.getAttribute("usuario");
      String clasificadora = (String) sesionOk.getAttribute("clasificadora");
      String user_name = (String) sesionOk.getAttribute("nombre_usuario");
      String perfil = (String) sesionOk.getAttribute("perfil");
%>
<head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
    <title>Yemita</title>
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="estilos/css/sweetalert.css" rel="stylesheet" type="text/css"/>
        <link href="estilos/css/styles_loading.css" rel="stylesheet">  
        <link href="estilos/css/bootstrap4-toggle.min.css" rel="stylesheet" type="text/css"/>
        <link href="estilos/css/sb-admin-2.css" rel="stylesheet" type="text/css"/>
        <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet" type="text/css"/>
        <link href="lib/themes/main.css" rel="stylesheet" />
        <link href="lib/themes/default.css" rel="stylesheet" id="theme_base" />
        <link href="lib/themes/default.date.css" rel="stylesheet" id="theme_date" />
        <link href="estilos/css/colores.css" rel="stylesheet" type="text/css"/>
        <link href="estilos/css/parpadeo.css" rel="stylesheet" type="text/css"/>
 

</head>


<body id="page-top"    >
 
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 fixed-top shadow" >

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3" data-toggle="modal" data-target="#logoutModal">
            <i class="fa fa-bars"></i>
          </button>

  
           <ul class="navbar-nav ml-auto">

            
            <div class="topbar-divider d-none d-sm-block">
                
            </div>
               <input type="hidden" value="<%=perfil%>" id="perfil">
               
             <li class="nav-item dropdown no-arrow" >
              <a class="nav-link dropdown-toggle" onclick="traer_menu()" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <span><font color="black"><b>Menu principal</b></font></span>
                 
               </a>
             
            </li>
<li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle"     >
                  <span class=" text-gray-600 "><font color="black"><b><%=user_name%> Clasificadora:<%=clasificadora%></b></font> </span>
                <img class="img-profile rounded-circle" src="img/yemita.ico" data-toggle="modal" data-target="#logoutModal">
               </a>
              
            </li>
          </ul>

        </nav>
        <!-- End of Topbar -->
        <br> <br> <br><br>
        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
        

          <!-- Content Row -->
       
     <div id="div_cargar_menu" class="text-center" style="display: none">
  <div class="spinner-grow" style="width: 3rem; height: 3rem;" role="status">
    <span class="sr-only">Loading...</span>
  </div>
</div>
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
      
      <div id="contenido_eliminar" style="display:none ">
          </div>
      
   
  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Desea cerrar sesión?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body"></div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
          <a class="btn btn-primary" href="cerrarsesion.jsp">Cerrar</a>
        </div>
      </div>
    </div>
  </div>
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
        <script src="js/sb-admin-2.min.js"></script>
        <script src="estilos/vendor/jquery-easing/jquery.easing.min.js"></script>
        <script src="js/multiselect.js"></script>
        <script src="js/bootstrap4-toggle.js" type="text/javascript"></script>
        <script src="js/swetalert_net.js" type="text/javascript"></script>
        <script src="js/jquery.dataTables.js" type="text/javascript"></script>
        <script src="js/dataTables.bootstrap4.js" type="text/javascript"></script>
        <script src="lib/picker.js"></script>
        <script src="lib/picker.date.js"></script>
        <script src="lib/legacy.js"></script>
        <script src="js/enviar_datos.js?v=1.0.2" type="text/javascript"></script>
        <script src="js/traer_clases.js?v=1.1.2" type="text/javascript"></script>
        <script src="js/envio_retenido_liberado.js?v=1.0.6" type="text/javascript"></script>
        <script src="js/transferencia.js?v=1.0.7" type="text/javascript"></script>
        <script src="js/grilla.js" type="text/javascript"></script>
  </body>
 


</html >

 