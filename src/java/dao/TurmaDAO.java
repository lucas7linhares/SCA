package dao;

import util.HibernateUtil;
import java.sql.SQLException;
import java.util.List;
import model.Turma;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class TurmaDAO {

    public static void gravar(Turma turma) throws ClassNotFoundException, SQLException {
        Transaction tx = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            Transaction transaction = session.beginTransaction();
            tx = session.getTransaction();
            session.save(turma);
            if (!transaction.wasCommitted()) {
                transaction.commit();
            }
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public static void alterar(Turma turma) throws ClassNotFoundException, SQLException {
        Transaction tx = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            Transaction transaction = session.beginTransaction();
            tx = session.getTransaction();
            session.update(turma);
            if (!transaction.wasCommitted()) {
                transaction.commit();
            }
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public static void excluir(Turma turma) throws ClassNotFoundException, SQLException {
        Transaction tx = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            Transaction transaction = session.beginTransaction();
            tx = session.getTransaction();
            session.delete(turma);
            if (!transaction.wasCommitted()) {
                transaction.commit();
            }
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public static Turma obterTurma(int codTurma) throws ClassNotFoundException, SQLException {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        Turma turma = (Turma) session.load(Turma.class, codTurma);
        session.close();
        return turma;
    }

    public static List<Turma> obterTurmas() throws ClassNotFoundException, SQLException {
        Transaction tx = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Turma> turmas = null;
        try {
            Transaction transaction = session.beginTransaction();
            tx = session.getTransaction();
            Criteria crit = session.createCriteria(Turma.class);
            crit.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
            turmas = crit.list();
            if (!transaction.wasCommitted()) {
                transaction.commit();
            }
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
            return turmas;
        }
    }

    public static List<Turma> buscarTurmas(String codCurso, String ano, String semestre, String disciplina) throws ClassNotFoundException, SQLException {
        Transaction tx = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Turma> turmas = null;
        try {
            Transaction transaction = session.beginTransaction();
            tx = session.getTransaction();
            String sql = "";
            if (!codCurso.equals("0")) {
                sql += " codCurso=" + codCurso + " and";
            }
            if (!ano.equals("0")) {
                sql += " ano=" + ano + " and";
            }
            if (!semestre.equals("0")) {
                sql += " semestre=" + semestre + " and";
            }
            if (!disciplina.equals("")) {
                sql += " d.nome like '%" + disciplina + "%' and";
            }
            if (sql.length() == 0) {
                Criteria crit = session.createCriteria(Turma.class);
                crit.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
                turmas = crit.list();
            } else {
                sql = sql.substring(0, (sql.length() - 3));
                turmas = session.createQuery("from Turma where " + sql).list();
            }
            if (!transaction.wasCommitted()) {
                transaction.commit();
            }
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
            return turmas;
        }
    }

    public static List<String> buscarAnos() throws ClassNotFoundException, SQLException {
        Transaction tx = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<String> anos = null;
        try {
            Transaction transaction = session.beginTransaction();
            tx = session.getTransaction();
            anos = session.createQuery("select t.ano from Turma t group by ano").list();
            if (!transaction.wasCommitted()) {
                transaction.commit();
            }
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
            return anos;
        }
    }
    
    public static List<String> buscarSemestres() throws ClassNotFoundException, SQLException {
        Transaction tx = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<String> semestres = null;
        try {
            Transaction transaction = session.beginTransaction();
            tx = session.getTransaction();
            semestres = session.createQuery("select t.semestre from Turma t group by semestre").list();
            if (!transaction.wasCommitted()) {
                transaction.commit();
            }
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
            return semestres;
        }
    }
}
