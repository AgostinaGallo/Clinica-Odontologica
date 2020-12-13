

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

    </head>

    <body>
        <div class="main-wrapper account-wrapper">
            <div class="account-page">
                <div class="account-center">
                    <div class="account-box">
                        <form action="loginServlet" class="form-signin" method="post">
                            <div class="account-logo">
                                <a href="#"><img src="assets/img/logo-dark.png" alt=""></a>
                            </div>
                            <div class="form-group">
                                <label>Usuario o Correo Electrónico</label>
                                <input name="username"  type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Contraseña</label>
                                <input name="contrasenia"  type="password" class="form-control" required>
                            </div>
                            <div class="form-group text-right">
                                <a href="forgot-password.jsp">¿Olvidaste tu contraseña?</a>
                            </div>
                            <div class="form-group text-center">
                                <button type="submit" class="btn btn-primary account-btn">Ingresar</button>
                            </div>
                            <div class="text-center register-link">
                                ¿Aún no tienes una cuenta?  <a href="register.jsp"><b> Registrarse</b></a>
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


</html>