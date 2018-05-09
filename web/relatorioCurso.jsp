<%-- 
    Document   : relatorioCurso
    Created on : 13/05/2013, 09:00:13
    Author     : José Augusto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Emtir Relatório Curso</title>
    </head>
    <body>
        <h1>Emtir Relatório Curso</h1>
        
        <form action="ReatorioCursosController?acao=confirmarOperacao" method="post">
            Digite o Código do curso:<input type="text" name="txtCodCurso">
            <input type="submit" value="Emitir">
        </form>
    </body>
</html>
