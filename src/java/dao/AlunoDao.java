/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.SQLException;
import java.util.List;
import model.Aluno;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

public class AlunoDao {

    public static List<Aluno> obterAlunos() throws ClassNotFoundException, SQLException {
        Transaction tx = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Aluno> alunos = null;
        try {
            Transaction transaction = session.beginTransaction();
            tx = session.getTransaction();
            alunos = session.createCriteria(Aluno.class).list();
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
            return alunos;
        }

    }

    public static List<Aluno> obterAlunosPorNome(String nome) throws ClassNotFoundException, SQLException {
        Transaction tx = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Aluno> alunos = null;
        try {
            Transaction transaction = session.beginTransaction();
            tx = session.getTransaction();
            alunos = session.createQuery(
                    "from Aluno where nome like'%" + nome + "%'").list();
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
            return alunos;
        }
    }

    public static Aluno obterAluno(int matricula) throws ClassNotFoundException, SQLException {
        Transaction tx = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Aluno aluno = null;
        try {
            Transaction transaction = session.beginTransaction();
            tx = session.getTransaction();
            aluno = (Aluno) session.load(Aluno.class, matricula);
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
            return aluno;
        }
    }

    public static void gravarAluno(Aluno aluno) throws SQLException, ClassNotFoundException {
        Transaction tx = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            Transaction transaction = session.beginTransaction();
            tx = session.getTransaction();
            session.save(aluno);
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

    public static void editarAluno(Aluno aluno) throws SQLException, ClassNotFoundException {
        Transaction tx = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            Transaction transaction = session.beginTransaction();
            tx = session.getTransaction();
            session.update(aluno);
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

    public static void excluirAluno(Aluno aluno) throws SQLException, ClassNotFoundException {
        Transaction tx = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            Transaction transaction = session.beginTransaction();
            tx = session.getTransaction();
            session.delete(aluno);
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

}
