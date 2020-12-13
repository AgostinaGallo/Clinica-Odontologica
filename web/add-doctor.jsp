

<%@page import="Logica.ControladoraLogica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
        <title>Clinica Odontologica</title>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
    </head>

    <body>
        <!-- Chequea Sesion de Usuario -->
        <% HttpSession miSesion = request.getSession();
            // Verifica si existe el usuario que inicio sesion, SINO vuelve al Login.jsp
            String username = (String) request.getSession().getAttribute("username");
            if (username == null) {
                response.sendRedirect("login-nosession.jsp");

            } else {
                ControladoraLogica control = new ControladoraLogica();
                miSesion.setAttribute("control", control);
            }
        %>
        <div class="main-wrapper">
            <!-- ////////////////////////////////////////////////////////////////////////////////////////////////-->
            <div class="header"><!--HEADER -->
                <div class="header-left">
                    <a href="index.jsp" class="logo">
                        <img src="assets/img/logo.png" width="35" height="35" alt=""> <span>Clínica</span>
                    </a>
                </div>
                <a id="toggle_btn" href="javascript:void(0);"><i class="fa fa-bars"></i></a>
                <a id="mobile_btn" class="mobile_btn float-left" href="#sidebar"><i class="fa fa-bars"></i></a>
                <ul class="nav user-menu float-right">


                    <li class="nav-item dropdown has-arrow">
                        <a href="#" class="dropdown-toggle nav-link user-link" data-toggle="dropdown">
                            <span class="user-img">
                                <img class="rounded-circle" src="assets/img/user.jpg" width="24" alt="Admin">
                                <span class="status online"></span>
                            </span>
                            <span><%=request.getSession().getAttribute("username")%></span>
                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="perfil.jsp">Mi Perfil</a>
                            <a class="dropdown-item" href="editar-perfil.jsp">Editar Perfil</a>
                            <a class="dropdown-item" href="login.jsp">Cerrar Sesión</a>
                        </div>
                    </li>
                </ul>
                <div class="dropdown mobile-user-menu float-right">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
                    <div class="dropdown-menu dropdown-menu-right">
                        <a class="dropdown-item" href="perfil.jsp">Mi Perfil</a>
                        <a class="dropdown-item" href="editar-perfil.jsp">Editar Perfil</a>
                        <a class="dropdown-item" href="login.jsp">Cerrar Sesión</a>
                    </div>
                </div>
            </div><!--HEADER -->

            <div class="sidebar" id="sidebar"><!--SIDEBAR -->
                <div class="sidebar-inner slimscroll">
                    <div id="sidebar-menu" class="sidebar-menu">
                        <ul>
                            <li class="menu-title">Menú</li>
                            <li>
                                <a href="index.jsp"><i class="fa fa-home"></i> <span>Inicio</span></a>
                            </li>
                            <li class="submenu">
                                <a href="#"><i class="fa fa-user-md"></i> <span> Doctores </span> <span class="menu-arrow"></span></a>
                                <ul style="display: none;">
                                    <li><a class="active" href="doctores.jsp">Lista de Doctores</a></li>
                                    <li><a href="horarioatencion.jsp">Horarios de Atención</a></li>
                                </ul>
                            </li>
                            <li class="submenu">
                                <a href="#"><i class="fa fa-users"></i> <span> Pacientes </span> <span class="menu-arrow"></span></a>
                                <ul style="display: none;">
                                    <li><a href="pacientes.jsp">Lista de Pacientes</a></li>
                                    <li><a href="responsables.jsp">Responsables</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="turnos.jsp"><i class="fa fa-calendar"></i> <span>Turnos</span></a>
                            </li>
                            <li>
                                <a href="secretarias.jsp"><i class="fa fa-address-book"></i> <span>Secretarias</span></a>
                            </li>
                            <li class="submenu">
                                <a href="#"><i class="fa fa-file-text-o"></i> <span> Informes </span> <span class="menu-arrow"></span></a>
                                <ul style="display: none;">
                                    <li><a href="informe-atendidos.jsp">Atendidos por Día</a></li>
                                    <li><a href="informe-turnos.jsp">Turnos de Doctor por Día</a></li>
                                    <li><a href="informe-cobertura.jsp">Pacientes con/sin Cobertura</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div><!--SIDEBAR -->
            <!-- ////////////////////////////////////////////////////////////////////////////////////////////////-->
            <div class="page-wrapper">
                <div class="content">
                    <div class="row">
                        <div class="col-sm-12">
                            <h4 class="page-title">Agregar Doctor</h4>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <form action="addDoctorServlet" method="post">
                                <div class="card-box">
                                    <h4 class="card-title">Complete todos los datos del doctor</h4>
                                    <div class="form-group row">
                                        <label class="col-form-label col-lg-2">D.N.I. (sin puntos)</label><!-- DNI -->
                                        <div class="col-md-4">
                                            <div class="input-group mb-3">
                                                <input type="text" class="form-control" aria-label="dni" aria-describedby="basic-addon2" name="dni" required>
                                            </div>
                                        </div>
                                        <label class="col-form-label col-lg-1">Sexo</label><!-- SEXO -->
                                        <div class="col-md-4">
                                            <div class="form-check-inline">
                                                <label class="form-check-label ">
                                                    <input type="radio" name="sexo" value="Femenino" class="form-check-input" required>Femenino
                                                </label>
                                            </div>
                                            <div class="form-check-inline">
                                                <label class="form-check-label">
                                                    <input type="radio" name="sexo" value="Masculino" class="form-check-input">Masculino
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-form-label col-lg-2">Nombre/s</label><!-- NOMBRE -->
                                        <div class="col-md-4">
                                            <div class="input-group mb-3">
                                                <input type="text" class="form-control" aria-label="nombre" aria-describedby="basic-addon2" name="nombre" required>
                                            </div>
                                        </div>
                                        <label class="col-form-label col-lg-1">Apellido/s</label><!-- APELLIDO -->
                                        <div class="col-md-4">
                                            <div class="input-group mb-3">
                                                <input type="text" class="form-control" aria-label="apellido" aria-describedby="basic-addon2" name="apellido" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-form-label col-lg-2">Dirección</label><!-- DIRECCION -->
                                        <div class="col-md-4">
                                            <div class="input-group mb-3">
                                                <input type="text" class="form-control" aria-label="direccion" aria-describedby="basic-addon2" name="direccion" required>
                                            </div>
                                        </div>
                                        <label class="col-form-label col-lg-2">Fecha de Nacimiento</label><!-- FECHA NACIMIENTO -->
                                        <div class="col-md-4">
                                            <div class="input-group mb-3">
                                                <input type="date" name="fecha_nacimiento" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-form-label col-lg-2">Teléfono</label><!-- TELEFONO -->
                                        <div class="col-md-4">
                                            <div class="input-group mb-3">
                                                <input type="text" class="form-control" aria-label="telefono" aria-describedby="basic-addon2" name="telefono" required>
                                            </div>
                                        </div>
                                        <label class="col-form-label col-lg-1">E-mail</label><!-- EMAIL -->
                                        <div class="col-md-4">
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="basic-addon1">@</span>
                                                </div>
                                                <input type="email" class="form-control" aria-label="email" aria-describedby="basic-addon1" name="email" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-form-label col-lg-2">Ciudad</label><!-- CIUDAD -->
                                        <div class="col-md-4">
                                            <div class="input-group mb-3">
                                                <input type="text" class="form-control" aria-label="ciudad" aria-describedby="basic-addon2" name="ciudad" required>
                                            </div>
                                        </div>
                                        <label class="col-form-label col-lg-1">Provincia</label><!-- PROVINCIA -->
                                        <div class="col-md-4">
                                            <div class="input-group mb-3">
                                                <input type="text" class="form-control" aria-label="provincia" aria-describedby="basic-addon2" name="provincia" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row ">
                                        <label class="col-form-label col-lg-2">Especialidad</label>
                                        <div class="col-md-4">
                                            <div class="input-group center">
                                                <select name="especialidad" class="form-control">
                                                    <option value="Endodoncia">Endodoncia</option>
                                                    <option value="Implantes">Implantes</option>
                                                    <option value="Odontopediatria">Odontopediatria</option>
                                                    <option value="Ortodoncia">Ortodoncia</option>
                                                    <option value="Peridoncia">Peridoncia</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="m-t-20 text-center">
                                    <button type="submit" class="btn btn-primary submit-btn">Crear Doctor</button>
                                </div>
                            </form><!-- /form -->
                        </div>
                    </div>

                </div>
            </div>
            <div class="sidebar-overlay" data-reff=""></div>
            <script src="assets/js/jquery-3.2.1.min.js"></script>
            <script src="assets/js/popper.min.js"></script>
            <script src="assets/js/bootstrap.min.js"></script>
            <script src="assets/js/jquery.slimscroll.js"></script>
            <script src="assets/js/select2.min.js"></script>
            <script src="assets/js/moment.min.js"></script>
            <script src="assets/js/bootstrap-datetimepicker.min.js"></script>
            <script src="assets/js/app.js"></script>
    </body>
</html>

