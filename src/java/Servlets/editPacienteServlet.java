package Servlets;

import Logica.ControladoraLogica;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "editPacienteServlet", urlPatterns = {"/editPacienteServlet"})
public class editPacienteServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String id_paciente = request.getParameter("id_paciente");
        String dni = request.getParameter("dni");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String sexo = request.getParameter("sexo");
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");
        String email = request.getParameter("email");
        String fecha_nacimiento = request.getParameter("fecha_nacimiento");
        String ciudad = request.getParameter("ciudad");
        String provincia = request.getParameter("provincia");
        String fecha_registro = request.getParameter("fecha_registro");
        String poseeCobertura = request.getParameter("poseeCobertura");
        String estado = request.getParameter("estado");

        // Instancio Controladora de Logica
        ControladoraLogica control = new ControladoraLogica();

        control.editarPaciente(id_paciente, dni, nombre, apellido, sexo, direccion, telefono, email, fecha_nacimiento, ciudad, provincia, fecha_registro, poseeCobertura, estado);

        response.sendRedirect("pacientes.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
