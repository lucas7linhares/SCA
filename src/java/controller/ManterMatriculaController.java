package controller;

import java.io.IOException;
import java.sql.SQLException;
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
import model.Aluno;
import model.Avaliacao;
import model.AvaliacaoId;
import model.Curso;
import model.Turma;

public class ManterMatriculaController extends HttpServlet {

    private Avaliacao avaliacao;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acao = request.getParameter("acao");
        if (acao.equals("confirmarOperacao")) {
            confirmarOperacao(request, response);
        } else if (acao.equals("prepararOperacao")) {
            prepararOperacao(request, response);
        }
    }

    public void prepararOperacao(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        try {
            String operacao = request.getParameter("operacao");
            request.setAttribute("operacao", operacao);
            request.setAttribute("turmas", Turma.obterTurmas());
            int matricula = Integer.parseInt(request.getParameter("matricula"));
            Aluno aluno = Aluno.obterAluno(matricula);
            request.setAttribute("aluno", aluno);
            request.setAttribute("avaliacoes", Avaliacao.obterAvaliacoesPorAluno(matricula));
            RequestDispatcher view = request.getRequestDispatcher("/manterMatricula.jsp");
            request.setAttribute("cursos", Curso.obterCursos());

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

    public void confirmarOperacao(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        String operacao = request.getParameter("operacao");
        int matricula = Integer.parseInt(request.getParameter("txtMatricula"));
        try {
            List<Avaliacao> avaliacoesAnt = Avaliacao.obterAvaliacoesPorAluno(matricula);
            
            for(Avaliacao a:avaliacoesAnt){
                a.excluir();
            }
            
            Set<Turma> turmas = new HashSet<Turma>();
            String listTurmas = request.getParameter("turmaSerial");
            List<String> turmasList = Arrays.asList(listTurmas.split(","));
             for (String e : turmasList) {
                if (!e.equals("")) {
                    Turma turma = new Turma();
                    turma.setCodTurma(Integer.parseInt(e));
                    turmas.add(turma);
                }
            }
            Aluno aluno = new Aluno();
            aluno.setMatricula(matricula);
            Set<Avaliacao> avaliacoes = new HashSet<Avaliacao>();
            for(Turma t:turmas){
                AvaliacaoId avaliacaoId = new AvaliacaoId(aluno.getMatricula(), t.getCodTurma());
                Avaliacao avaliacao = new Avaliacao(avaliacaoId, aluno, t);
                avaliacao.gravar();
                
            }
            RequestDispatcher view = request.getRequestDispatcher("PesquisarAlunoController");
            view.forward(request, response);
            
        } catch (IOException e) {
            throw new ServletException(e);
        } catch (SQLException e) {
            throw new ServletException(e);
        } catch (ClassNotFoundException e) {
            throw new ServletException(e);
        } catch (ServletException e) {
            throw e;
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
        processRequest(request, response);
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
        processRequest(request, response);
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
