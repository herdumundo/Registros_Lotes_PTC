 <!DOCTYPE html>
 <html lang="en"  >
<%@ page session="true" %>
<%@include  file="chequearsesion.jsp" %>
<%    String usuario       = (String) sesionOk.getAttribute("usuario");
      String clasificadora = (String) sesionOk.getAttribute("clasificadora");
      String area_cch = (String) sesionOk.getAttribute("area_cch");
      String user_name = (String) sesionOk.getAttribute("nombre_usuario");
      String perfil = (String) sesionOk.getAttribute("perfil");
%>
<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    Lotes PTC  </title>
  <meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
 
  <link href="assets/css/estilo.css" rel="stylesheet" type="text/css"/>
  <link rel="stylesheet" href="assets/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
  
  
  
  <!-- CSS Files -->
  <link href="assets/css/material-dashboard.css?v=2.1.2" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="assets/demo/demo.css" rel="stylesheet" />
  
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="estilos/css/sweetalert.css" rel="stylesheet" type="text/css"/>
        <link href="estilos/css/styles_loading.css" rel="stylesheet">  
        <link href="estilos/css/bootstrap4-toggle.min.css" rel="stylesheet" type="text/css"/>
         <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet" type="text/css"/>
        <link href="lib/themes/main.css?v=1.0.2" rel="stylesheet" />
        <link href="lib/themes/default.css?v=1.0.2" rel="stylesheet" id="theme_base" />
        <link href="lib/themes/default.date.css?v=1.0.2" rel="stylesheet" id="theme_date" />
        <link href="estilos/css/colores.css" rel="stylesheet" type="text/css"/>
        <link href="estilos/css/parpadeo.css" rel="stylesheet" type="text/css"/>
</head>

