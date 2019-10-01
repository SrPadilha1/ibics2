<%@page import="servlet.ControlePostagem"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<jsp:directive.page import="classes.*" />
<jsp:directive.page import="java.util.List" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crud</title>
    </head>
    <body>
        <%
            List<Postagem> lista = ControlePostagem.listar();
            request.setAttribute("postagens", lista);
        %>
        <div align="center" style="background: #1abc9c">
            <display:table name="postagens">
                <display:column property="conteudo" title="Postagem"/>
                <display:setProperty name="basic.msg.empty_list" value="Sem Postagens" />
            </display:table>
        </div>
        <%
            List<Comentario> listac = ControlePostagem.listarc();
            request.setAttribute("comentarios", listac);
        %>
        <br>
        <div align="center" style="background: #1abc9c">
            <display:table name="comentarios">
                <display:column property="conteudo" title="Comentarios"/>
                <display:setProperty name="basic.msg.empty_list" value="Sem Comentarios" />
            </display:table>
        </div>
    </body>
</html>