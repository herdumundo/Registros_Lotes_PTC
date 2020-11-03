 
<html lang="en">
 
 
<head>
    <%@ page language="java" import="java.sql.*" errorPage="error.jsp" %>
        <%@include  file="chequearsesion.jsp" %>
<%    String usuario = (String) sesionOk.getAttribute("usuario");
String clasificadora = (String) sesionOk.getAttribute("clasificadora");
String user_name = (String) sesionOk.getAttribute("nombre_usuario");
String cod_usuario = (String) sesionOk.getAttribute("cod_usuario");

%>
<%@ page language="java" import="java.sql.*" errorPage="error.jsp" %>
 <jsp:useBean id="conexion" class="clases.bdconexion1" scope="page" />
 <jsp:useBean id="fuente" class="clases.fuentedato" scope="page"/>
 
  
 
 

 <link rel="stylesheet" type="text/css" href="grilla.css">
<script type="text/javascript" src="grilla.js"></script>

<script src="jquery/cancel_atras.js"></script>
 <meta http-equiv="refresh" content="3000; url=menu_fallas.jsp">
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
  
<!--///////////////////////////////////CALENDARIO BOOSTRAP////////////////////////////////////////////////////////////////////////--> 
<script src="jquery/data_picker.js"></script>
  <script src="jquery/data_picker_2.js" type="text/javascript"></script>
    <link href="https://cdn.jsdelivr.net/npm/gijgo@1.9.10/css/gijgo.min.css" rel="stylesheet" type="text/css" />
<!--///////////////////////////////////////////////////////////////////////////////////////////////////////////--> 


</head>


<body onload="nobackbutton();" class="fixed-nav sticky-footer bg-dark" id="page-top">
  <!-- Navigation-->
 
   
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
      <a class="navbar-brand" href="#">CLASIFICADORA:<%=clasificadora%>||<i class="fa fa-fw fa-user"></i>  USUARIO:<%=user_name%> </a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
          <a class="nav-link" href="#">
          <input type="text" class="" name="linea" style="display:none"value="LINEA0" readonly="readonly" required="true">
          </a>
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
        <form id="frm_agregar" name="frm_agregar" action="control_cambio_pass.jsp" method="POST">
         <span class="input-group-addon">USUARIO</span> 
  
         <input type="text" class="form-control" name="usuario"  value="<%=usuario%> " readonly="readonly" required="true">
                  <br><br>
         
         <div class="input-append">  
       
         
                 <input name="txt_pass" id="txt_pass" type="text"  placeholder="INGRESE NUEVA CONTRASEÑA"required class="form-control">
                </div>   
             <br><br>
          
           <input type="submit" value="CAMBIAR" id="btn_registrar" name="btn_registrar" class="form-control btn btn-primary " style="  height:70px"/>
 
  
    
        </form>
     <form action="menu.jsp">
    <input class="form-control btn btn-warning "  style="  height:70px" type="submit" value="CANCELAR" />
</form>
      
    </div></div>
                  
                 
        
      
    <footer class="sticky-footer">
      <div class="container">
        <div class="text-center">
          <small>Vimar-Py 2018</small>
        </div>
      </div>
    </footer>
     
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fa fa-angle-up"></i>
    </a>
     
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel"></h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">Desea cerrar sesión?</div>
          <div class="modal-footer">
              <a class="btn btn-primary" href="cerrarsesion.jsp">Aceptar</a>
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
            
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
 <div>
        
        
        
        
        
      
