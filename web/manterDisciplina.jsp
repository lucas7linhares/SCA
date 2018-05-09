<%-- 
    Document   : manterDisciplina
    Created on : 20/11/2012, 08:43:44
    Author     : Heleno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="ManterDisciplinaController?acao=confirmarOperacao&operacao=${operacao}" method="post" onSubmit="return validarFormulario(this)">
            
            <table>
                <tr>
                    <td>
                        <input type="hidden" name="preRequisitosSerialized" id="listaPreRequisitos" value="${preRequisitosSerialized}">
                        Codigo
                    </td>
                    
                    <td>
                        <input type="text" id="codDisciplina" name="codDisciplina" value="${disciplina.codDisciplina}" <c:if test="${operacao!='incluir'}"> readonly </c:if>/>
                    </td>
                    
                    <td>
                        Período
                    </td>
                    
                    <td>
                        <c:if test="${operacao=='excluir'}"> 
                            <input type="hidden" value="${disciplina.periodo}" name="periodo">
                        </c:if>
                        <select id="periodo" name="periodo" <c:if test="${operacao=='excluir'}"> disabled</c:if>>
                            <option value="1" <c:if test="${disciplina.periodo == 1}">selected</c:if>>
                                1
                            </option>
                            
                            <option value="2" <c:if test="${disciplina.periodo == 2}">selected</c:if>>
                                2
                            </option>
                            
                            <option value="3" <c:if test="${disciplina.periodo == 3}">selected</c:if>>
                                3
                            </option>
                            
                            <option value="4" <c:if test="${disciplina.periodo == 4}">selected</c:if>>
                                4
                            </option>
                            
                            <option value="5" <c:if test="${disciplina.periodo == 5}">selected</c:if>>
                                5
                            </option>
                            
                            <option value="6" <c:if test="${disciplina.periodo == 6}">selected</c:if>>
                                6
                            </option>
                            
                            <option value="7" <c:if test="${disciplina.periodo == 7}">selected</c:if>>
                                7
                            </option>
                            
                            <option value="8" <c:if test="${disciplina.periodo == 8}">selected</c:if>>
                                8
                            </option>
                            
                            <option value="9" <c:if test="${disciplina.periodo == 9}">selected</c:if>>
                                9
                            </option>
                            
                            <option value="10" <c:if test="${disciplina.periodo == 10}">selected</c:if>>
                                10
                            </option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        Nome da Disciplina
                    </td>
                    
                    <td>
                        <input type="text" id="nomeDisciplina" name="nomeDisciplina" value="${disciplina.nome}" <c:if test="${operacao=='excluir'}"> readonly </c:if>/>
                    </td>
                    
                    <td>
                        Quantidade de Créditos
                    </td>
               
                    <td>
                        <input type="text" id="qtdCreditos" name="qtdCreditos" value="${disciplina.qtdeCreditos}" <c:if test="${operacao=='excluir'}"> readonly </c:if>/>
                    </td>
                </tr>
                <tr>
                    <td>
                        Curso:
                    </td>
                    
                    <td colspan="3">
                        <c:if test="${operacao=='excluir'}"> 
                            <input type="hidden" value="${disciplina.curso.codCurso}" name="curso">
                        </c:if>
                        <select id="curso" name="curso" <c:if test="${operacao=='excluir'}"> readonly</c:if> <c:if test="${operacao=='excluir'}"> disabled</c:if>>
                                 <option value="0" <c:if test="${disciplina.curso.codCurso == null}">selected</c:if>>
                                    <c:if test="${operacao!='excluir'}">Selecione um curso</c:if>
                                 </option>
                                <c:forEach items="${cursos}" var="curso">
                                    <option value="${curso.codCurso}" <c:if test="${disciplina.curso.codCurso eq curso.codCurso}">selected</c:if>>
                                        ${curso.nome}
                                    </option>
                                </c:forEach>
                            </select>
                    </td>    
                </tr>
                
                <tr>
                    <td>
                        Ementa:
                    </td>
                    
                    <td>
                        <textarea name="ementa" id="ementa" rows="10" cols="30" maxlength='300' <c:if test="${operacao=='excluir'}"> readonly </c:if>>${disciplina.ementa}</textarea>
                    </td>
                    
                    <td colspan="2">
                        <div style="border-style: solid;">
                            
                                <table>
                                    <tr>
                                        <td>
                                            Pré-Requisitos
                                        </td>

                                        <td>
                                        <select id="prerequisito" name="preRequisito" <c:if test="${operacao=='excluir'}"> disabled</c:if>>
                                            <c:forEach items="${preRequisitos}" var="preRequisito">
                                                <option value="${preRequisito.codDisciplina}">
                                                    ${preRequisito.nome}
                                                </option>
                                             </c:forEach>
                                       </select>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td colspan="2" align="center">
                                            <input type="button" onclick="adicionaDisciplina()" id="adicionar" value="Adicionar" <c:if test="${operacao=='excluir'}"> disabled</c:if>/>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td colspan="2" align="center">
                                            <table border="1" id="tbPreRequisitos">
                                                <tr>
                                                    <th>
                                                        Cod. Disciplina
                                                    </th>
                                                    <th>
                                                        Disciplina
                                                    </th>

                                                    <th>
                                                        Ação
                                                    </th>
                                                </tr>
                                                
                                                <c:forEach items="${disciplina.disciplinasForCodDisciplinaPreRequisito}" var="requisito">
                                                    <tr>
                                                        <td>
                                                            ${requisito.codDisciplina}
                                                        </td>
                                                        
                                                        <td>
                                                            ${requisito.nome}
                                                        </td>
                                                        
                                                        <td>
                                                            <a href="#" onclick="removeLinha(${requisito.codDisciplina})">Remover</a>
                                                        </td>    
                                                    </tr>
                                                </c:forEach>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                        </div>
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
     <SCRIPT language="JavaScript">
         
        function adicionaDisciplina(){
            var codDisciplina = document.getElementById("prerequisito").value;
            var nomeDisciplina = getSelectedText("prerequisito");
            
            var disciplinas = document.getElementById("listaPreRequisitos").value;
            var lista = disciplinas.split(",");
            var jaExiste = false;
            for(x=0; x<lista.length;x++){
                if(lista[x]==codDisciplina){
                    jaExiste = true;
                }
                
            }
            if(jaExiste==false){
                document.getElementById("listaPreRequisitos").value = document.getElementById("listaPreRequisitos").value  + codDisciplina + ",";
                var table = document.getElementById("tbPreRequisitos");
                var rowCount = table.rows.length;
                var row = table.insertRow(rowCount);
                var cell0 = row.insertCell(0);
                cell0.innerHTML = codDisciplina;
                var cell1 = row.insertCell(1);
                cell1.innerHTML = nomeDisciplina;
                var cell2 = row.insertCell(2);

                cell2.innerHTML = "<a href='#' onclick='removeLinha("+codDisciplina+")'>Remover</a>";
            }else{
                alert("A disciplina já existe na lista de Pre Requisitos.")
            }
           
            
        }
        
        function getSelectedText(elementId) {
            var elt = document.getElementById(elementId);
            if (elt.selectedIndex == -1)
                return null;

            return elt.options[elt.selectedIndex].text;
        }
        

 
        function removeLinha(codDisciplina) {
            var table = document.getElementById("tbPreRequisitos");
            
            var rowCount = table.rows.length;
 
            for(var i=1; i<rowCount; i++) {
                var row = table.rows[i];
                var cod = row.cells[0].innerHTML;
                if(null != cod && cod==codDisciplina) {
                    table.deleteRow(i);
                    rowCount--;
                    i--;
                }
            }
            var disciplinas = document.getElementById("listaPreRequisitos").value;
            document.getElementById("listaPreRequisitos").value="";
            var lista = disciplinas.split(",");
            for(x=0; x<lista.length;x++){
                if(lista[x]!=codDisciplina && lista[x]!=""){
                    document.getElementById("listaPreRequisitos").value=document.getElementById("listaPreRequisitos").value+lista[x]+",";
                }
                
            }
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
            
            if(form.codDisciplina.value==""){
                mensagem=mensagem+"Informe o código da Disciplina\n";
            }
            
            if(form.nomeDisciplina.value==""){
                mensagem=mensagem+"Informe o nome da Disciplina\n";
            }
            
            if(document.getElementById("ementa").value.length ==0){
                mensagem=mensagem+"Preencher a ementa da Disciplina.\n";
            }
            
            if(form.qtdCreditos.value==""){
                mensagem=mensagem+"Informe a quantidade de créditos da Disciplina\n";
            }
            
            if(form.curso.value=="0"){
                mensagem=mensagem+"Informe o curso da disciplina\n";
            }
            
            if(!campoNumerico(form.codDisciplina.value)){
                mensagem=mensagem+"Codigo da disicplina deve ser numerico\n";
            }
            
            if(!campoNumerico(form.qtdCreditos.value)){
                mensagem=mensagem+"Quantidade de créditos deve ser numerico\n";
            }
            
            
          
            if(mensagem==""){
                return true;
            }else{
                alert(mensagem);
                return false;
            }
        }
        
        
     </SCRIPT>