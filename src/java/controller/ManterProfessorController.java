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
import model.Curso;
import model.Professor;
import util.ConverteData;
import util.Estados;

/**
 *
 * @author Heleno
 */
public class ManterProfessorController extends HttpServlet {
    private Professor professor;
    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        int matricula = Integer.parseInt(request.getParameter("matricula"));
        String nomeProfessor = request.getParameter("nomeProfessor");
        Date dataNascimento = ConverteData.converte(request.getParameter("dataNascimento"));
        String logradouro = request.getParameter("logradouro");
        int numero = Integer.parseInt(request.getParameter("numero"));
        String complemento = request.getParameter("complemento");
        String bairro = request.getParameter("bairro");
        String cep = request.getParameter("cep");
        String cidade = request.getParameter("cidade");
        String estado = request.getParameter("estado");
        String email = request.getParameter("email");
        Date dataIngresso = ConverteData.converte(request.getParameter("dataIngresso"));
        String titulacao = request.getParameter("titulacao");
        int codCurso = Integer.parseInt(request.getParameter("curso"));
        
        if (operacao.equals("incluir")) {
            professor = new Professor(matricula, nomeProfessor, dataNascimento,
                logradouro, numero, complemento, bairro, cep, cidade, estado, email,
                dataIngresso, titulacao, Curso.obterCurso(codCurso));
            professor.gravar();
        } else if (operacao.equals("editar")) {
            professor.setNome(nomeProfessor);
            professor.setDtNascimento(dataNascimento);
            professor.setEndLogradouro(logradouro);
            professor.setEndNumero(numero);
            professor.setEndComplemento(complemento);
            professor.setEndBairro(bairro);
            professor.setEndCep(cep);
            professor.setEndCidade(cidade);
            professor.setEndEstado(estado);
            professor.setEmail(email);
            professor.setDtIngresso(dataIngresso);
            professor.setTitulacao(titulacao);
            professor.setCurso(Curso.obterCurso(codCurso));
            professor.editar();
        } else if (operacao.equals("excluir")) {
            professor.excluir();
        }
        
        RequestDispatcher view = request.getRequestDispatcher("PesquisarProfessorController");
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
            
            if (!operacao.equals("incluir")) {
                int matriculaProfessor = Integer.parseInt(request.getParameter("matricula"));
                professor = Professor.obterProfessor(matriculaProfessor);
                request.setAttribute("professor", professor);
            }
            RequestDispatcher view = request.getRequestDispatcher("/manterProfessor.jsp");
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
