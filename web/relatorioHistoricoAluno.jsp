<%-- 
    Document   : relatorioHistoricoAluno
    Created on : 13/05/2013, 09:11:27
    Author     : José Augusto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Emtir Histórico</title>
    </head>
    <body>
        <h1>Emtir Histórico</h1>
        
        <form action="ReatorioHistoricoAlunoController?acao=confirmarOperacao" method="post">
            Digite a matricula do aluno:<input type="text" name="txtMatricula">
            <input type="submit" value="Emitir">
        </form>
    </body>
</html>
