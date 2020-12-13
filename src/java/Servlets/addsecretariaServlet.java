package Servlets;

import Logica.ControladoraLogica;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "addsecretariaServlet", urlPatterns = {"/addsecretariaServlet"})
public class addsecretariaServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

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

        // Instancio Controladora de Logica
        ControladoraLogica control = new ControladoraLogica();

        control.crearSecretaria(dni, nombre, apellido, sexo, direccion, telefono, email, fecha_nacimiento, ciudad, provincia);

        response.sendRedirect("secretarias.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