<body class="">
  <div class="wrapper ">
     <div class="sidebar" data-color="purple" data-background-color="white" data-image="assets/img/huevos.jpg">
        <input type="hidden" value="<%=perfil%>" id="perfil">
      <div class="logo"><a   class="simple-text logo-normal">
           <%=area_cch%>
        </a></div>
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li class="nav-item active  ">
              <a class="nav-link" onclick="traer_menu()">
              <i class="material-icons"> </i>
              <p>Principal</p>
            </a>
          </li>
          <li class="nav-item ">
              <a class="nav-link" onclick="traer_contendor_cambiar_pass_jsp()">
              <i class="material-icons">person</i>
              <p>Cambiar clave</p>
            </a>
          </li> <li class="nav-item ">
              <a class="nav-link"  data-toggle="modal" data-target="#logoutModal">
              <i class="material-icons">person</i>
              <p>Cerrar sesion</p>
            </a>
          </li>
         
         
         
           
        </ul>
      </div>
    </div>
    <div class="main-panel ">
      <!-- Navbar -->
      <nav class="navbar sticky-top navbar-expand-lg bg-dark">
        <div class="container-fluid" >
            <a class="navbar-brand"   style="font-weight: bold;" onclick="traer_menu()" ><%=user_name%></a>

          <button class="navbar-toggler" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
            <span class="sr-only">Toggle navigation</span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
          </button>
          <div class="collapse navbar-collapse justify-content-end">
          
            <ul class="navbar-nav">
               
              <li class="nav-item dropdown">
                <a class="nav-link" href="javascript:;" id="navbarDropdownProfile" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="material-icons">person</i>
                  
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownProfile">
               
                  
              </li>
            </ul>
          </div>
        </div>
      </nav>
      <input type="hidden" value="<%=perfil%>" >
             
     <div class="content card">   
          
          
          
       <div id="contenido" class="row"   >
        
        </div>
      
    
         <div id="contenido_2" style="display:none " >
        
        </div> 
        </div> 
      
   </div>
  </div>
  
    
    
    
    
      <div class="fixed-plugin" id="div_panel" style="display: none"  >
    <div class="dropdown show-dropdown" >
      <a href="#" data-toggle="dropdown">
     <i class="material-icons fa-3x ">privacy_tip</i>

      </a>
        <ul class="dropdown-menu">
        <li class="header-title"> Panel de control</li>
        
         
        <li class="button-container" onclick="ir_liberados_viejo()">
          <a    class="btn btn-primary btn-block">CARROS LIBERADOS</a>
        </li>
        
        <li class="button-container" onclick="traer_registro_retenido_costeado()">
          <a   class="btn btn-primary btn-block">CARROS RETENIDOS</a>
        </li>
        
        <li class="button-container" onclick="ir_modificacion_lotes()">
          <a   class="btn btn-primary btn-block">ESTADO DEL PRODUCTO , MOTIVO DE RETENCION Y DISPOSICION</a>
        </li>
        
        <li class="button-container" onclick="ir_reporte_historico_lotes()">
          <a   class="btn btn-primary btn-block">REPORTE HISTORICOS RETENIDOS</a>
        </li>
        
        <li class="button-container" onclick="ir_configuracion_empacadora()"> 
          <a   class="btn btn-primary btn-block">APERTURA Y CIERRE DE EMPACADORAS</a>
        </li>
        
        <li class="button-container" onclick="ir_cambio_fp_ptc()">
          <a   class="btn btn-primary btn-block">MODIFICACION FECHAS DE PUESTAS</a>
        </li>
        
        <li class="button-container" onclick="ir_cambio_nro_ptc()">
          <a   class="btn btn-primary btn-block">MODIFICACION NRO DE CARRO</a>
        </li>
        <li class="button-container" onclick="ir_transformacion_ptc()">
          <a   class="btn btn-primary btn-block">TRANSFORMACION TIPOS DE HUEVOS</a>
        </li>
        
         
        </ul></div></div>
    
    
      
       
    
    
  <!--   Core JS Files   -->
  <script src="assets/js/core/jquery.min.js"></script>
  <script src="assets/js/core/popper.min.js"></script>
  <script src="assets/js/core/bootstrap-material-design.min.js"></script>
  <script src="assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!-- Plugin for the momentJs  -->
  <script src="assets/js/plugins/moment.min.js"></script>
  <!--  Plugin for Sweet Alert -->
  <script src="assets/js/plugins/sweetalert2.js"></script>
  <!-- Forms Validations Plugin -->
  <script src="assets/js/plugins/jquery.validate.min.js"></script>
  <!-- Plugin for the Wizard, full documentation here: https://github.com/VinceG/twitter-bootstrap-wizard -->
  <script src="assets/js/plugins/jquery.bootstrap-wizard.js"></script>
  <!--	Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
  <script src="assets/js/plugins/bootstrap-selectpicker.js"></script>
  <!--  Plugin for the DateTimePicker, full documentation here: https://eonasdan.github.io/bootstrap-datetimepicker/ -->
  <script src="assets/js/plugins/bootstrap-datetimepicker.min.js"></script>
  <!--  DataTables.net Plugin, full documentation here: https://datatables.net/  -->
  <script src="assets/js/plugins/jquery.dataTables.min.js"></script>
  <!--	Plugin for Tags, full documentation here: https://github.com/bootstrap-tagsinput/bootstrap-tagsinputs  -->
  <script src="assets/js/plugins/bootstrap-tagsinput.js"></script>
  <!-- Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
  <script src="assets/js/plugins/jasny-bootstrap.min.js"></script>
  <!--  Full Calendar Plugin, full documentation here: https://github.com/fullcalendar/fullcalendar    -->
  <script src="assets/js/plugins/fullcalendar.min.js"></script>
  <!-- Vector Map plugin, full documentation here: http://jvectormap.com/documentation/ -->
  <script src="assets/js/plugins/jquery-jvectormap.js"></script>
  <!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
  <script src="assets/js/plugins/nouislider.min.js"></script>
  <!-- Include a polyfill for ES6 Promises (optional) for IE11, UC Browser and Android browser support SweetAlert -->
   <!-- Library for adding dinamically elements -->
  <script src="assets/js/plugins/arrive.min.js"></script>
  <!--  Google Maps Plugin    -->
   <!-- Chartist JS -->
  <script src="assets/js/plugins/chartist.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="assets/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="assets/js/material-dashboard.js?v=2.1.2" type="text/javascript"></script>
  <!-- Material Dashboard DEMO methods, don't include it in your project! -->
  <script src="assets/demo/demo.js"></script>
  <script>
    $(document).ready(function() {
      $().ready(function() {
        $sidebar = $('.sidebar');

        $sidebar_img_container = $sidebar.find('.sidebar-background');

        $full_page = $('.full-page');

        $sidebar_responsive = $('body > .navbar-collapse');

        window_width = $(window).width();

        fixed_plugin_open = $('.sidebar .sidebar-wrapper .nav li.active a p').html();

        if (window_width > 767 && fixed_plugin_open == 'Dashboard') {
          if ($('.fixed-plugin .dropdown').hasClass('show-dropdown')) {
            $('.fixed-plugin .dropdown').addClass('open');
          }

        }

        $('.fixed-plugin a').click(function(event) {
          // Alex if we click on switch, stop propagation of the event, so the dropdown will not be hide, otherwise we set the  section active
          if ($(this).hasClass('switch-trigger')) {
            if (event.stopPropagation) {
              event.stopPropagation();
            } else if (window.event) {
              window.event.cancelBubble = true;
            }
          }
        });

        $('.fixed-plugin .active-color span').click(function() {
          $full_page_background = $('.full-page-background');

          $(this).siblings().removeClass('active');
          $(this).addClass('active');

          var new_color = $(this).data('color');

          if ($sidebar.length != 0) {
            $sidebar.attr('data-color', new_color);
          }

          if ($full_page.length != 0) {
            $full_page.attr('filter-color', new_color);
          }

          if ($sidebar_responsive.length != 0) {
            $sidebar_responsive.attr('data-color', new_color);
          }
        });

        $('.fixed-plugin .background-color .badge').click(function() {
          $(this).siblings().removeClass('active');
          $(this).addClass('active');

          var new_color = $(this).data('background-color');

          if ($sidebar.length != 0) {
            $sidebar.attr('data-background-color', new_color);
          }
        });

        $('.fixed-plugin .img-holder').click(function() {
          $full_page_background = $('.full-page-background');

          $(this).parent('li').siblings().removeClass('active');
          $(this).parent('li').addClass('active');


          var new_image = $(this).find("img").attr('src');

          if ($sidebar_img_container.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
            $sidebar_img_container.fadeOut('fast', function() {
              $sidebar_img_container.css('background-image', 'url("' + new_image + '")');
              $sidebar_img_container.fadeIn('fast');
            });
          }

          if ($full_page_background.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
            var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

            $full_page_background.fadeOut('fast', function() {
              $full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
              $full_page_background.fadeIn('fast');
            });
          }

          if ($('.switch-sidebar-image input:checked').length == 0) {
            var new_image = $('.fixed-plugin li.active .img-holder').find("img").attr('src');
            var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

            $sidebar_img_container.css('background-image', 'url("' + new_image + '")');
            $full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
          }

          if ($sidebar_responsive.length != 0) {
            $sidebar_responsive.css('background-image', 'url("' + new_image + '")');
          }
        });

        $('.switch-sidebar-image input').change(function() {
          $full_page_background = $('.full-page-background');

          $input = $(this);

          if ($input.is(':checked')) {
            if ($sidebar_img_container.length != 0) {
              $sidebar_img_container.fadeIn('fast');
              $sidebar.attr('data-image', '#');
            }

            if ($full_page_background.length != 0) {
              $full_page_background.fadeIn('fast');
              $full_page.attr('data-image', '#');
            }

            background_image = true;
          } else {
            if ($sidebar_img_container.length != 0) {
              $sidebar.removeAttr('data-image');
              $sidebar_img_container.fadeOut('fast');
            }

            if ($full_page_background.length != 0) {
              $full_page.removeAttr('data-image', '#');
              $full_page_background.fadeOut('fast');
            }

            background_image = false;
          }
        });

        $('.switch-sidebar-mini input').change(function() {
          $body = $('body');

          $input = $(this);

          if (md.misc.sidebar_mini_active == true) {
            $('body').removeClass('sidebar-mini');
            md.misc.sidebar_mini_active = false;

            $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar();

          } else {

            $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar('destroy');

            setTimeout(function() {
              $('body').addClass('sidebar-mini');

              md.misc.sidebar_mini_active = true;
            }, 300);
          }

          // we simulate the window Resize so the charts will get updated in realtime.
          var simulateWindowResize = setInterval(function() {
            window.dispatchEvent(new Event('resize'));
          }, 180);

          // we stop the simulation of Window Resize after the animations are completed
          setTimeout(function() {
            clearInterval(simulateWindowResize);
          }, 1000);

        });
      });
    });
  </script>
  <script>
    $(document).ready(function() {
      // Javascript method's body can be found in assets/js/demos.js
      md.initDashboardPageCharts();

    });
  </script>
  
     <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
         <script src="estilos/vendor/jquery-easing/jquery.easing.min.js"></script>
        <script src="js/multiselect.js"></script>
        <script src="js/bootstrap4-toggle.js" type="text/javascript"></script>
        <script src="js/swetalert_net.js" type="text/javascript"></script>
        <script src="js/jquery.dataTables.js" type="text/javascript"></script>
        <script src="js/dataTables.bootstrap4.js" type="text/javascript"></script>
        <script src="lib/picker.js?v=1.0.3"></script>
        <script src="lib/picker.date.js?v=1.0.3"></script>
        <script src="lib/legacy.js?v=1.0.3"></script>
        <script src="js/enviar_datos.js?v=1.0.3" type="text/javascript"></script>
        <script src="js/traer_clases.js?v=1.1.5" type="text/javascript"></script>
        <script src="js/envio_retenido_liberado.js?v=1.0.7" type="text/javascript"></script>
        <script src="js/transferencia.js?v=1.0.9" type="text/javascript"></script>
        <script src="js/grilla.js" type="text/javascript"></script>
</body>

</html>