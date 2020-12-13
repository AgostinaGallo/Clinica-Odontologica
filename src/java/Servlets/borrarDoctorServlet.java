package Servlets;

import Logica.ControladoraLogica;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "borrarDoctorServlet", urlPatterns = {"/borrarDoctorServlet"})
public class borrarDoctorServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        processRequest(request, response);

        String id_doctor = request.getParameter("id_doctor");

        ControladoraLogica control = new ControladoraLogica();

        control.borrarDoctor(id_doctor);

        response.sendRedirect("doctores.jsp");
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
