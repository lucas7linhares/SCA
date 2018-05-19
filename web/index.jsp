<%-- 
    Document   : menu
    Created on : 20/11/2012, 08:04:48
    Author     : Heleno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <style>
        .position-vertical-center {
            height: 500px;
            -webkit-height: 500px;
            display: flex;
            display: -webkit-flex;
            align-items: center;
            -webkit-align-items: center;
        }

        .position-center {
            width: 100%;
            -webkit-width: 100%;
            display: flex;
            display: -webkit-flex;
            justify-content: center;
            -webkit-justify-content: center;
        }
    </style>

    <body>
        <div class="block">
            <div class="position-vertical-center">
                <div class="position-center">
                    <center>
                        <h1>SCA</h1>
                        <b>Selecione perfil:</b>
                        <form method="post" action="LoginSistema">
                            <input type="radio" name="perfil" value="professor"/> Professor
                            <input type="radio" name="perfil" value="secretaria"/> Secretária
                            <input type="radio" name="perfil" value="aluno"/> Aluno
                            <br><br>
                            <button type="submit" name="acao" value="entrar">Entrar</button>
                        </form>
                    </center>
                </div>
            </div>
        </div>
    </body>
</html>
