package Servlets;

import Logica.ControladoraLogica;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "addturnoServlet", urlPatterns = {"/addturnoServlet"})
public class addturnoServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String motivo = request.getParameter("motivo");
        String fecha = request.getParameter("fecha");
        String horario = request.getParameter("horario");
        String doctor = request.getParameter("id_doctor");
        String paciente = request.getParameter("id_paciente");
        String estado = request.getParameter("estado");
        String observaciones = request.getParameter("observaciones");

        // Instancio Controladora de Logica
        ControladoraLogica control = new ControladoraLogica();

        // Envio datos a controladora logica
        control.crearTurno(motivo, fecha, horario, doctor, paciente, estado, observaciones);

        response.sendRedirect("turnos.jsp");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
