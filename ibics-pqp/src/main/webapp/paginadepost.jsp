<%@page import="java.util.List"%>
<%@page import="servlet.ControlePostagem"%>
<%@page import="classes.Postagem"%>
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
        <style>
            h1,h2,h3,h4,h5,h6 {font-family: "Oswald"}
            body {font-family: "Open Sans"}

        </style>
    <body class="w3-light-grey">
        <header class="w3-container w3-center w3-padding-48 w3-green">
            <h1 class="w3-xxxlarge"><b>IBICS</b></h1>
            <h6>Bem-vido ao IBICS <span class="w3-tag">I believe I can study</span></h6>
        </header>
    </style>
<body>
    <div class="navbar">

        <div class="w3-container w3-white w3-margin w3-padding-large">
            <div class="w3-center">
                <h3>Postagens</h3>          
            </div>

            <h3><a href="postagem.html"><button> Fazer postagem</button></a></h3>

            <%
                List<Postagem> lista = ControlePostagem.listar();
                request.setAttribute("postagens", lista);

                List<Comentario> listac = ControlePostagem.listarc();
                request.setAttribute("comentarios", listac);
            %>
            <div align="center">
                <display:table name="postagens">
                    <display:column property="conteudo" title=""/>
                    <input type="text" name="coment">
                    <display:setProperty name="basic.msg.empty_list" value="Sem Postagens" />
                </display:table>
            </div>
            <br><br><br>
            <center> <h3>Comentários</h3>     </center>
            <div align="center">
                <display:table name="comentarios">
                    <display:column property="comentario" title=""/>
                    <input type="text" name="coment">
                    <display:setProperty name="basic.msg.empty_list" value="Sem comentários" />
                </display:table>
            </div>


            <a href="comentar.html" > <button class="w3-button w3-black"> <b>Comentários</b></button></a>
            <button class="w3-button w3-white w3-border" onclick="likeFunction(this)"><b><i class="fa fa-thumbs-up"></i> Like</b></button>
            <a href="pgdenuncia.html" > <button class="w3-button w3-black"> <b>Denúncia</b></button></a> 
            <p class="w3-clear"></p>
            



            <footer class="w3-container w3-green" style="padding:32px">
                <a href="#" class="w3-button w3-black w3-padding-large w3-margin-bottom"><i class="fa fa-arrow-up w3-margin-right"></i>Inicio</a>

            </footer>

            <script>
                document.getElementById("myBtn").click();
                function myFunction(id) {
                    var x = document.getElementById(id);
                    if (x.className.indexOf("w3-show") == -1) {
                        x.className += " w3-show";
                    } else {
                        x.className = x.className.replace(" w3-show", "");
                    }
                }

                function likeFunction(x) {
                    x.style.fontWeight = "bold";
                    x.innerHTML = "✓ Liked";
                }
            </script>
        </div>


</body>
</html>


