
package Persistencia;

import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import Logica.Doctor;
import Logica.HorarioAtencion;
import Persistencia.exceptions.NonexistentEntityException;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class HorarioAtencionJpaController implements Serializable {

    public HorarioAtencionJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;
    
    public HorarioAtencionJpaController(){
        emf = Persistence.createEntityManagerFactory("ClinicaOdontoPU");
    }
    
    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(HorarioAtencion horarioAtencion) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Doctor doctor = horarioAtencion.getDoctor();
            if (doctor != null) {
                doctor = em.getReference(doctor.getClass(), doctor.getId_doctor());
                horarioAtencion.setDoctor(doctor);
            }
            em.persist(horarioAtencion);
            if (doctor != null) {
                doctor.getListaHorarios().add(horarioAtencion);
                doctor = em.merge(doctor);
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(HorarioAtencion horarioAtencion) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            HorarioAtencion persistentHorarioAtencion = em.find(HorarioAtencion.class, horarioAtencion.getId_horario());
            Doctor doctorOld = persistentHorarioAtencion.getDoctor();
            Doctor doctorNew = horarioAtencion.getDoctor();
            if (doctorNew != null) {
                doctorNew = em.getReference(doctorNew.getClass(), doctorNew.getId_doctor());
                horarioAtencion.setDoctor(doctorNew);
            }
            horarioAtencion = em.merge(horarioAtencion);
            if (doctorOld != null && !doctorOld.equals(doctorNew)) {
                doctorOld.getListaHorarios().remove(horarioAtencion);
                doctorOld = em.merge(doctorOld);
            }
            if (doctorNew != null && !doctorNew.equals(doctorOld)) {
                doctorNew.getListaHorarios().add(horarioAtencion);
                doctorNew = em.merge(doctorNew);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = horarioAtencion.getId_horario();
                if (findHorarioAtencion(id) == null) {
                    throw new NonexistentEntityException("The horarioAtencion with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(int id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            HorarioAtencion horarioAtencion;
            try {
                horarioAtencion = em.getReference(HorarioAtencion.class, id);
                horarioAtencion.getId_horario();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The horarioAtencion with id " + id + " no longer exists.", enfe);
            }
            Doctor doctor = horarioAtencion.getDoctor();
            if (doctor != null) {
                doctor.getListaHorarios().remove(horarioAtencion);
                doctor = em.merge(doctor);
            }
            em.remove(horarioAtencion);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<HorarioAtencion> findHorarioAtencionEntities() {
        return findHorarioAtencionEntities(true, -1, -1);
    }

    public List<HorarioAtencion> findHorarioAtencionEntities(int maxResults, int firstResult) {
        return findHorarioAtencionEntities(false, maxResults, firstResult);
    }

    private List<HorarioAtencion> findHorarioAtencionEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(HorarioAtencion.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public HorarioAtencion findHorarioAtencion(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(HorarioAtencion.class, id);
        } finally {
            em.close();
        }
    }

    public int getHorarioAtencionCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<HorarioAtencion> rt = cq.from(HorarioAtencion.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
