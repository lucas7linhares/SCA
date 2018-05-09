<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Manter Matricula</title>
    </head>
    <body>

        <h1>EFETUAR MATRÍCULA - ${operacao}</h1>

        <form  method="post" action="ManterMatriculaController?acao=confirmarOperacao&operacao=${operacao}" name="frmManterMatricula" onsubmit="return verificaHorarios(this)">
            <table>
                <tr>
                    <td>Matrícula</td>
                    <td><input type="text" name="txtMatricula" value="${aluno.matricula}"></td>
                </tr>
                <tr>
                    <td>Nome:</td>
                    <td><input type="text" name="txtNome" value="${aluno.nome}"></td>
                </tr>
            </table>
            <table border>
                <tr>
                    <td></td><td>Nome da Disciplina</td><td>Horário da Turma</td>
                </tr>
                <c:forEach items="${turmas}" var="turma">
                    <tr>
                        <td><input type="checkbox" name="chkTurmas" value="${turma.codTurma}"
                                   <c:forEach items="${avaliacoes}" var="avaliacao">
                                       <c:if test="${turma.codTurma == avaliacao.id.codTurma}"> checked</c:if>
                                   </c:forEach>/></td>
                        <td>${turma.disciplina.nome}</td>
                        <td>Terça 13h - 15h Quinta 16h - 19h</td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="2"><input type="button" value="Voltar" onclick="javascript:history.back(-1)"/></td>
                    <input type="hidden" name="turmaSerial" value=""/>
                    <td><input type="submit" name="btnIncluir" value="Confirmar" /></td>
                </tr>
            </table>
        </form>

        <SCRIPT type="text/javascript">
            //<!--
            function verificaHorarios(form) {
                var turmaSerial = "";
                for (i = 0; i < form.chkTurmas.length; i++) {
                    if (form.chkTurmas[i].checked) {
                        turmaSerial += form.chkTurmas[i].value + ",";
                    }
                }
                form.turmaSerial.value = turmaSerial;
                
                return true;
            }
            //-->
        </SCRIPT>        
    </body>
</html>
