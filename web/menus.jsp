<%-- 
    Document   : menus
    Created on : 19/05/2018, 16:29:03
    Author     : Lucas Linhares
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu</title>
    </head>
    <body>
        <c:if test="${perfil == 'secretaria'}">
            <a href="PesquisarCursoController">Manter Cursos</a> </br>
            <a href="PesquisarDisciplinaController?filtro=0">Manter Disciplinas</a> </br>
            <a href="PesquisarProfessorController">Manter Professores</a> </br>
            <a href="PesquisarAlunoController">Manter Alunos</a> </br>
            <a href="PesquisarTurmaController">Manter Turmas</a><br/>
        </c:if>
        <c:if test="${perfil == 'professor'}">
            <a href="PesquisarMatrizCurricularController?acao=prepararOperacao">Consultar Matriz Curricular</a> <br />
            <a href="PesquisarProfessorPorCursoController?acao=prepararOperacao"> Consultar Professores Vinculados a cada Curso</a> <br />
            <a href="PesquisarNotaFrequenciaController?acao=prepararOperacao"> Manter Nota e Frequência</a> <br />
        </c:if>
        <c:if test="${perfil == 'aluno'}">
            <a href="RelatorioCursosController?acao=prepararOperacao">Relatório de Cursos</a></br>
            <a href="RelatorioProfessorController?acao=prepararOperacao">Relatório de Professores Por Titulação</a></br>
            <a href="RelatorioDisciplinaPorCursoController?acao=prepararOperacao">Relatório de Disciplina Por Cursos</a></br>
            <a href="RelatorioAlunoAnoSemestreController?acao=prepararOperacao">Relatório de Aluno Ano/Semestre</a></br>
            <a href="RelatorioDiarioDeClasseController?acao=prepararOperacao">Diário de Classe</a></br>
            <a href="RelatorioHistoricoAlunoController?acao=prepararOperacao">Historico</a></br>
        </c:if>
    </body>
</html>
