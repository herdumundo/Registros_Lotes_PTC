<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="estilos/loading_efecto.css" rel="stylesheet" type="text/css"/>
<meta name="viewport" content="width=device-width, user-scalable=no">

<div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->

    <!-- Icon -->
    <div class="fadeIn first">
     
      <img src="img/Yemita.png" alt=""/>
    </div>

    <!-- Login Form -->
    <form action="controles/logincontrol.jsp">
        <input type="text" id="usuario" class="fadeIn second" name="usuario" placeholder="Ingrese su usuario" required="required">
      <input type="password" id="pass" class="fadeIn third" name="pass" placeholder="Ingrese su contrase�a" required="required">
      <input type="submit" class="fadeIn fourth" value="INGRESAR">
    </form>

    <!-- Remind Passowrd -->
    <div id="formFooter">
        <div class="alert alert-primary" role="alert">
                <span class="glyphicon glyphicon-exclamation-sign">ERROR, USUARIO O CONTRASE�A INCORRECTA</span>
             </div>
    </div>

  </div>
</div>