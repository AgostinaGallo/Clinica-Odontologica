<%@page import="Logica.ControladoraLogica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="es">

    <head>
        <title>Clínica Odontologica | Inicio</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css?family=Work+Sans:100,200,300,400,500,600,700,800,900" rel="stylesheet">
        <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/aos.css">
        <link rel="stylesheet" href="css/ionicons.min.css">
        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/icomoon.css">
        <link rel="stylesheet" href="css/style.css">
    </head>


    <body>
        <nav class="navbar py-4 navbar-expand-lg ftco_navbar navbar-light bg-light flex-row">
            <div class="container">
                <div class="row no-gutters d-flex align-items-start align-items-center px-3 px-md-0">
                    <div class="col-lg-2 pr-4 align-items-center">
                        <a class="navbar-brand" href="#">Clinica<span>Odonto</span></a>
                    </div>
                    <div class="col-lg-10 d-none d-md-block">
                        <div class="row d-flex">
                            <div class="col-md-4 pr-4 d-flex topper align-items-center">
                                <div class="icon bg-white mr-2 d-flex justify-content-center align-items-center"><span class="icon-map"></span></div>
                                <span class="text">Dirección: 25 de Mayo 6687 - 1er Piso </span>
                            </div>
                            <div class="col-md pr-4 d-flex topper align-items-center">
                                <div class="icon bg-white mr-2 d-flex justify-content-center align-items-center"><span class="icon-paper-plane"></span></div>
                                <span class="text">Email: clinicaodonto_contact@gmail.com</span>
                            </div>
                            <div class="col-md pr-4 d-flex topper align-items-center">
                                <div class="icon bg-white mr-2 d-flex justify-content-center align-items-center"><span class="icon-phone2"></span></div>
                                <span class="text">Teléfono: +54 9 3764 393328</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </nav>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark ftco-navbar-light" id="ftco-navbar">
            <div class="container d-flex align-items-center">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="oi oi-menu"></span> Menu
                </button>
                <p class="button-custom order-lg-last mb-0"><a href="login.jsp" class="btn btn-secondary py-2 px-3">Iniciar Sesión</a></p>
                <p class="button-custom order-lg-last mb-0"><a href="register.jsp" class="btn btn-info">Registrarse </a></p>
            </div>
        </nav>
        <!-- END nav -->

        <section class="home-slider owl-carousel">
            <div class="slider-item" style="background-image:url(images/bg_1.jpg);" data-stellar-background-ratio="0.5">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row no-gutters slider-text align-items-center justify-content-start" data-scrollax-parent="true">
                        <div class="col-md-6 text ftco-animate">
                            <h1 class="mb-4">Ayudando a <span>Cuidar tu Sonrisa</span></h1>
                            <h3 class="subheading">El Mejor Servicio de Salud Dental para Toda la Familia y en Todas las Especialidades.</h3>
                        </div>
                    </div>
                </div>
            </div>

            <div class="slider-item" style="background-image:url(images/bg_2.jpg);">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row no-gutters slider-text align-items-center justify-content-start" data-scrollax-parent="true">
                        <div class="col-md-6 text ftco-animate">
                            <h1 class="mb-4">Nos Importa <span>Tu Salud Dental</span></h1>
                            <h3 class="subheading">Tu Salud e Higiene Dental es Nuestra Principal Prioridad.</h3>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!--SERVICIOS BARRA-->
        <section class="ftco-services ftco-no-pb">
            <div class="container">
                <div class="row no-gutters">
                    <div class="col-md-3 d-flex services align-self-stretch p-4 ftco-animate">
                        <div class="media block-6 d-block text-center">
                            <div class="icon d-flex justify-content-center align-items-center">
                                <span class="flaticon-doctor"></span>
                            </div>
                            <div class="media-body p-2 mt-3">
                                <h3 class="heading">Doctores Calificados</h3>
                                <p>Con más de 10 años de experiencia y distintas especialidades.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 d-flex services align-self-stretch p-4 ftco-animate">
                        <div class="media block-6 d-block text-center">
                            <div class="icon d-flex justify-content-center align-items-center">
                                <span class="flaticon-ambulance"></span>
                            </div>
                            <div class="media-body p-2 mt-3">
                                <h3 class="heading">Atención Inmediata</h3>
                                <p>Rapidez en la atención de casos de inmediata urgencia.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 d-flex services align-self-stretch p-4 ftco-animate">
                        <div class="media block-6 d-block text-center">
                            <div class="icon d-flex justify-content-center align-items-center">
                                <span class="flaticon-stethoscope"></span>
                            </div>
                            <div class="media-body p-2 mt-3">
                                <h3 class="heading">Seguimiento y Cuidado Personal</h3>
                                <p>Control personalizado luego de las consultas, para una mejor eficiencia.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 d-flex services align-self-stretch p-4 ftco-animate">
                        <div class="media block-6 d-block text-center">
                            <div class="icon d-flex justify-content-center align-items-center">
                                <span class="flaticon-24-hours"></span>
                            </div>
                            <div class="media-body p-2 mt-3">
                                <h3 class="heading">Atención las 24 horas</h3>
                                <p>Nuestras tecnologías de respuestas programadas atienden las consultas en cualquier momento del día.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- BARRA ESPACIO BLANCO-->
        <section class="ftco-section ftco-no-pt ftc-no-pb">
            <div class="container">
                <div class="row no-gutters">
                    <div class="col-md-7 wrap-about py-4 py-md-5 ftco-animate">
                    </div>
                </div>
            </div>
        </section>

        <!-- BARRA CONSULTAS-->
        <section class="ftco-intro" style="background-image: url(images/bg_3.jpg);" data-stellar-background-ratio="0.5">
            <div class="overlay"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-9">
                        <h2>Ofrecemos Consultas con Amplia Disponibilidad</h2>
                        <p class="mb-0">Concurre Frecuentemente a los Turnos para un Mejor Seguimiento de tu Salud.</p>
                        <p></p>
                    </div>
                    <div class="col-md-3 d-flex align-items-center">
                        <p class="mb-0"><a href="login.jsp" class="btn btn-secondary px-4 py-3">Ver Consultas</a></p>
                    </div>
                </div>
            </div>
        </section>

        <!-- ESPECIALIDADES -->
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center mb-5 pb-2">
                    <div class="col-md-8 text-center heading-section ftco-animate">
                        <span class="subheading">Especialidades</span>
                        <h2 class="mb-4">Especialidades de la Clínica</h2>
                    </div>
                </div>
                <div class="ftco-departments">
                    <div class="row">
                        <div class="col-md-12 nav-link-wrap">
                            <div class="nav nav-pills d-flex text-center" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                                <a class="nav-link ftco-animate active" id="v-pills-1-tab" data-toggle="pill" href="#v-pills-1" role="tab" aria-controls="v-pills-1" aria-selected="true">Endodoncia</a>

                                <a class="nav-link ftco-animate" id="v-pills-2-tab" data-toggle="pill" href="#v-pills-2" role="tab" aria-controls="v-pills-2" aria-selected="false">Implantes</a>

                                <a class="nav-link ftco-animate" id="v-pills-3-tab" data-toggle="pill" href="#v-pills-3" role="tab" aria-controls="v-pills-3" aria-selected="false">Odontopediatría</a>

                                <a class="nav-link ftco-animate" id="v-pills-4-tab" data-toggle="pill" href="#v-pills-4" role="tab" aria-controls="v-pills-4" aria-selected="false">Ortodoncia</a>

                                <a class="nav-link ftco-animate" id="v-pills-5-tab" data-toggle="pill" href="#v-pills-5" role="tab" aria-controls="v-pills-5" aria-selected="false">Peridoncia</a>
                            </div>
                        </div>
                        <div class="col-md-12 tab-wrap">

                            <div class="tab-content bg-light p-4 p-md-5 ftco-animate" id="v-pills-tabContent">

                                <div class="tab-pane py-2 fade show active" id="v-pills-1" role="tabpanel" aria-labelledby="day-1-tab">
                                    <div class="row departments">
                                        <div class="col-lg-4 order-lg-last d-flex align-items-stretch">
                                            <div class="img d-flex align-self-stretch" style="background-image: url(images/dept-1.jpg);"></div>
                                        </div>
                                        <div class="col-lg-8">
                                            <h2>Endodoncia</h2>
                                            <p>La endodoncia o el tratamiento de conductos es un procedimiento bucodental conocido popularmente como “matar el nervio” que a menudo se emplea cuando aparece en un diente una infección grave.“Consiste en la eliminación del tejido pulpar (nervio), así como en la desinfección y posterior sellado tridimensional del sistema de conductos que recorren las raíces de los dientes, desde su extremo (ápice) hasta la cámara pulpar”.</p>
                                            <div class="row mt-5 pt-2">
                                                <div class="col-lg-6">
                                                    <div class="services-2 d-flex">
                                                        <div class="icon mt-2 mr-3 d-flex justify-content-center align-items-center"><span class="flaticon-first-aid-kit"></span></div>
                                                        <div class="text">
                                                            <h3>Cuidado Personalizado</h3>
                                                            <p>Tratamiento guiado según las necesidades del paciente.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="services-2 d-flex">
                                                        <div class="icon mt-2 mr-3 d-flex justify-content-center align-items-center"><span class="flaticon-dropper"></span></div>
                                                        <div class="text">
                                                            <h3>Laboratorio para Pruebas</h3>
                                                            <p>Amplios recursos para el proceso de análisis.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="services-2 d-flex">
                                                        <div class="icon mt-2 mr-3 d-flex justify-content-center align-items-center"><span class="flaticon-experiment-results"></span></div>
                                                        <div class="text">
                                                            <h3>Chequeo de Síntomas</h3>
                                                            <p>Seguridad y Eficiencia en detectar síntomas</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="services-2 d-flex">
                                                        <div class="icon mt-2 mr-3 d-flex justify-content-center align-items-center"><span class="flaticon-heart-rate"></span></div>
                                                        <div class="text">
                                                            <h3>Fidelización</h3>
                                                            <p>La Clínica ofrece su ética laboral con cálida atención y trato a sus pacientes.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="tab-pane fade" id="v-pills-2" role="tabpanel" aria-labelledby="v-pills-day-2-tab">
                                    <div class="row departments">
                                        <div class="col-lg-4 order-lg-last d-flex align-items-stretch">
                                            <div class="img d-flex align-self-stretch" style="background-image: url(images/dept-2.jpg);"></div>
                                        </div>
                                        <div class="col-md-8">
                                            <h2>Cirugía de Implantes</h2>
                                            <p>La cirugía de implantes dentales es un procedimiento que reemplaza las raíces de los dientes con pernos metálicos que parecen tornillos y reemplaza el diente faltante, o dañado, con un diente artificial que tiene el mismo aspecto y que cumple la misma función que los dientes reales.</p>
                                            <div class="row mt-5 pt-2">
                                                <div class="col-lg-6">
                                                    <div class="services-2 d-flex">
                                                        <div class="icon mt-2 mr-3 d-flex justify-content-center align-items-center"><span class="flaticon-first-aid-kit"></span></div>
                                                        <div class="text">
                                                            <h3>Cuidado Personalizado</h3>
                                                            <p>Tratamiento guiado según las necesidades del paciente.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="services-2 d-flex">
                                                        <div class="icon mt-2 mr-3 d-flex justify-content-center align-items-center"><span class="flaticon-dropper"></span></div>
                                                        <div class="text">
                                                            <h3>Laboratorio para Pruebas</h3>
                                                            <p>Amplios recursos para el proceso de análisis.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="services-2 d-flex">
                                                        <div class="icon mt-2 mr-3 d-flex justify-content-center align-items-center"><span class="flaticon-experiment-results"></span></div>
                                                        <div class="text">
                                                            <h3>Chequeo de Síntomas</h3>
                                                            <p>Seguridad y Eficiencia en detectar síntomas</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="services-2 d-flex">
                                                        <div class="icon mt-2 mr-3 d-flex justify-content-center align-items-center"><span class="flaticon-heart-rate"></span></div>
                                                        <div class="text">
                                                            <h3>Fidelización</h3>
                                                            <p>La Clínica ofrece su ética laboral con cálida atención y trato a sus pacientes.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="v-pills-3" role="tabpanel" aria-labelledby="v-pills-day-3-tab">
                                    <div class="row departments">
                                        <div class="col-lg-4 order-lg-last d-flex align-items-stretch">
                                            <div class="img d-flex align-self-stretch" style="background-image: url(images/dept-3.jpg);"></div>
                                        </div>
                                        <div class="col-md-8">
                                            <h2>Odontopediatría</h2>
                                            <p>La odontopediatría es la rama de la odontología encargada de tratar a los niños. El odontopediatra será, por tanto, el encargado de explorar y tratar a niños y recién nacidos. También se encarga de detectar posibles anomalías en la posición de los maxilares o dientes para remitir al ortodoncista, especialista en ortodoncia, y de hacer un tratamiento restaurador en caso de necesitarlo.</p>
                                            <div class="row mt-5 pt-2">
                                                <div class="col-lg-6">
                                                    <div class="services-2 d-flex">
                                                        <div class="icon mt-2 mr-3 d-flex justify-content-center align-items-center"><span class="flaticon-first-aid-kit"></span></div>
                                                        <div class="text">
                                                            <h3>Cuidado Personalizado</h3>
                                                            <p>Tratamiento guiado según las necesidades del paciente.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="services-2 d-flex">
                                                        <div class="icon mt-2 mr-3 d-flex justify-content-center align-items-center"><span class="flaticon-dropper"></span></div>
                                                        <div class="text">
                                                            <h3>Laboratorio para Pruebas</h3>
                                                            <p>Amplios recursos para el proceso de análisis.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="services-2 d-flex">
                                                        <div class="icon mt-2 mr-3 d-flex justify-content-center align-items-center"><span class="flaticon-experiment-results"></span></div>
                                                        <div class="text">
                                                            <h3>Chequeo de Síntomas</h3>
                                                            <p>Seguridad y Eficiencia en detectar síntomas</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="services-2 d-flex">
                                                        <div class="icon mt-2 mr-3 d-flex justify-content-center align-items-center"><span class="flaticon-heart-rate"></span></div>
                                                        <div class="text">
                                                            <h3>Fidelización</h3>
                                                            <p>La Clínica ofrece su ética laboral con cálida atención y trato a sus pacientes.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="tab-pane fade" id="v-pills-4" role="tabpanel" aria-labelledby="v-pills-day-4-tab">
                                    <div class="row departments">
                                        <div class="col-lg-4 order-lg-last d-flex align-items-stretch">
                                            <div class="img d-flex align-self-stretch" style="background-image: url(images/dept-4.jpg);"></div>
                                        </div>
                                        <div class="col-md-8">
                                            <h2>Ortodoncia</h2>
                                            <p>La ortodoncia es una especialidad de la odontología que estudia, previene y corrige las alteraciones del desarrollo, las formas de las arcadas dentarias y la posición de los maxilares, con el objetivo de restablecer el equilibrio tanto en forma como en función de la boca y de la cara, mejorando también la estética facial.</p>
                                            <div class="row mt-5 pt-2">
                                                <div class="col-lg-6">
                                                    <div class="services-2 d-flex">
                                                        <div class="icon mt-2 mr-3 d-flex justify-content-center align-items-center"><span class="flaticon-first-aid-kit"></span></div>
                                                        <div class="text">
                                                            <h3>Cuidado Personalizado</h3>
                                                            <p>Tratamiento guiado según las necesidades del paciente.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="services-2 d-flex">
                                                        <div class="icon mt-2 mr-3 d-flex justify-content-center align-items-center"><span class="flaticon-dropper"></span></div>
                                                        <div class="text">
                                                            <h3>Laboratorio para Pruebas</h3>
                                                            <p>Amplios recursos para el proceso de análisis.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="services-2 d-flex">
                                                        <div class="icon mt-2 mr-3 d-flex justify-content-center align-items-center"><span class="flaticon-experiment-results"></span></div>
                                                        <div class="text">
                                                            <h3>Chequeo de Síntomas</h3>
                                                            <p>Seguridad y Eficiencia en detectar síntomas</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="services-2 d-flex">
                                                        <div class="icon mt-2 mr-3 d-flex justify-content-center align-items-center"><span class="flaticon-heart-rate"></span></div>
                                                        <div class="text">
                                                            <h3>Fidelización</h3>
                                                            <p>La Clínica ofrece su ética laboral con cálida atención y trato a sus pacientes.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="tab-pane fade" id="v-pills-5" role="tabpanel" aria-labelledby="v-pills-day-5-tab">
                                    <div class="row departments">
                                        <div class="col-lg-4 order-lg-last d-flex align-items-stretch">
                                            <div class="img d-flex align-self-stretch" style="background-image: url(images/dept-5.jpg);"></div>
                                        </div>
                                        <div class="col-md-8">
                                            <h2>Peridoncia</h2>
                                            <p>La periodoncia es la especialidad odontológica encargada de la prevención, diagnóstico y tratamiento de las emfermedades que afectan a los soportes dentarios: encía, hueso alveolar y ligamentos periodontales.</p>
                                            <div class="row mt-5 pt-2">
                                                <div class="col-lg-6">
                                                    <div class="services-2 d-flex">
                                                        <div class="icon mt-2 mr-3 d-flex justify-content-center align-items-center"><span class="flaticon-first-aid-kit"></span></div>
                                                        <div class="text">
                                                            <h3>Cuidado Personalizado</h3>
                                                            <p>Tratamiento guiado según las necesidades del paciente.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="services-2 d-flex">
                                                        <div class="icon mt-2 mr-3 d-flex justify-content-center align-items-center"><span class="flaticon-dropper"></span></div>
                                                        <div class="text">
                                                            <h3>Laboratorio para Pruebas</h3>
                                                            <p>Amplios recursos para el proceso de análisis.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="services-2 d-flex">
                                                        <div class="icon mt-2 mr-3 d-flex justify-content-center align-items-center"><span class="flaticon-experiment-results"></span></div>
                                                        <div class="text">
                                                            <h3>Chequeo de Síntomas</h3>
                                                            <p>Seguridad y Eficiencia en detectar síntomas</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="services-2 d-flex">
                                                        <div class="icon mt-2 mr-3 d-flex justify-content-center align-items-center"><span class="flaticon-heart-rate"></span></div>
                                                        <div class="text">
                                                            <h3>Fidelización</h3>
                                                            <p>La Clínica ofrece su ética laboral con cálida atención y trato a sus pacientes.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- DOCTORES -->
        <section class="ftco-section ftco-no-pt">
            <div class="container">
                <div class="row justify-content-center mb-5 pb-2">
                    <div class="col-md-8 text-center heading-section ftco-animate">
                        <span class="subheading">Doctores</span>
                        <h2 class="mb-4">Nuestros odontólogos titulados y con amplia experiencia en cada una de sus especialidades</h2>
                    </div>
                    <div class="row">
                        <div class="col-md-6 col-lg-3 ftco-animate">
                            <div class="staff">
                                <div class="img-wrap d-flex align-items-stretch">
                                    <div class="img align-self-stretch" style="background-image: url(images/doc-1.jpg);"></div>
                                </div>
                                <div class="text pt-3 text-center">
                                    <h3>Dr. Ramiro Marin</h3>
                                    <span class="position mb-2">Endodoncia</span>
                                    <div class="faded">
                                        <ul class="ftco-social text-center">
                                            <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                                            <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                                            <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3 ftco-animate">
                            <div class="staff">
                                <div class="img-wrap d-flex align-items-stretch">
                                    <div class="img align-self-stretch" style="background-image: url(images/doc-2.jpg);"></div>
                                </div>
                                <div class="text pt-3 text-center">
                                    <h3>Dra. Cristina Roy</h3>
                                    <span class="position mb-2">Ortodoncia</span>
                                    <div class="faded">
                                        <ul class="ftco-social text-center">
                                            <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                                            <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                                            <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3 ftco-animate">
                            <div class="staff">
                                <div class="img-wrap d-flex align-items-stretch">
                                    <div class="img align-self-stretch" style="background-image: url(images/doc-3.jpg);"></div>
                                </div>
                                <div class="text pt-3 text-center">
                                    <h3>Dr. Maximiliano Agolti</h3>
                                    <span class="position mb-2">OdontopediatrÍa</span>
                                    <div class="faded">
                                        <ul class="ftco-social text-center">
                                            <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                                            <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                                            <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3 ftco-animate">
                            <div class="staff">
                                <div class="img-wrap d-flex align-items-stretch">
                                    <div class="img align-self-stretch" style="background-image: url(images/doc-4.jpg);"></div>
                                </div>
                                <div class="text pt-3 text-center">
                                    <h3>Dra. Estella Quinodoz</h3>
                                    <span class="position mb-2">Peridoncia</span>
                                    <div class="faded">
                                        <ul class="ftco-social text-center">
                                            <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                                            <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                                            <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </section>

        <!-- FOOTER -->
        <footer class="ftco-footer ftco-bg-dark ftco-section">
            <div class="container">
                <div class="row mb-5">
                    <div class="col-md">
                        <div class="ftco-footer-widget mb-5">
                            <h2 class="ftco-heading-2 logo">Clinica<span> Odonto</span></h2>
                        </div>
                        <div class="ftco-footer-widget mb-5">
                            <h2 class="ftco-heading-2">¿Tenes Preguntas?</h2>
                            <div class="block-23 mb-3">
                                <ul>
                                    <li><span class="icon icon-map-marker"></span><span class="text">25 de Mayo 6687 - 1er Piso, Posadas, Misiones, ARGENTINA</span></li>
                                    <li><a href="#"><span class="icon icon-phone"></span><span class="text">+54 9 3764 393328</span></a></li>
                                    <li><a href="#"><span class="icon icon-envelope"></span><span class="text">clinicaodonto_contact@gmail.com</span></a></li>
                                </ul>
                            </div>

                            <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-3">
                                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="ftco-footer-widget mb-5 ml-md-4">
                            <h2 class="ftco-heading-2">Links</h2>
                            <ul class="list-unstyled">
                                <li><a href="#"><span class="ion-ios-arrow-round-forward mr-2"></span>Home</a></li>
                                <li><a href="#"><span class="ion-ios-arrow-round-forward mr-2"></span>About</a></li>
                                <li><a href="#"><span class="ion-ios-arrow-round-forward mr-2"></span>Services</a></li>
                                <li><a href="#"><span class="ion-ios-arrow-round-forward mr-2"></span>Deparments</a></li>
                                <li><a href="#"><span class="ion-ios-arrow-round-forward mr-2"></span>Contact</a></li>
                            </ul>
                        </div>
                        <div class="ftco-footer-widget mb-5 ml-md-4">
                            <h2 class="ftco-heading-2">Servicios</h2>
                            <ul class="list-unstyled">
                                <li><a href="#"><span class="ion-ios-arrow-round-forward mr-2"></span>Ortodoncia</a></li>
                                <li><a href="#"><span class="ion-ios-arrow-round-forward mr-2"></span>Odontopediatría</a></li>
                                <li><a href="#"><span class="ion-ios-arrow-round-forward mr-2"></span>Endodoncia</a></li>
                                <li><a href="#"><span class="ion-ios-arrow-round-forward mr-2"></span>Implantes</a></li>
                                <li><a href="#"><span class="ion-ios-arrow-round-forward mr-2"></span>Peridoncia</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-md">
                        <div class="ftco-footer-widget mb-5">
                            <h2 class="ftco-heading-2">Horas de Consultas</h2>
                            <h3 class="open-hours pl-4"><span class="ion-ios-time mr-3"></span>Estamos 24/7</h3>
                        </div>
                        <div class="ftco-footer-widget mb-5">
                            <h2 class="ftco-heading-2">Suscribite a Nosotros!</h2>
                            <form action="#" class="subscribe-form">
                                <div class="form-group">
                                    <input type="text" class="form-control mb-2 text-center" placeholder="Ingresa tu dirección de correo">
                                    <input type="submit" value="Suscribir" class="form-control submit px-3">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 text-center">

                        <p>
                            Copyright &copy; 2020  Todos los derechos reservados | Aplicación Web Java Full Stack <i class="icon-heart" aria-hidden="true"></i> por <a href="#" target="_blank">Agostina Melania Gallo</a>
                        </p>
                    </div>
                </div>
            </div>
        </footer>
        <!-- loader -->

        <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

        <script src="js/jquery.min.js"></script>
        <script src="js/jquery-migrate-3.0.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.easing.1.3.js"></script>
        <script src="js/jquery.waypoints.min.js"></script>
        <script src="js/jquery.stellar.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/aos.js"></script>
        <script src="js/jquery.animateNumber.min.js"></script>
        <script src="js/scrollax.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
        <script src="js/google-map.js"></script>
        <script src="js/main.js"></script>

    </body>
</html>