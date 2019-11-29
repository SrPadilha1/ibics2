/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import classes.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

/**
 *
 * @author aluno
 */
public class ServletAvaliacaoS extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletAvaliacaoS</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletAvaliacaoS at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String avaliador = request.getParameter("avaliador");
        String post = request.getParameter("postagem");
        String idtext = request.getParameter("pid");
        String like = request.getParameter("like");
        String Like = "Like";
        String Deslike = "Deslike";

        Postagem postagem = new Postagem();
        Usuario usuario = new Usuario();
        Avaliacao avaliacao = new Avaliacao();

        usuario.setIdUsuario(Integer.parseInt(avaliador));
        postagem.setIdPostagem(Integer.parseInt(post));

        avaliacao.setAvaliador(usuario);
        avaliacao.setPostagem(postagem);

        if (!idtext.isEmpty()) {
            Integer id = Integer.parseInt(idtext);
            avaliacao.setId(id);
        }
        
        if(like.equals(Like)){
            avaliacao.setLike(Boolean.TRUE);
        } else if (like.equals(Deslike)){
            avaliacao.setLike(Boolean.FALSE);
        }

        AvaliacaoControle.salvar(avaliacao);
        System.out.println("SALVO");
        response.sendRedirect("paginadepost.jsp");

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
