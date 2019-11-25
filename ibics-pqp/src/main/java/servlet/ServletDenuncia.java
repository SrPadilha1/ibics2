/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import classes.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.naming.spi.DirStateFactory.Result;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.spi.http.HttpExchange;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

/**
 *
 * @author aluno
 */
@WebServlet(name = "ServletDenuncia", urlPatterns = {"/ServletDenuncia"})
public class ServletDenuncia extends HttpServlet {

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
            out.println("<title>Servlet ServletDenuncia</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletDenuncia at " + request.getContextPath() + "</h1>");
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

        Denuncia denuncia = new Denuncia();
        Usuario usuario = new Usuario();
        Postagem postagem = new Postagem();

        String idUsuario = request.getParameter("denunciante");
        String idPostagem = request.getParameter("postagem");
        String idDenuncia = request.getParameter("pid");
        
        usuario.setIdUsuario(Integer.parseInt(idUsuario));
        postagem.setIdPostagem(Integer.parseInt(idPostagem));
                
        denuncia.setDescricao(request.getParameter("descricao"));
        denuncia.setUsuario(usuario);
        denuncia.setPostagem(postagem);
        Date agora = new Date();
        denuncia.setDataHora(agora);
        
        if (!idDenuncia.isEmpty()) {
            Integer id = Integer.parseInt(idDenuncia);
            denuncia.setId(id);
        }
        
        denuncia.setUsuario(usuario);
        
        
        Session sessionRecheio;
        sessionRecheio = HibernateUtil.getSession();
        Transaction tr = sessionRecheio.beginTransaction();
        sessionRecheio.saveOrUpdate(denuncia);
        tr.commit();
        
        DenunciaControle.salvar(denuncia);

        response.sendRedirect("paginadepost.jsp");
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    public Result authenticate(HttpExchange he) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}
