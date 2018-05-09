/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Curso;
import model.Disciplina;

/**
 *
 * @author Heleno
 */
public class ManterDisciplinaController extends HttpServlet {
    private List<Disciplina> disciplinas;
    private Disciplina disciplina;
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
            int codDisciplina = Integer.parseInt(request.getParameter("codDisciplina"));
            int periodo = Integer.parseInt(request.getParameter("periodo"));
            int codCurso = Integer.parseInt(request.getParameter("curso"));
            String nomeDisciplina = request.getParameter("nomeDisciplina");
            int qtdCreditos = Integer.parseInt(request.getParameter("qtdCreditos"));
            String ementa = request.getParameter("ementa");
            Set<Disciplina> preRequisitos = new HashSet<Disciplina>();
            List<String> elements = Arrays.asList(request.getParameter("preRequisitosSerialized").split(","));  
            
            for(String elemento: elements){
                if(!elemento.equals("")){
                    preRequisitos.add(Disciplina.obterDisciplina(Integer.parseInt(elemento)));
                }
            }
            Curso curso = Curso.obterCurso(codCurso);

            if (operacao.equals("incluir")) {
                disciplina = new Disciplina(codDisciplina, nomeDisciplina,ementa,periodo,qtdCreditos,curso,preRequisitos);
                disciplina.gravar();
            } else if (operacao.equals("editar")) {
                disciplina.setNome(nomeDisciplina);
                disciplina.setEmenta(ementa);
                disciplina.setPeriodo(periodo);
                disciplina.setQtdeCreditos(qtdCreditos);
                disciplina.setCurso(curso);
                disciplina.setDisciplinasForCodDisciplinaPreRequisito(preRequisitos);
                disciplina.editar();
            } else if (operacao.equals("excluir")) {
                disciplina.excluir();
            }
            
            RequestDispatcher view = request.getRequestDispatcher("PesquisarDisciplinaController?filtro=0");
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
            disciplinas = Disciplina.obterDisciplinas();
            request.setAttribute("preRequisitos", disciplinas);            
            if (!operacao.equals("incluir")) {
                int codDisciplina = Integer.parseInt(request.getParameter("codDisciplina"));
                disciplina = Disciplina.obterDisciplina(codDisciplina);
                request.setAttribute("disciplina", disciplina);
                String preRequisitosSerialized = "";
                for(Disciplina preRequisito: disciplina.getDisciplinasForCodDisciplinaPreRequisito()){
                    preRequisitosSerialized = preRequisitosSerialized + preRequisito.getCodDisciplina() + ",";
                }
                request.setAttribute("preRequisitosSerialized", preRequisitosSerialized);
            }
            RequestDispatcher view = request.getRequestDispatcher("/manterDisciplina.jsp");
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
