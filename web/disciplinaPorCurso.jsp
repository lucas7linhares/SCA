<%-- 
    Document   : disciplinaPorCurso
    Created on : 09/05/2013, 04:54:25
    Author     : José Augusto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Emtir Relatório de Disciplina Por Curso</title>
    </head>
    <body>
        <h1>Emtir Relatório de Disciplina Por Curso</h1>
        
        <form action="RelatorioDisciplinaPorCursoController?acao=confirmarOperacao" method="post">
            Digite o código do curso: <input type="text" name="txtCodCurso">
            <input type="submit" value="Emitir">
        </form>
    </body>
</html>
