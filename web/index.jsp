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
        <title>Menu</title>
    </head>
    <body>
        <a href="PesquisarCursoController">Manter Cursos</a> </br>
        <a href="PesquisarDisciplinaController?filtro=0">Manter Disciplinas</a> </br>
        <a href="PesquisarProfessorController">Manter Professores</a> </br>
        <a href="PesquisarAlunoController">Manter Alunos</a> </br>
        <a href="PesquisarTurmaController">Manter Turmas</a><br/>
        ---<br/>
        <a href="PesquisarMatrizCurricularController?acao=prepararOperacao">Consultar Matriz Curricular</a> <br />
        <a href="PesquisarProfessorPorCursoController?acao=prepararOperacao"> Consultar Professores Vinculados a cada Curso</a> <br />
        <a href="PesquisarNotaFrequenciaController?acao=prepararOperacao"> Manter Nota e Frequência</a> <br />
        <a href=""> Calcular Resultado de Rendimento do Aluno</a> <br />
        --- Relatórios ---<br/>
        <a href="ReatorioCursosController?acao=prepararOperacao">Relatório de Cursos</a></br>
        <a href="RelatorioProfessorController?acao=prepararOperacao">Relatório de Professores Por Titulação</a></br>
        <a href="RelatorioDisciplinaPorCursoController?acao=prepararOperacao">Relatório de Disciplina Por Cursos</a></br>
        <a href="RelatorioAlunoAnoSemestreController?acao=prepararOperacao">Relatório de Aluno Ano/Semestre</a></br>
        <a href="RelatorioDiarioDeClasseController?acao=prepararOperacao">Diário de Classe</a></br>
        <a href="ReatorioHistoricoAlunoController?acao=prepararOperacao">Historico</a></br>
    </body>
</html>
