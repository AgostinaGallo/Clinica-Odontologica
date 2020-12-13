
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
        <title>Clínica Odontologica</title>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <!--[if lt IE 9]>
                    <script src="assets/js/html5shiv.min.js"></script>
                    <script src="assets/js/respond.min.js"></script>
            <![endif]-->
    </head>

    <body>
        <div class="main-wrapper  account-wrapper">
            <div class="account-page">
                <div class="account-center">
                    <div class="account-box">
                        <form action="registerServlet" class="form-signin" method="post">
                            <div class="account-logo">
                                <a href="#"><img src="assets/img/logo-dark.png"></a>
                            </div>
                            <div class="form-group">
                                <label>Nombre de Usuario</label>
                                <input name="USERNAME" id="USERNAME" type="text" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Correo Electrónico</label>
                                <input name="EMAIL" id="EMAIL" type="email" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Contraseña</label>
                                <input name="CONTRASENIA" id="CONTRASENIA" type="password" class="form-control">
                            </div>
                            <div class="form-group text-center">
                                <button class="btn btn-primary account-btn" type="submit">Registrarte</button>
                            </div>
                            <div class="text-center login-link">
                                ¿Ya posees una cuenta? <a href="login.jsp"><b>Iniciar Sesión</b></a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script src="assets/js/jquery-3.2.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/app.js"></script>
    </body>


    <!-- register24:03-->
</html>