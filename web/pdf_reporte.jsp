<!DOCTYPE html>
<html lang="en">
<%@ page session="true" %>
<%@include  file="chequearsesion.jsp" %>
<%    String usuario       = (String) sesionOk.getAttribute("usuario");
      String clasificadora = (String) sesionOk.getAttribute("clasificadora");
        String user_name = (String) sesionOk.getAttribute("nombre_usuario");

%>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>MAEHARA</title>
  <!-- Bootstrap core CSS-->
  <link href="estilos/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="estilos/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Page level plugin CSS-->
  <link href="estilos/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="estilos/css/sb-admin.css" rel="stylesheet">
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
  <!-- Navigation-->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
<a class="navbar-brand" href="#">CLASIFICADORA <%=clasificadora%> ||  <i class="fa fa-fw fa-user"></i>  USUARIO: <%=user_name%></a>
  
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
           
        </li>
        
      
        
         
        
      </ul>
      <ul class="navbar-nav sidenav-toggler">
        <li class="nav-item">
          <a class="nav-link text-center" id="sidenavToggler">
            <i class="fa fa-fw fa-angle-left"></i>
          </a>
        </li>
      </ul>
      <ul class="navbar-nav ml-auto">
         
        
         
        <li class="nav-item">
          <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
            <i class="fa fa-fw fa-sign-out"></i>Cerrar sesion</a>
        </li>
      </ul>
    </div>
    
    
  </nav>
  <div class="content-wrapper">
    <div class="container-fluid">
      <!-- Breadcrumbs-->
      <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="menu.jsp">Menú</a>
        </li>
        <li class="breadcrumb-item active">REPORTES CCHB</li>
      </ol>
      <!-- Icon Cards-->
       
   
      <script src="jquery/data_picker.js"></script>
      <link rel="stylesheet" href="data_picke.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
      <script src="jquery/data_picker_2.js" type="text/javascript"></script>
      <link href="https://cdn.jsdelivr.net/npm/gijgo@1.9.10/css/gijgo.min.css" rel="stylesheet" type="text/css" />
    
      <form name="form1" action="reporte_control_b.jsp" target="_black">
    
    <input type="text" class="" name="clasificadora" style="display:none"value="<%=clasificadora%> " readonly="readonly" required="true">
 
    <div class="input-append">  
        <input id="calendario" name="calendario" data-format="yyyy-mm-dd"  width="276" required="true"  />
    <script>
        $('#calendario').datepicker({
            uiLibrary: 'bootstrap4'
        });
    </script></div> 
    
      
          
          
           
          
        <script type="text/javascript"   src="fallas.js"></script>
        <link rel="stylesheet"  type="text/css" href="grilla.css">
        <script type="text/javascript"   src="grilla_2.js"></script>
          
      <br>   
         <input style="width:260px; height:80px" class="btn btn-success" type="submit" value="Generar reporte"> 
        
          
      </form>
         
          
          
          
          
          
          
          
          
          
       
    </div>
    <!-- /.container-fluid-->
    <!-- /.content-wrapper-->
    <footer class="sticky-footer">
      <div class="container">
        <div class="text-center">
          <small>Maehara-Py 2018</small>
        </div>
      </div>
    </footer>
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fa fa-angle-up"></i>
    </a>
    <!-- Logout Modal-->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Mensaje?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">Desea cerrar sesión?</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
            <a class="btn btn-primary" href="cerrarsesion.jsp">Cerrar</a>
          </div>
        </div>
      </div>
    </div>
    <!-- Bootstrap core JavaScript-->
    <script src="estilos/vendor/jquery/jquery.min.js"></script>
    <script src="estilos/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="estilos/vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Page level plugin JavaScript-->
    <script src="estilos/vendor/chart.js/Chart.min.js"></script>
    <script src="estilos/vendor/datatables/jquery.dataTables.js"></script>
    <script src="estilos/vendor/datatables/dataTables.bootstrap4.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="estilos/js/sb-admin.min.js"></script>
    <!-- Custom scripts for this page-->
    <script src="estilos/js/sb-admin-datatables.min.js"></script>
    <script src="estilos/js/sb-admin-charts.min.js"></script>
  </div>
</body>

</html>
