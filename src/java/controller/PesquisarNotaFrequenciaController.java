package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Professor;
import model.Turma;

public class PesquisarNotaFrequenciaController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acao = request.getParameter("acao");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            request.setAttribute("professores", Professor.obterProfessores());
            request.setAttribute("acao", acao);

            if (!acao.equals("prepararOperacao")) {
                int matricula = Integer.parseInt(request.getParameter("optProfessor"));
                List<Turma> turmas = Turma.obterTurmas();
                List<Turma> turmaExcluir = new ArrayList<Turma>();

                for (Turma turma : turmas) {
                    if (turma.getProfessor().getMatricula() != matricula) {
                        turmaExcluir.add(turma);
                    }
                }

                turmas.removeAll(turmaExcluir);

                request.setAttribute("turmas", turmas);
                request.setAttribute("matricula", matricula);
            }

            RequestDispatcher janela = request.getRequestDispatcher("/pesquisarNotaFrequencia.jsp");
            janela.forward(request, response);
        } catch (ClassNotFoundException e) {
            throw new ServletException(e);
        } catch (SQLException e) {
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
