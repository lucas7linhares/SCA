/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.SQLException;
import java.util.List;
import model.Curso;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

/**
 *
 * @author Heleno
 */
public class CursoDAO {
    public static void gravarCurso(Curso curso) throws SQLException, ClassNotFoundException{
        Transaction tx = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            Transaction transaction = session.beginTransaction();
            tx = session.getTransaction();
            session.save(curso);
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
    
    public static void editarCurso(Curso curso) throws SQLException, ClassNotFoundException{
        Transaction tx = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            Transaction transaction = session.beginTransaction();
            tx = session.getTransaction();
            session.update(curso);
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
    
    public static void excluirCurso(Curso curso) throws SQLException, ClassNotFoundException{
        Transaction tx = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            Transaction transaction = session.beginTransaction();
            tx = session.getTransaction();
            session.delete(curso);
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
    
    public static List<Curso> obterCursos() throws ClassNotFoundException, SQLException{ 
        Transaction tx = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Curso> cursos = null;
        try {
            Transaction transaction = session.beginTransaction();
            tx = session.getTransaction();
            cursos = session.createCriteria(Curso.class).list();
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
            return cursos;
        }
    }
    
    public static Curso obterCurso(int codCurso) throws ClassNotFoundException, SQLException{
        Transaction tx = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Curso curso = null;
        try {
            Transaction transaction = session.beginTransaction();
            tx = session.getTransaction();
            curso = (Curso) session.load(Curso.class, codCurso);
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
            return curso;
        }
    }
}
