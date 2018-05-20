<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manter Turma</title>
    </head>
    <body>
        <h1>MANTER TURMA - ${operacao}</h1>
        <form action="ManterTurmaController?acao=confirmarOperacao&operacao=${operacao}" method="post" name="frmManterTurma">
            <table>
                <tr>
                    <td>Código da Turma:</td>
                    <td><input type="text" name="txtCodTurma" value="${turma.codTurma}"<c:if test="${operacao != 'Incluir'}">readonly</c:if>/></td>
                </tr>
                <tr>
                    <td>Disciplina:</td>
                    <td>
                        <select name="optDisciplina" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                            <option value="0" <c:if test="${turma.disciplina.codDisciplina == null}"> selected </c:if></option>
                            <c:forEach items="${disciplinas}" var="disciplina">
                                <option value="${disciplina.codDisciplina}" <c:if test="${turma.disciplina.codDisciplina == disciplina.codDisciplina}"> selected</c:if>>${disciplina.nome}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td>Vagas:</td>
                    <td><input type="text" name="txtVagas" value="${turma.numVagas}"/></td>
                </tr>
                <tr><td>Professor:</td>
                    <td>
                        <select name="optProfessor" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                            <option value="0" <c:if test="${turma.professor.matricula == null}"> selected </c:if>></option>
                            <c:forEach items="${professores}" var="professor">
                                <option value="${professor.matricula}" <c:if test="${turma.professor.matricula == professor.matricula}"> selected</c:if>>${professor.nome}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td>Sala:</td>
                    <td><input type="text" name="txtSala" value="${turma.numSala}"></td>
                </tr>
                <tr>
                    <td>Ano:</td>
                    <td><input type="text" name="txtAno" value="${turma.ano}"></td>
                    <td>Semestre:</td>
                    <td>
                        <select name="optSemestre" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                            <option value="1" <c:if test="${turma.semestre == 1}"> selected </c:if>>1</option>
                            <option value="2" <c:if test="${turma.semestre == 2}"> selected</c:if>>2</option>
                            <option value="3" <c:if test="${turma.semestre == 3}"> selected</c:if>>3</option>
                            <option value="4" <c:if test="${turma.semestre == 4}"> selected</c:if>>4</option>
                            <option value="5" <c:if test="${turma.semestre == 5}"> selected</c:if>>5</option>
                            <option value="6" <c:if test="${turma.semestre == 6}"> selected</c:if>>6</option>
                            <option value="7" <c:if test="${turma.semestre == 7}"> selected</c:if>>7</option>
                            <option value="8" <c:if test="${turma.semestre == 8}"> selected</c:if>>8</option>
                            <option value="9" <c:if test="${turma.semestre == 9}"> selected</c:if>>9</option>
                            <option value="10" <c:if test="${turma.semestre == 10}"> selected</c:if>>10</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><input type="button" value="Voltar" onclick="javascript:history.back(-1)"></td>
                    <td colspan="2"></td>
                    <td>
                        <input type="hidden" name="horariosSerialized"/>
                        <input type="Submit" value="Confirmar"/>
                    </td>
                </tr>
        </form>
    </table>
</body>
</html>