<%@page import="java.util.Base64"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="servlet.ControlePostagem"%>
<%@page import="classes.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<jsp:directive.page import="classes.*" />
<jsp:directive.page import="java.util.List" />
<!DOCTYPE>
<html lang="en">
    <head>
        <title>IBICSS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="ibics.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Oswald">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open Sans">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="paginadepost.css">
        <link rel="stylesheet" type="text/css" href="pagpost.css">
        <style>
            h1,h2,h3,h4,h5,h6 {font-family: "Oswald"}
            body {font-family: "Open Sans"}

        </style>
        <%
            Usuario usuario = (Usuario) session.getAttribute("UsuarioLogado");
            System.out.println("tem o usuario: " + usuario);
            Avaliacao avaliacao = (Avaliacao) session.getAttribute("minhaAvaliacao");
            System.out.println("tem a avaliacao: " + avaliacao);
        %>
    <body class="w3-light-grey">
        <header class="w3-container w3-center w3-padding-48 w3-green">
            <h1 class="w3-xxxlarge"><b>IBICS</b></h1>
            <h6>Bem-vido ao IBICS <span class="w3-tag">I believe I can study</span></h6>

        </header>
    </style>
<body>
    <div class="navbar">
        <div class="topnav">
            <a href="#portugues" class="active">Portugues</a>
            <a href="#Matematica">Matematica</a>
            <a href="#Geografia">Geografia</a>
            <a href="#Biologia">Biologia</a>
            <a href="#Quimica">Quimica</a>
            <a href="#História">História</a>
            <a href="#Filosofia">Filosofia</a>
            <a href="#Inglês">Inglês</a>
            <a href="#Espanhol">Espanhol</a>

            <div align="right">
                <a href="usuarioperfil.jsp">PERFIL</a>
            </div>
        </div> 
        <div class="w3-container w3-white w3-margin w3-padding-large">


            <div class="w3-center">

                <h3>Postagens</h3>          
            </div>

            <%
                if (usuario.getAdmin() == true) {
            %>    <%@ include file="postagem.jspf"%>

            <%}%> 



            <%
                List<Postagem> lista = ControlePostagem.listar();
                System.out.println("tem a lista com " + lista.size() + " Postagens");
                for (Iterator it = lista.iterator(); it.hasNext();) {
                    Postagem p = (Postagem) it.next();
                    System.out.println("tem a postagem com " + p.getComentarioCollection().size() + " Comentarios");
                    String codigo = p.getIdPostagem().toString();
                    byte[] imagem = p.getFoto();
                    String foto = Base64.getEncoder().encodeToString(imagem);
                    Usuario postador = p.getIdUsuario();
            %>
            <div align="center">
                <a><%=p.getTitulo()%></a><br>            
                <a><%=postador.getNmNome()%>, </a><br><br>
                <img src="data:image/png;base64,<%=foto%>" width='500' height='400'><br>
                <a><%=p.getConteudo()%></a><br>              

                <br><br>

            </div>
                <% 
                    if (avaliacao == null) { 
                %>
            <a href="ServletAvaliacaoS?valor=1&avaliador=<%=usuario.getIdUsuario()%>&postagem=<%=p.getIdPostagem()%>&pid=" class="icon  fa fa-thumbs-o-up"><span class="label">Like</span></a>
            <a href="ServletAvaliacaoS?valor=-1&avaliador=<%=usuario.getIdUsuario()%>&postagem=<%=p.getIdPostagem()%>" class="icon  fa fa-thumbs-o-down"><span class="label">Deslike</span></a>
            <% } else { 
                    if (avaliacao.getValor() == -1){
            %>
            <a href="ServletAvaliacaoS?valor=1&avaliador=<%=usuario.getIdUsuario()%>&postagem=<%=p.getIdPostagem()%>&pid=" class="icon  fa fa-thumbs-o-up"><span class="label">Like</span></a>
            <a href="ServletAvaliacaoS?valor=-1&avaliador=<%=usuario.getIdUsuario()%>&postagem=<%=p.getIdPostagem()%>" class="icon  fa fa-thumbs-down"><span class="label">Deslike</span></a>
            <% }else {%>
            <a href="ServletAvaliacaoS?valor=1&avaliador=<%=usuario.getIdUsuario()%>&postagem=<%=p.getIdPostagem()%>&pid=" class="icon  fa fa-thumbs-up"><span class="label">Like</span></a>
            <a href="ServletAvaliacaoS?valor=-1&avaliador=<%=usuario.getIdUsuario()%>&postagem=<%=p.getIdPostagem()%>" class="icon  fa fa-thumbs-o-down"><span class="label">Deslike</span></a>
            <% }
            } %>
            
            
            <center> <h3>Comentários</h3>     </center>

            <%                for (Comentario c : p.getComentarioCollection()) {
            %>
            <div align="center" style="background: #1abc9c">
                <a><%=c.getComentario()%></a><br>               
                <a>Por <%=c.getIdUsuario().getNmNome()%>, em <%=c.getDataHora()%></a><br><br>            

                <br><br>
            </div>
            <%
                }
            %>
            <form method="POST" action="ServletDenuncia">
                <div class="col-12">
                    <textarea name="descricao" id="demo-message" placeholder="Descreva sua denúncia" rows="6"></textarea>
                </div>
                <div hidden>
                    <input type="text" name="denunciante" value="<%=usuario.getIdUsuario()%>">
                    <input type="text" name="postagem" value="<%=p.getIdPostagem()%>">
                    <input type="text" name="pid" value="">
                </div>
                <br>
                <input type="submit" class="button" value="Denunciar">
            </form>
            <form method="POST" action="ServletComentario">
                <div class="col-12">
                    <textarea name="comentario" id="demo-message" placeholder="Descreva seu comentário" rows="6"></textarea>
                </div>
                <div hidden>
                    <input type="text" name="comentarista" value="<%=usuario.getIdUsuario()%>">
                    <input type="text" name="postagem" value="<%=p.getIdPostagem()%>">
                    <input type="text" name="pid" value="">
                </div>
                <br>
                <input type="submit" class="button" value="Comentar">
            </form>
            <br><br><br>
            <%}%>


            <p class="w3-clear"></p>


            <footer class="w3-container w3-green" style="padding:32px">
                <a href="#" class="w3-button w3-black w3-padding-large w3-margin-bottom"><i class="fa fa-arrow-up w3-margin-right"></i>Inicio</a>

            </footer>


        </div>


</body>
</html>


