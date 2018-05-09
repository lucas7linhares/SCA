<%-- 
    Document   : EmitirRelatorioAlunoAnoSemestre
    Created on : 09/05/2013, 08:59:22
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
        <h1>Emtir Relatório de Aluno por Ano/Semestre de Ingresso</h1>
        
        <form action="RelatorioAlunoAnoSemestreController?acao=confirmarOperacao" method="post">
            Ano de Ingresso:<input type="text" name="txtAnoIngresso"></br>
            Semestre de Ingresso:<input type="text" name="txtSemestreIngresso"></br>
            <input type="submit" value="Emitir">
        </form>
    </body>
</html>
