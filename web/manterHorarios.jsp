<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Documento sem título</title>
    </head>
    <body>

        <h1>MANTER HORARIOS</h1>

        <form action="ManterHorariosController?acao=confirmarOperacao&operacao=${operacao}" method="post" name="frmManterHorarios" onsubmit="return verificaHorarios(this)" >
            <table>
                <tr>
                    <td> Código da Turma: </td>
                    <td> <input type="text" name="txtCodTurma" value="${turma.codTurma}" readonly/></td>
                </tr>
                <tr>
                    <td>Disciplina:</td>
                    <td>
                        <input type="text" name="txtNome" value="${turma.disciplina.nome}" readonly/>
                    </td>
                    <td>Vagas:</td>
                    <td>
                        <input type="text" name="txtVagas" value="${turma.numVagas}" readonly/>
                    </td>
                </tr>
                <tr>
                    <td>Professor:</td>
                    <td>
                        <input type="text" name="txtProfessor" value="${turma.professor.nome}" readonly/>
                    </td>
                    <td>Sala:</td>
                    <td>
                        <input type="text" name="txtSala" value="${turma.numSala}" readonly/>
                    </td>
                </tr>
                <tr>
                    <td>Ano:</td>
                    <td>
                        <input type="text" name="txtAno" value="${turma.ano}" readonly/>
                    </td>
                    <td>Semestre:</td>
                    <td>
                        <input type="text" name="txtSemestre" value="${turma.semestre}" readonly/>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <table border>
                            <tr>
                                <td>Horários</td>
                                <td>Segunda-Feira</td>
                                <td>Terça-Feira</td>
                                <td>Quarta-Feira</td>
                                <td>Quinta-Feira</td>
                                <td>Sexta-Feira</td>
                            </tr>
                            <c:forEach items="${horas}" var="hora">
                                <tr>
                                    <td>
                                        ${hora.inicio} - ${hora.fim}
                                    </td>
                                    <c:forEach begin="2" end="6" var="dia">
                                        <td>
                                            <input type="checkbox" value="${dia}-${hora.inicio}" name="quadroHorario"
                                                   <c:forEach items="${turma.horarios}" var="horario">
                                                       <c:if test="${horario.diaSemana == dia and horario.horarioInicio eq hora.inicio}">
                                                           checked 
                                                       </c:if>
                                                   </c:forEach>
                                            />
                                        </td>
                                    </c:forEach>
                                </tr>
                            </c:forEach>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="hidden" name="horarioSerial" value="${horarioSerial}"/>
                        <input type="button" value="Voltar" onclick="javascript:history.back(-1)"/>
                    </td>
                    <td colspan="2"></td>
                    <td>
                        <input type="submit" value="Confirmar"/>
                    </td>
                </tr>
            </table>
        </form>
    </body>
    <script language="JavaScript">
            //<!---
            function verificaHorarios(form) {
                var horarioSerial = "";
                for (i = 0; i < form.quadroHorario.length; i++) {
                    if (form.quadroHorario[i].checked) {
                        horarioSerial += form.quadroHorario[i].value + ",";
                    }
                }
                form.horarioSerial.value = horarioSerial;
                
                return true;
            }
            //--->
    </script>
</html>