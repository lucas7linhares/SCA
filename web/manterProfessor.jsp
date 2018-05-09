<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manter Professor</title>
    </head>
    <body>
        <h1>Manter Professor</h1>
        <form action="ManterProfessorController?acao=confirmarOperacao&operacao=${operacao}" method="post" onSubmit="return validarFormulario(this)">
            <table>
                <tr>
                    <td>
                        Matrícula
                    </td>

                    <td>
                        <input type="text" id="matricula" name="matricula" value="${professor.matricula}"
                               <c:if test="${operacao!='incluir'}"> readonly </c:if> >
                    </td>

                    <td>
                        Nome
                    </td>

                    <td>
                        <input type="text" id="nomeProfessor" name="nomeProfessor" value="${professor.nome}"
                           <c:if test="${operacao=='excluir'}"> readonly </c:if>>
                    </td>
                </tr>

                <tr>
                    <td>
                        Data Nascimento
                    </td>

                    <td>
                         <input type="text" id="dataNascimento" name="dataNascimento" onKeyUp="mascara(this,data);" maxlength="10"
                              value="<fmt:formatDate pattern='dd/MM/yyyy' value='${professor.dtNascimento}' />" 
                              <c:if test="${operacao=='excluir'}"> readonly </c:if>>
                               
                    </td>

                    <td>
                        Logradouro
                    </td>

                    <td>
                        <input type="text" name="logradouro" id="logradouro" value="${professor.endLogradouro}"
                           <c:if test="${operacao=='excluir'}"> readonly </c:if>>
                    </td>
                </tr>

                <tr>
                    <td>
                        Numero
                    </td>

                    <td>
                        <input type="text" id="numero" name="numero" value="${professor.endNumero}"
                           <c:if test="${operacao=='excluir'}"> readonly </c:if>>
                    </td>

                    <td>
                        Complemento
                    </td>

                    <td>
                        <input type="text" id="complemento" name="complemento" value="${professor.endComplemento}"
                           <c:if test="${operacao=='excluir'}"> readonly </c:if>>
                    </td>

                </tr>

                <tr>
                    <td>
                        Bairro
                    </td>

                    <td>
                        <input type="text" id="bairro" name="bairro" value="${professor.endBairro}"
                           <c:if test="${operacao=='excluir'}"> readonly </c:if>>
                    </td>

                    <td>
                        CEP:
                    </td>

                    <td>
                        <input type="text" id="cep" name="cep" value="${professor.endCep}"
                           <c:if test="${operacao=='excluir'}"> readonly </c:if>>
                    </td>

                </tr>

                <tr>
                    <td>
                        Cidade
                    </td>

                    <td>
                        <input type="text" id="cidade" name="cidade" value="${professor.endCidade}"
                           <c:if test="${operacao=='excluir'}"> readonly </c:if>>
                    </td>

                    <td>
                        Estado
                    </td>

                    <td>
                        <select id="estado" name="estado">
                           <option value="">Selecione um estado.</option>
                           <c:forEach items="${estados}" var="estado">
                            <option value="${estado.sigla}" <c:if test="${professor.endEstado eq estado}">selected</c:if>>
                                ${estado.nome}
                            </option>
                           </c:forEach>
                       </select>
                    </td>
                </tr>
                <tr>    
                    <td>
                        Email
                    </td>

                    <td>
                        <input type="text" id="email" name="email" value="${professor.email}"
                           <c:if test="${operacao=='excluir'}"> readonly </c:if>>
                    </td>

                    <td>
                        Data de Ingresso
                    </td>

                    <td>
                         <input type="text" id="dataIngresso" name="dataIngresso" onKeyUp="mascara(this,data);" maxlength="10"
                              value="<fmt:formatDate pattern='dd/MM/yyyy' value='${professor.dtIngresso}' />" 
                              <c:if test="${operacao=='excluir'}"> readonly </c:if>>
                        
                    </td>
                </tr>

                <tr>
                    <td>
                        Titulação
                    </td>

                    <td>
                        <select id="titulacao" name="titulacao" <c:if test="${operacao=='Excluir'}"> readonly</c:if>>
                            <option value="" <c:if test="${professor.titulacao eq 'null'}">selected</c:if>>
                                <c:if test="${operacao!='excluir'}">Selecione uma titulação</c:if>
                            </option>
                            <option value="graduacao"<c:if test="${professor.titulacao eq 'graduacao'}">selected</c:if>>
                                Graduação
                            </option>
                            
                            <option value="especializacao" <c:if test="${professor.titulacao eq 'especializacao'}">selected</c:if>>
                                Especialização
                            </option>
                            
                            <option value="mestrado" <c:if test="${professor.titulacao eq 'mestrado'}">selected</c:if>>
                                Mestrado
                            </option>
                            
                            <option value="doutorado" <c:if test="${professor.titulacao eq 'doutorado'}">selected</c:if>>
                                Doutorado
                            </option>
                        </select>
                    </td>

                    <td>
                        Curso principal de atuação
                    </td>

                    <td>
                        <select id="cursoAtuacao" name="curso" <c:if test="${operacao=='excluir'}"> readonly</c:if>>
                             <option value="0" <c:if test="${professor.curso.codCurso == null}">selected</c:if>>
                                <c:if test="${operacao!='excluir'}">Selecione um curso</c:if>
                             </option>
                            <c:forEach items="${cursos}" var="curso">
                                <option value="${curso.codCurso}" <c:if test="${professor.curso.codCurso eq curso.codCurso}">selected</c:if>>
                                    ${curso.nome}
                                </option>
                            </c:forEach>
                        </select>
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
</html>
<script language="JavaScript" type="text/javascript">
function mascara(o,f){
	v_obj=o
	v_fun=f
	setTimeout("execmascara()",1)
}

function execmascara(){
	v_obj.value=v_fun(v_obj.value)
}

function data(v){

	v=v.replace(/\D/g,"")
	v=v.replace(/(\d{2})(\d)/,"$1/$2")
	v=v.replace(/(\d{2})(\d)/,"$1/$2")
	return v
}

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
            
            if(form.matricula.value==""){
                mensagem=mensagem+"Informe a matrícula do Professor\n";
            }
            
            if(form.nomeProfessor.value==""){
                mensagem=mensagem+"Informe o nome do Professor\n";
            }
           
            if(form.cursoAtuacao.value=="0"){
                mensagem=mensagem+"Informe o curso de atuação do professor\n";
            }
            
            if(form.titulacao.value==""){
                mensagem=mensagem+"Informe a titulação do professor\n";
            }
            
            if(!campoNumerico(form.matricula.value)){
                mensagem=mensagem+"A matricula do professor deve ser numerico\n";
            }
            
            if(!campoNumerico(form.numero.value)){
                mensagem=mensagem+"O numero do endereço deve ser numerico\n";
            }
            
            if(mensagem==""){
                return true;
            }else{
                alert(mensagem);
                return false;
            }
        }
</script>