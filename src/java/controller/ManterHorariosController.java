package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Horario;
import util.Horarios;
import model.Professor;
import model.Turma;

public class ManterHorariosController extends HttpServlet {

    private Set<Horario> horarios = new HashSet<Horario>(0);

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
            int codTurma = Integer.parseInt(request.getParameter("codTurma"));
            Turma turma = Turma.obterTurma(codTurma);
            request.setAttribute("turma", turma);

            List<Enum> horas = new ArrayList<Enum>();
            horas.addAll(Arrays.asList(Horarios.values()));
            request.setAttribute("horas", horas);

            RequestDispatcher view = request.getRequestDispatcher("/manterHorarios.jsp");
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
        String horarioSerial = request.getParameter("horarioSerial");
        int codTurma = Integer.parseInt(request.getParameter("txtCodTurma"));
        List<String> diaHora = Arrays.asList(horarioSerial.split(","));

        Set<Horario> horarios = new HashSet<Horario>();


        try {
            List<Horario> horariosAnt = Horario.obterHorariosPorTurma(codTurma);
                    
            for(Horario h: horariosAnt){
                h.excluir();
            }

            Turma turma = new Turma();
            turma.setCodTurma(codTurma);

            for (String e : diaHora) {
                if (!e.equals("")) {
                    Horario horario;
                    String vetDiaHora[] = e.split("-");
                    int dia = Integer.parseInt(vetDiaHora[0]);
                    String hora = vetDiaHora[1];
                    horario = new Horario(turma, dia, hora);
                    horarios.add(horario);
                }
            }
            
            for(Horario h: horarios){
                h.gravar();
            }
            
            RequestDispatcher view = request.getRequestDispatcher("PesquisarTurmaController");
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
