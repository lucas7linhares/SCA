<%-- 
    Document   : cadastro
    Created on : 20/11/2012, 08:16:01
    Author     : Heleno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manter Curso</title>
    </head>
    <body>
        
        <form action="manterCursoController?acao=confirmarOperacao&operacao=${operacao}" method="post" onSubmit="return validarFormulario(this)">
     
                       
            <table>
                <tr>
                    <td>
                        Codigo do Curso
                    </td>
                    
                    <td>
                        <input type="text" id="codCurso" name="codCurso" value="${curso.codCurso}"
                <c:if test="${operacao!='incluir'}"> readonly </c:if> >
                    </td>
                    
                    <td>
                        Total de Períodos
                    </td>
                    
                    <td>
                        <input type="text" id="totalPeriodos" name="totalPeriodos" value="${curso.totalPeriodos}"
                               <c:if test="${operacao=='excluir'}"> readonly </c:if> />
                    </td>
                        
                </tr>
                
                
                <tr>
                    <td>
                        Nome do Curso
                    </td>
                    
                    <td>
                        <input type="text" id="nomeCurso" name="nomeCurso" value="${curso.nome}"
                                <c:if test="${operacao=='excluir'}"> readonly </c:if>/>
                    </td>
                    
                    <td>
                        Tipo do Curso 
                    </td>
                    
                    <td>
                        <select id="tipoCurso" name="tipoCurso" <c:if test="${operacao=='excluir'}"> readonly</c:if>>
                            <option value="tecnicoConcomitante" <c:if test="${curso.tipoCurso=='tecnicoConcomitante'}"> selected</c:if>>
                                Técnico Concomitante
                            </option>
                            
                            <option value="tecnicoIntegrado" <c:if test="${curso.tipoCurso=='tecnicoIntegrado'}"> selected</c:if>>
                                Técnico Integrado
                            </option>
                            
                            <option value="superior" <c:if test="${curso.tipoCurso=='superior'}"> selected</c:if>>
                                Superior
                            </option>
                            
                            <option value="especializacao" <c:if test="${curso.tipoCurso=='especializacao'}"> selected</c:if>>
                                Especialização
                            </option>
                            
                            <option value="mestrado" <c:if test="${curso.tipoCurso=='mestrado'}"> selected</c:if>>
                                Mestrado
                            </option>
                            
                            <option value="doutorado" <c:if test="${curso.tipoCurso=='doutorado'}"> selected</c:if>>
                                Doutorado
                            </option>
                        </select>
                    </td>
                        
                </tr>
                
                <tr>
                    <td>
                        Professor Coordenador
                    </td>
                    
                    <td>
                         <select id="professorCoordenador" name="professorCoordenador" <c:if test="${operacao=='excluir'}"> readonly</c:if>>
                             <option value="0"  <c:if test="${curso.professor.matricula == null}">selected</c:if>>
                                <c:if test="${operacao!='excluir'}">Selecione um Professor</c:if>
                            </option>
                            <c:forEach items="${professores}" var="professor">
                                <option value="${professor.matricula}"   <c:if test="${professor.matricula==curso.professor.matricula}">selected</c:if>>
                                ${professor.nome}
                            </option>
                            </c:forEach>
                        </select>
                    </td>
                    
                    <td>
                        Carga Horária
                    </td>
                    
                    <td>
                        <input type="text" id="cargaHoraria" name="cargaHoraria" value="${curso.cargaHoraria}"
                                <c:if test="${operacao=='excluir'}"> readonly </c:if> />
                    </td>
                        
                </tr>
                
                <tr>
                    <td align="left">
                        <input type="button" id="voltar" name="voltar" value="Voltar" onClick="history.go(-1)"/>
                    </td>
                    
                    <td align="right" colspan="3">
                        <input type="submit" id="confirmar" name="confirmar" value="Confirmar"/>
                    </td>
                </tr>
            </table>
            
        </form>
    </body>
    
    <SCRIPT language="JavaScript">
        <!--
        function campoNumerico(valor){
            var caracteresValidos="0123456789";
            var ehNumero = true;
            var umCaracter;
            
            for(i=0;i<valor.length && ehNumero==true;i++){
                umCaracter=valor.charAt(i);
                if(caracteresValidos.indexOf(umCaracter) == -1){
                    ehNumero=false;
                }
                
            }
            return ehNumero;
        }
        
        function validarFormulario(form){
            var mensagem;
            mensagem="";
            
            if(form.codCurso.value==""){
                mensagem=mensagem+"Informe o código do Curso\n";
            }
            
            if(form.nomeCurso.value==""){
                mensagem=mensagem+"Informe o nome do Curso\n";
            }
            
            if(form.totalPeriodos.value==""){
                mensagem=mensagem+"Informe o total de periodos do Curso\n";
            }
            
            if(form.cargaHoraria.value==""){
                mensagem=mensagem+"Informe a carga horaria do Curso\n";
            }
            
            if(!campoNumerico(form.codCurso.value)){
                mensagem=mensagem+"Codigo do curso deve ser numerico\n";
            }
            
            if(!campoNumerico(form.totalPeriodos.value)){
                mensagem=mensagem+"Total de períodos do curso deve ser numerico\n";
            }
            
            if(!campoNumerico(form.cargaHoraria.value)){
                mensagem=mensagem+"Carga horaria do curso deve ser numerico\n";
            }
           
            if(mensagem==""){
                return true;
            }else{
                alert(mensagem);
                return false;
            }
        }
        
    </SCRIPT>
</html>
