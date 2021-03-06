
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
        <!-- ////////////////////////////////////////////////////////////////////////////////////////////////-->
        <div class="main-wrapper">
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
                            <a class="dropdown-item" href="logout.jsp">Cerrar Sesión</a>
                        </div>
                    </li>
                </ul>
                <div class="dropdown mobile-user-menu float-right">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
                    <div class="dropdown-menu dropdown-menu-right">
                        <a class="dropdown-item" href="perfil.jsp">Mi Perfil</a>
                        <a class="dropdown-item" href="editar-perfil.jsp">Editar Perfil</a>
                        <a class="dropdown-item" href="logout.jsp">Cerrar Sesión</a>
                    </div>
                </div>
            </div><!--HEADER -->

            <div class="sidebar" id="sidebar"><!--SIDEBAR -->
                <div class="sidebar-inner slimscroll">
                    <div id="sidebar-menu" class="sidebar-menu">
                        <ul>
                            <li class="menu-title">Menú</li>
                            <li class="active">
                                <a href="index.jsp"><i class="fa fa-home"></i> <span>Inicio</span></a>
                            </li>
                            <li class="submenu">
                                <a href="#"><i class="fa fa-user-md"></i> <span> Doctores </span> <span class="menu-arrow"></span></a>
                                <ul style="display: none;">
                                    <li><a href="doctores.jsp">Lista de Doctores</a></li>

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
                        <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
                            <div class="dash-widget">
                                <span class="dash-widget-bg1"><i class="fa fa-stethoscope" aria-hidden="true"></i></span>
                                <div class="dash-widget-info text-right">
                                    <h3>98</h3>
                                    <span class="widget-title1">Doctores <i class="fa fa-check" aria-hidden="true"></i></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
                            <div class="dash-widget">
                                <span class="dash-widget-bg2"><i class="fa fa-user-o"></i></span>
                                <div class="dash-widget-info text-right">
                                    <h3>1072</h3>
                                    <span class="widget-title2">Pacientes <i class="fa fa-check" aria-hidden="true"></i></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
                            <div class="dash-widget">
                                <span class="dash-widget-bg3"><i class="fa fa-user-md" aria-hidden="true"></i></span>
                                <div class="dash-widget-info text-right">
                                    <h3>72</h3>
                                    <span class="widget-title3">Atendidos <i class="fa fa-check" aria-hidden="true"></i></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
                            <div class="dash-widget">
                                <span class="dash-widget-bg4"><i class="fa fa-heartbeat" aria-hidden="true"></i></span>
                                <div class="dash-widget-info text-right">
                                    <h3>618</h3>
                                    <span class="widget-title4">Pendientes <i class="fa fa-check" aria-hidden="true"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-md-6 col-lg-6 col-xl-6">
                            <div class="card">
                                <div class="card-body">
                                    <div class="chart-title">
                                        <h4>Ingreso de Pacientes en Total</h4>
                                        <span class="float-right"><i class="fa fa-caret-up" aria-hidden="true"></i> 15% Mayor que el Mes Pasado</span>
                                    </div>
                                    <canvas id="linegraph"></canvas>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-md-6 col-lg-6 col-xl-6">
                            <div class="card">
                                <div class="card-body">
                                    <div class="chart-title">
                                        <h4>Solicitud de Turnos</h4>
                                        <div class="float-right">
                                            <ul class="chat-user-total">
                                                <li><i class="fa fa-circle current-users" aria-hidden="true"></i>Nuevos</li>
                                                <li><i class="fa fa-circle old-users" aria-hidden="true"></i> Antiguos</li>
                                            </ul>
                                        </div>
                                    </div>
                                    <canvas id="bargraph"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>

        <div class="sidebar-overlay"></div>
        <script src="assets/js/jquery-3.2.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.slimscroll.js"></script>
        <script src="assets/js/Chart.bundle.js"></script>
        <script src="assets/js/chart.js"></script>
        <script src="assets/js/app.js"></script>

    </body>



</html>