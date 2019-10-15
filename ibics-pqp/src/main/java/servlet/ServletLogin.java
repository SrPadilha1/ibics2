package servlet;

import classes.Usuario;
import util.HibernateUtil;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;

public class ServletLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Captura parametros da tela
        String email = request.getParameter("ds_email");
        String senha = request.getParameter("ds_senha");

        Session session = HibernateUtil.getSession();
        Usuario usuario = (Usuario) session.createQuery("from Usuario where ds_email=? and ds_senha=?").setString(0, email).setString(1, senha).uniqueResult();
        session.close();

        if (usuario == null) {
            response.sendRedirect("erro.html");
        } else {
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("UsuarioLogado", usuario);
            response.sendRedirect("postagem.jsp");

        }
    }
}