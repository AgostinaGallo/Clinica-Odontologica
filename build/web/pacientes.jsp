
<%@page import="Logica.Paciente"%>
<%@page import="java.util.List"%>
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
                        <div class="col-sm-4 col-3">
                            <h4 class="page-title">Pacientes</h4>
                        </div>
                        <div class="col-sm-8 col-9 text-right m-b-20">
                            <a href="add-paciente.jsp" class="btn btn btn-success btn-rounded float-right"><i class="fa fa-plus"></i> Agregar Paciente</a>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <table id="tablaPacientes" name="tablaPacientes" class="table table-striped custom-table">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>DNI</th>
                                            <th>Nombre y Apellido</th>
                                            <th>Sexo</th>
                                            <th>Direccion</th>
                                            <th>Teléfono</th>
                                            <th>Email</th>
                                            <th>Fecha de Nacimiento</th>
                                            <th>Ciudad</th>
                                            <th>Provincia</th>
                                            <th>Cobertura</th>
                                            <th>Registro</th>
                                            <th>Estado</th>
                                            <th class="text-right">Accion</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <%
                                                ControladoraLogica control = (ControladoraLogica) miSesion.getAttribute("control");
                                                List<Paciente> listaPacientes = control.getListaPacientes();
                                                for (Paciente pac : listaPacientes) {
                                                    String id_paciente = Integer.toString(pac.getId_paciente());
                                                    String cobertura = "";
                                                    if (pac.isPoseeCobertura() == true) {
                                                        cobertura = "Posee";
                                                    } else {
                                                        cobertura = "No Posee";
                                                    }
                                            %>
                                            <td><%=pac.getId_paciente()%></td>
                                            <td><%=pac.getDni()%></td>
                                            <td><%=pac.getNombre() + " " + pac.getApellido()%></td>
                                            <td><%=pac.getSexo()%></td>
                                            <td><%=pac.getDireccion()%></td>
                                            <td><%=pac.getTelefono()%></td>
                                            <td><%=pac.getEmail()%></td>
                                            <td><%=control.DateToString(pac.getFecha_nacimiento())%></td>
                                            <td><%=pac.getCiudad()%></td>
                                            <td><%=pac.getProvincia()%></td>
                                            <td><%=cobertura%></td>
                                            <td><%=control.DateToString(pac.getFecha_registro())%></td>
                                            <td><span class="badge badge-secondary"><%=pac.getEstado()%></span></td>
                                            <td class="text-right">
                                                <div class="dropdown dropdown-action">
                                                    <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
                                                    <div class="dropdown-menu dropdown-menu-right">
                                                        <a class="dropdown-item" href="edit-paciente.jsp?id_paciente=<%=id_paciente%>" name="id_paciente"><i class="fa fa-pencil m-r-5"></i> Editar</a>
                                                        <a class="dropdown-item" data-toggle="modal" data-target="#BORRAR-<%=id_paciente%>" href="borrarPacienteServlet?id_paciente=<%=id_paciente%>"><i class="fa fa-trash-o m-r-5"></i> Borrar</a>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    <div id="BORRAR-<%=id_paciente%>" class="modal fade delete-modal" role="dialog">
                                        <form action="borrarPacienteServlet"  method="get">
                                            <div class="modal-dialog modal-dialog-centered">
                                                <div class="modal-content">
                                                    <div class="modal-body text-center">
                                                        <img src="assets/img/sent.png" alt="" width="50" height="46">
                                                        <h3>¿Seguro de borrar este paciente?</h3>
                                                        <div class="m-t-20"> <a href="#" class="btn btn-white" data-dismiss="modal">Cerrar</a>
                                                            <input type="hidden" name="id_paciente" value="<%=id_paciente%>">
                                                            <button type="submit" class="btn btn-danger" id="delete_appointment">Borrar</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>

                                    <% }%>
                                    </tbody>
                                </table>
                            </div>
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
        <script src="assets/js/app.js"></script>

    </body>

</html>
