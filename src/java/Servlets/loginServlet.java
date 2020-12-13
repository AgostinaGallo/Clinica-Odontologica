package Servlets;

import Logica.ControladoraLogica;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "loginServlet", urlPatterns = {"/loginServlet"})
public class loginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        // Bandera
        boolean checkUsuario = false;

        ControladoraLogica control = new ControladoraLogica();

        checkUsuario = control.comprobarLogin(request.getParameter("username"), request.getParameter("contrasenia"));

        if (checkUsuario == true) {
            // ACTIVA la sesion del usuario
            HttpSession miSesion = request.getSession(true);

            String username = request.getParameter("username");
            String contrasenia = request.getParameter("contrasenia");

            miSesion.setAttribute("username", username);
            miSesion.setAttribute("contrasenia", contrasenia);

            response.sendRedirect("index.jsp");
        } else {

            response.sendRedirect("login-error.jsp");

        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
