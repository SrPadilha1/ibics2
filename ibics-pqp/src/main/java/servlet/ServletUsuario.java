/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import classes.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletUsuario extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Captura parametros da tela
        String idtext = request.getParameter("pid");
        String nome = request.getParameter("nm_nome");
        String senha = request.getParameter("ds_senha");
        String email = request.getParameter("ds_email");
        String cpfXaBlau = request.getParameter("nr_cpf");
        System.out.println(nome+senha+email+cpfXaBlau);
        //cpfXaBlau = cpfXaBlau.replaceAll("-", ""); cpfXaBlau = cpfXaBlau.replaceAll("\\.", "");

        //Cria instancia do usuario
        Usuario usuario = new Usuario();        
        //Detecta se é usuario novo ou antigo
        if(!idtext.isEmpty()){
            Integer id = Integer.parseInt(idtext);
            usuario.setIdUsuario(id);
        }
        //Insere informações no objeto
        usuario.setNmNome(nome);
        usuario.setDsSenha(senha);
        usuario.setDsEmail(email);
        usuario.setNrCpf(Long.parseLong(cpfXaBlau));
        usuario.setAdmin(false);
        
        //Chama de funcao para salvar ou atualizar usuario
        UsuarioControle.salvar(usuario);
        
        //Redireciona pagina
        response.sendRedirect("paginadepost.jsp");
    }
}