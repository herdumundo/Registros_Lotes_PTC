<%-- 
    Document   : index
    Created on : 30/01/2020, 02:38:00 PM
    Author     : hvelazquez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>YEMITA</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
 
  <!-- Custom styles for this template-->
  <link href="estilos/css/sb-admin-2.css" rel="stylesheet" type="text/css"/>
</head>

<body   class="bg-gradient-primary" >
   <div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

      <div class="col-xl-10 col-lg-12 col-md-9">

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
              <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Iniciar sesión</h1>
                  </div>
                    <form class="user" action="controles/logincontrol.jsp">
                    <div class="form-group">
                        <input type="text" class="form-control form-control-user" id="usuario"  name="usuario"placeholder="Ingresar usuario...">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control form-control-user" id="pass" name="pass" placeholder="Ingresar contraseña">
                    </div>
                    <div class="form-group">
                      
                    </div>
                                  <button class="btn btn-outline-primary btn-user btn-block"  type="submit"><b>Ingresar</b> </button>

                    <hr>
                   </form>
                  <hr>
                   
                  
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>

    </div>

  </div>
 
  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>
  <script src="js/traer_clases.js"></script>

</body>

</html>
