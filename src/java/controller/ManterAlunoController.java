/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Aluno;
import model.Curso;
import util.ConverteData;
import util.Estados;

public class ManterAlunoController extends HttpServlet {
    private Aluno aluno;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {

        String acao = request.getParameter("acao");
        
        if(acao.equals("prepararOperacao")){
           prepararOperacao(request,response);
        }
        if(acao.equals("confirmarOperacao")){
            confirmarOperacao(request,response);
        }
    }
    
    public void confirmarOperacao(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            String operacao = request.getParameter("operacao");
            String nomeAluno = request.getParameter("nome");
            Date dataNascimento = ConverteData.converte(request.getParameter("dataNascimento"));
            String logradouro = request.getParameter("logradouro");
            int numero = 0;
            if(!request.getParameter("numero").equals("")){
                numero = Integer.parseInt(request.getParameter("numero"));
            }
            String complemento = request.getParameter("complemento");
            String bairro = request.getParameter("bairro");
            String cep = request.getParameter("cep");
            String cidade = request.getParameter("cidade");
            String estado = request.getParameter("estado");
            String rg = request.getParameter("rg");
            String cpf = request.getParameter("cpf");
            String email = request.getParameter("email");

            int anoIngresso = Integer.parseInt(request.getParameter("anoIngresso"));
            int semestreIngresso = Integer.parseInt(request.getParameter("semestreIngresso"));
            String status = request.getParameter("status");

            int posicaoVestibular = Integer.parseInt(request.getParameter("posicaoVestibular"));
            String posicaoVestibularString = String.valueOf(posicaoVestibular);
            if(posicaoVestibularString.length()==1){
                posicaoVestibularString="0".concat(posicaoVestibularString);
            }

            int codCurso = Integer.parseInt(request.getParameter("curso"));
            String codCursoString = String.valueOf(codCurso);
            if(codCursoString.length()==1){
                codCursoString="0".concat(codCursoString);
            }

            String anoIngressoString = String.valueOf(anoIngresso);
            if(anoIngressoString.length()>2){
                anoIngressoString = String.valueOf(anoIngresso).substring(String.valueOf(anoIngresso).length()-2,anoIngressoString.length());
            }

            String matriculaConcat = anoIngressoString + codCursoString+posicaoVestibularString;

            int matricula = Integer.parseInt(matriculaConcat);

            if (operacao.equals("Incluir")) {
                aluno = new Aluno(matricula, nomeAluno, dataNascimento,
                    logradouro, numero, complemento, bairro, cep, cidade, estado, rg,cpf,email,
                    anoIngresso, semestreIngresso, status, posicaoVestibular, Curso.obterCurso(codCurso));
                aluno.gravar();
            } else if (operacao.equals("Editar")) {
                aluno.setNome(nomeAluno);
                aluno.setDtNascimento(dataNascimento);
                aluno.setEndLogradouro(logradouro);
                aluno.setEndNumero(numero);
                aluno.setEndComplemento(complemento);
                aluno.setEndBairro(bairro);
                aluno.setEndCep(cep);
                aluno.setEndCidade(cidade);
                aluno.setEndEstado(estado);
                aluno.setRg(rg);
                aluno.setCpf(cpf);
                aluno.setEmail(email);
                aluno.setAnoIngresso(anoIngresso);
                aluno.setSemestreIngresso(semestreIngresso);
                aluno.setStatus(status);
                aluno.setPosicaoVestibular(posicaoVestibular);
                Curso curso = Curso.obterCurso(codCurso);
                aluno.setCurso(curso);
                aluno.editar();
            } else if (operacao.equals("Excluir")) {
                aluno.excluir();
            }
            RequestDispatcher view = request.getRequestDispatcher("PesquisarAlunoController");
            view.forward(request, response);
        
        }catch(ServletException e){
            throw e;
        }catch(IOException e){
            throw new ServletException(e);
        }catch(SQLException e){
            throw new ServletException(e);
        }catch(ClassNotFoundException e){
            throw new ServletException(e);
        }
    }
    
     public void prepararOperacao(HttpServletRequest request, HttpServletResponse response) throws ServletException{
         try {
            String operacao = request.getParameter("operacao");
            request.setAttribute("operacao", operacao);
            request.setAttribute("cursos", Curso.obterCursos());
            List<Enum> estados = new ArrayList<Enum>();
            estados.addAll(Arrays.asList(Estados.values()));
            
            request.setAttribute("estados", estados);
            
            if (!operacao.equals("Incluir")) {
                int matriculaAluno = Integer.parseInt(request.getParameter("matricula"));
                aluno = Aluno.obterAluno(matriculaAluno);
                request.setAttribute("aluno", aluno);
            }
            RequestDispatcher view = request.getRequestDispatcher("/manterAluno.jsp");
            view.forward(request, response);
        } catch (ServletException e) {
            throw e;
        } catch (IOException e) {
            throw new ServletException(e);
        } catch (SQLException e) {
            throw new ServletException(e);
        } catch (ClassNotFoundException e) {
            throw new ServletException(e);
        }
     }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ManterProfessorController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ManterProfessorController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ManterProfessorController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ManterProfessorController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    
    
   
}
