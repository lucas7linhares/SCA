package model;
// Generated 27/05/2013 11:14:03 by Hibernate Tools 3.2.1.GA

import dao.TurmaDAO;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "turma", catalog = "sca")
public class Turma implements java.io.Serializable {

    private Integer codTurma;
    private Professor professor;
    private Disciplina disciplina;
    private Integer semestre;
    private Integer ano;
    private Integer numVagas;
    private String numSala;
    private Set<Avaliacao> avaliacaos = new HashSet<Avaliacao>(0);
    private Set<Horario> horarios = new HashSet<Horario>(0);

    public Turma() {
    }

    public Turma(Professor professor, Disciplina disciplina) {
        this.professor = professor;
        this.disciplina = disciplina;
    }

    public Turma(Professor professor, Disciplina disciplina, Integer semestre, Integer ano, Integer numVagas, String numSala, Set<Avaliacao> avaliacaos, Set<Horario> horarios) {
        this.professor = professor;
        this.disciplina = disciplina;
        this.semestre = semestre;
        this.ano = ano;
        this.numVagas = numVagas;
        this.numSala = numSala;
        this.avaliacaos = avaliacaos;
        this.horarios = horarios;
    }

    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "codTurma", unique = true, nullable = false)
    public Integer getCodTurma() {
        return this.codTurma;
    }

    public void setCodTurma(Integer codTurma) {
        this.codTurma = codTurma;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "matriculaProfessor", nullable = false)
    public Professor getProfessor() {
        return this.professor;
    }

    public void setProfessor(Professor professor) {
        this.professor = professor;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "codDisciplina", nullable = false)
    public Disciplina getDisciplina() {
        return this.disciplina;
    }

    public void setDisciplina(Disciplina disciplina) {
        this.disciplina = disciplina;
    }

    @Column(name = "semestre")
    public Integer getSemestre() {
        return this.semestre;
    }

    public void setSemestre(Integer semestre) {
        this.semestre = semestre;
    }

    @Column(name = "ano")
    public Integer getAno() {
        return this.ano;
    }

    public void setAno(Integer ano) {
        this.ano = ano;
    }

    @Column(name = "numVagas")
    public Integer getNumVagas() {
        return this.numVagas;
    }

    public void setNumVagas(Integer numVagas) {
        this.numVagas = numVagas;
    }

    @Column(name = "numSala", length = 25)
    public String getNumSala() {
        return this.numSala;
    }

    public void setNumSala(String numSala) {
        this.numSala = numSala;
    }

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "turma")
    public Set<Avaliacao> getAvaliacaos() {
        return this.avaliacaos;
    }

    public void setAvaliacaos(Set<Avaliacao> avaliacaos) {
        this.avaliacaos = avaliacaos;
    }

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "turma")
    public Set<Horario> getHorarios() {
        return this.horarios;
    }

    public void setHorarios(Set<Horario> horarios) {
        this.horarios = horarios;
    }

    public static List<Turma> obterTurmas() throws ClassNotFoundException, SQLException {
        return TurmaDAO.obterTurmas();
    }

    public static Turma obterTurma(int codTurma) throws ClassNotFoundException, SQLException {
        return TurmaDAO.obterTurma(codTurma);
    }

    public void setCodTurma(int codTurma) {
        this.codTurma = codTurma;
    }

    public void gravar() throws ClassNotFoundException, SQLException {
        TurmaDAO.gravar(this);
    }

    public void alterar() throws ClassNotFoundException, SQLException {
        TurmaDAO.alterar(this);
    }

    public void excluir() throws ClassNotFoundException, SQLException {
        TurmaDAO.excluir(this);
    }
    
    public static List<Turma> buscarTurmas(String codCurso, String ano, String semestre, String disciplina) throws ClassNotFoundException, SQLException {
        return TurmaDAO.buscarTurmas(codCurso, ano, semestre, disciplina);
    }
    
    public static List<String> buscarAnos() throws ClassNotFoundException, SQLException {
        return TurmaDAO.buscarAnos();
    }
    
    public static List<String> buscarSemestres() throws ClassNotFoundException, SQLException {
        return TurmaDAO.buscarSemestres();
    }
}