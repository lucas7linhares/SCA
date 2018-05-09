<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manter Aluno</title>
    </head>
    <body>
        <h1>Manter Aluno</h1>
        <form action="ManterAlunoController?acao=confirmarOperacao&operacao=${operacao}" method="post" onSubmit="return validarFormulario(this)">
            <table>
                <tr>
                    <td>
                        Matricula (gerada automaticamente)
                    </td>

                    <td>
                        <input type="text" id="matricula" name="matricula" value="${aluno.matricula}" readonly>
                    </td>

               </tr>

               <tr>
                   <td>
                       Nome
                   </td>

                   <td>
                       <input type="text" id="nome" name="nome" value="${aluno.nome}" <c:if test="${operacao=='excluir'}"> readonly </c:if>>
                   </td>

               </tr>

               <tr>
                   <td>
                       Data de Nascimento
                   </td>

                   <td>
                       <input type="text" id="dataNascimento" name="dataNascimento" onKeyUp="mascara(this,data);" maxlength="10"
                              value="<fmt:formatDate pattern='dd/MM/yyyy' value='${aluno.dtNascimento}' />" 
                              <c:if test="${operacao=='excluir'}"> readonly </c:if>>
                   </td>

               </tr>

               <tr>
                   <td>
                       Logradouro
                   </td>

                   <td>
                       <input type="text" id="logradouro" name="logradouro" value="${aluno.endLogradouro}" <c:if test="${operacao=='excluir'}"> readonly </c:if>>
                   </td>

               </tr>

               <tr>
                   <td>
                       Numero
                   </td>

                   <td>
                       <input type="text" id="numero" name="numero" value="${aluno.endNumero}" <c:if test="${operacao=='excluir'}"> readonly </c:if>>
                   </td>

                   <td>
                       Complemento
                   </td>

                   <td>
                       <input type="text" id="complemento" name="complemento" value="${aluno.endComplemento}" <c:if test="${operacao=='excluir'}"> readonly </c:if>>
                   </td>

                   <td>
                       Bairro
                   </td>

                   <td>
                       <input type="text" id="bairro" name="bairro" value="${aluno.endBairro}" <c:if test="${operacao=='excluir'}"> readonly </c:if>>
                   </td>

               </tr>

               <tr>
                   <td>
                       CEP
                   </td>

                   <td>
                       <input type="text" id="cep" name="cep" value="${aluno.endCep}" <c:if test="${operacao=='excluir'}"> readonly </c:if>>
                   </td>

                   <td>
                       Cidade
                   </td>

                   <td>
                       <input type="text" id="cidade" name="cidade" value="${aluno.endCidade}" <c:if test="${operacao=='excluir'}"> readonly </c:if>>
                   </td>

                   <td>
                       Estado
                   </td>

                   <td>
                       <select id="estado" name="estado" >
                           <option value="">Selecione um estado.</option>
                           <c:forEach items="${estados}" var="estado">
                           <option value="${estado.sigla}" <c:if test="${aluno.endEstado eq estado}">selected</c:if>>
                               ${estado.nome}
                           </option>
                           </c:forEach>
                       </select>
                   </td>

               </tr>

                <tr>
                   <td>
                       RG
                   </td>

                   <td>
                       <input type="text" id="rg" name="rg" value="${aluno.rg}" <c:if test="${operacao=='excluir'}"> readonly </c:if>>
                   </td>

                   <td>
                       CPF
                   </td>

                   <td>
                       <input type="text" id="cpf" name="cpf" value="${aluno.cpf}" <c:if test="${operacao=='excluir'}"> readonly </c:if>>
                   </td>

               </tr>

               <tr>
                   <td>
                       Email
                   </td>

                   <td>
                       <input type="text" id="email" name="email" value="${aluno.email}" <c:if test="${operacao=='excluir'}"> readonly </c:if>>
                   </td>

               </tr>

               <tr>
                   <td>
                       Curso
                   </td>

                   <td>
                       <select id="curso" name="curso" >
                                 <option value="0" <c:if test="${aluno.curso == null}">selected</c:if>>
                                    <c:if test="${operacao!='excluir'}">Selecione um curso</c:if>
                                 </option>
                                <c:forEach items="${cursos}" var="curso">
                                    <option value="${curso.codCurso}" <c:if test="${aluno.curso.codCurso eq curso.codCurso}">selected</c:if>>
                                        ${curso.nome}
                                    </option>
                                </c:forEach>
                      </select>
                   </td>

               </tr>

               <tr>
                   <td>
                       Ano de Ingresso
                   </td>

                   <td>
                       <input type="text" id="anoIngresso" name="anoIngresso" value="${aluno.anoIngresso}" <c:if test="${operacao=='excluir'}"> readonly </c:if>>
                   </td>

                   <td>
                       Semestre de Ingresso
                   </td>

                   <td>
                       <input type="text" id="semestreIngresso" name="semestreIngresso" value="${aluno.semestreIngresso}" >
                   </td>


                   <td>
                       <select id="status" name="status" <c:if test="${operacao=='excluir'}"> disabled</c:if>>
                           <option value="matriculado" <c:if test="${aluno.status eq 'matriculado'}">selected</c:if>>
                               Matriculado
                           </option>

                           <option value="trancado" <c:if test="${aluno.status eq 'trancado'}">selected</c:if>>
                               Trancado
                           </option>

                           <option value="formado" <c:if test="${aluno.status eq 'formado'}">selected</c:if>>
                               Formado
                           </option>
                       </select>
                   </td>
               </tr>

               <tr>
                   <td>
                       Posição Vestibular
                   </td>

                   <td>
                       <input type="text" id="posicaoVestibular" name="posicaoVestibular" value="${aluno.posicaoVestibular}" <c:if test="${operacao=='excluir'}"> readonly </c:if>>
                   </td>

               </tr>

                <tr>
                        <td align="left" colspan="3">
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
            
           if(form.nome.value==""){
                mensagem=mensagem+"Informe o nome do Aluno\n";
            }
            
            if(form.anoIngresso.value==""){
                mensagem=mensagem+"Informe o ano de Ingresso do Aluno\n";
            }
            
            if(form.semestreIngresso.value==""){
                mensagem=mensagem+"Informe o semestre de Ingresso do Aluno\n";
            }
            
            if(form.posicaoVestibular.value==""){
                mensagem=mensagem+"Informe a posição no Vestibular do Aluno\n";
            }
                         
            if(form.curso.value=="0"){
                mensagem=mensagem+"Informe o curso de atuação do professor\n";
            }
           
            if(!campoNumerico(form.numero.value)){
                mensagem=mensagem+"O número do endereço deve ser numerico\n";
            }
            
            if(!campoNumerico(form.anoIngresso.value)){
                mensagem=mensagem+"O ano de Ingresso deve ser numerico\n";
            }
            
            if(!campoNumerico(form.semestreIngresso.value)){
                mensagem=mensagem+"O semestre de Ingresso deve ser numerico\n";
            }
            
            if(mensagem==""){
                return true;
            }else{
                alert(mensagem);
                return false;
            }
        }
</script>