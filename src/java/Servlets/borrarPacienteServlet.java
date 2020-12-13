package Servlets;

import Logica.ControladoraLogica;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "borrarPacienteServlet", urlPatterns = {"/borrarPacienteServlet"})
public class borrarPacienteServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        processRequest(request, response);

        String id_paciente = request.getParameter("id_paciente");

        ControladoraLogica control = new ControladoraLogica();

        control.borrarPaciente(id_paciente);

        response.sendRedirect("pacientes.jsp");

    }

    /*
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
