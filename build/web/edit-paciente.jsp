
<%@page import="Logica.Paciente"%>
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
                                    <li><a href="doctores.jsp">Lista de Doctores</a></li>

                                    <li><a href="horarioatencion.jsp">Horarios de Atención</a></li>
                                </ul>
                            </li>
                            <li class="submenu">
                                <a href="#"><i class="fa fa-users"></i> <span> Pacientes </span> <span class="menu-arrow"></span></a>
                                <ul style="display: none;">
                                    <li><a class="active" href="pacientes.jsp">Lista de Pacientes</a></li>
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
                        <div class="col-lg-8 offset-lg-2">
                            <%
                                String id_paciente = request.getParameter("id_paciente");
                                ControladoraLogica control = (ControladoraLogica) miSesion.getAttribute("control");
                                Paciente pac = control.getPacienteById(id_paciente);
                            %>
                            <h4 class="page-title">Editar Paciente Nro.: <%=id_paciente%></h4>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-8 offset-lg-2">
                            <form action="editPacienteServlet" method="POST">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>D.N.I. (sin puntos) <span class="text-danger">*</span></label>
                                            <input class="form-control" type="text" name="dni" required value="<%=pac.getDni()%>">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group gender-select">
                                            <label class="gen-label">Sexo: </label>
                                            <div class="form-check-inline">
                                                <label class="form-check-label">
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
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>Nombre <span class="text-danger">*</span></label>
                                            <input class="form-control" type="text" name="nombre" required value="<%=pac.getNombre()%>">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>Apellido <span class="text-danger">*</span></label>
                                            <input class="form-control" type="text" name="apellido" required value="<%=pac.getApellido()%>">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>Dirección <span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" name="direccion" required value="<%=pac.getDireccion()%>">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>Teléfono <span class="text-danger">*</span></label>
                                            <input class="form-control" type="text" name="telefono" required value="<%=pac.getTelefono()%>">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>Email </label>
                                            <input class="form-control" type="email" name="email" required value="<%=pac.getEmail()%>">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>Fecha de Nacimiento </label>
                                            <div class="cal-icon">
                                                <input type="date" name="fecha_nacimiento" required value="<%=control.DateToString(pac.getFecha_nacimiento())%>">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>Ciudad <span class="text-danger">*</span></label>
                                            <input class="form-control" type="text" name="ciudad" required value="<%=pac.getCiudad()%>">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>Provincia <span class="text-danger">*</span></label>
                                            <input class="form-control" type="text" name="provincia" required value="<%=pac.getProvincia()%>">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>Fecha de Registro (Actual)</label>
                                            <div class="cal-icon">
                                                <input type="date" name="fecha_registro" required value="<%=control.DateToString(pac.getFecha_registro())%>">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>¿Posee Cobertura? <span class="text-danger">*</span></label>
                                            <input class="form-control" type="checkbox" id="poseeCobertura" name="poseeCobertura" value="true">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <label class="display-block">Estado</label>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="estado" id="Activo" value="Activo" checked>
                                            <label class="form-check-label" for="Activo">
                                                Activo
                                            </label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="estado" id="Inactivo" value="Inactivo">
                                            <label class="form-check-label" for="Inactivo">
                                                Inactivo
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="m-t-20 text-center">
                                    <button type="submit" class="btn btn-primary submit-btn">Actualizar Paciente</button>
                                </div>
                            </form>
                        </div>
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

