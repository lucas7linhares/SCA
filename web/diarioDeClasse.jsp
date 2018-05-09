<%-- 
    Document   : diarioDeClasse
    Created on : 12/05/2013, 19:16:18
    Author     : José Augusto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Emtir Diário de Classe</title>
    </head>
    <body>
        <h1>Emtir Diário de Classe</h1>
        
        <form action="RelatorioDiarioDeClasseController?acao=confirmarOperacao" method="post">
            Digite o Código da Turma: <input type="text" name="txtCodTurma">
            <input type="submit" value="Emitir">
        </form>
    </body>
</html>
