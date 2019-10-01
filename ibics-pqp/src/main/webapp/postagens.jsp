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
        <h1>Lista dos usuários</h1>
        <%
            List<Postagem> lista = ControlePostagem.listar();
            request.setAttribute( "postagens", lista );
        %>
        <display:table name="postagens">
            <display:column property="conteudo" title="Postagem"/>
            <display:setProperty name="basic.msg.empty_list" value="Sem Postagens" />
        </display:table>
    </body>
</html>