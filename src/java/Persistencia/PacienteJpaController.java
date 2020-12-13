
package Persistencia;

import Logica.Paciente;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import Logica.Responsable;
import Logica.Turno;
import Persistencia.exceptions.NonexistentEntityException;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class PacienteJpaController implements Serializable {

    public PacienteJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;
    
    public PacienteJpaController(){
        emf = Persistence.createEntityManagerFactory("ClinicaOdontoPU");
    }
    
    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Paciente paciente) {
        if (paciente.getListaTurnos() == null) {
            paciente.setListaTurnos(new ArrayList<Turno>());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Responsable responsable = paciente.getResponsable();
            if (responsable != null) {
                responsable = em.getReference(responsable.getClass(), responsable.getId_responsable());
                paciente.setResponsable(responsable);
            }
            List<Turno> attachedListaTurnos = new ArrayList<Turno>();
            for (Turno listaTurnosTurnoToAttach : paciente.getListaTurnos()) {
                listaTurnosTurnoToAttach = em.getReference(listaTurnosTurnoToAttach.getClass(), listaTurnosTurnoToAttach.getId_turno());
                attachedListaTurnos.add(listaTurnosTurnoToAttach);
            }
            paciente.setListaTurnos(attachedListaTurnos);
            em.persist(paciente);
            if (responsable != null) {
                Paciente oldPacienteOfResponsable = responsable.getPaciente();
                if (oldPacienteOfResponsable != null) {
                    oldPacienteOfResponsable.setResponsable(null);
                    oldPacienteOfResponsable = em.merge(oldPacienteOfResponsable);
                }
                responsable.setPaciente(paciente);
                responsable = em.merge(responsable);
            }
            for (Turno listaTurnosTurno : paciente.getListaTurnos()) {
                Paciente oldPacienteOfListaTurnosTurno = listaTurnosTurno.getPaciente();
                listaTurnosTurno.setPaciente(paciente);
                listaTurnosTurno = em.merge(listaTurnosTurno);
                if (oldPacienteOfListaTurnosTurno != null) {
                    oldPacienteOfListaTurnosTurno.getListaTurnos().remove(listaTurnosTurno);
                    oldPacienteOfListaTurnosTurno = em.merge(oldPacienteOfListaTurnosTurno);
                }
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Paciente paciente) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Paciente persistentPaciente = em.find(Paciente.class, paciente.getId_paciente());
            Responsable responsableOld = persistentPaciente.getResponsable();
            Responsable responsableNew = paciente.getResponsable();
            List<Turno> listaTurnosOld = persistentPaciente.getListaTurnos();
            List<Turno> listaTurnosNew = paciente.getListaTurnos();
            if (responsableNew != null) {
                responsableNew = em.getReference(responsableNew.getClass(), responsableNew.getId_responsable());
                paciente.setResponsable(responsableNew);
            }
            List<Turno> attachedListaTurnosNew = new ArrayList<Turno>();
            for (Turno listaTurnosNewTurnoToAttach : listaTurnosNew) {
                listaTurnosNewTurnoToAttach = em.getReference(listaTurnosNewTurnoToAttach.getClass(), listaTurnosNewTurnoToAttach.getId_turno());
                attachedListaTurnosNew.add(listaTurnosNewTurnoToAttach);
            }
            listaTurnosNew = attachedListaTurnosNew;
            paciente.setListaTurnos(listaTurnosNew);
            paciente = em.merge(paciente);
            if (responsableOld != null && !responsableOld.equals(responsableNew)) {
                responsableOld.setPaciente(null);
                responsableOld = em.merge(responsableOld);
            }
            if (responsableNew != null && !responsableNew.equals(responsableOld)) {
                Paciente oldPacienteOfResponsable = responsableNew.getPaciente();
                if (oldPacienteOfResponsable != null) {
                    oldPacienteOfResponsable.setResponsable(null);
                    oldPacienteOfResponsable = em.merge(oldPacienteOfResponsable);
                }
                responsableNew.setPaciente(paciente);
                responsableNew = em.merge(responsableNew);
            }
            for (Turno listaTurnosOldTurno : listaTurnosOld) {
                if (!listaTurnosNew.contains(listaTurnosOldTurno)) {
                    listaTurnosOldTurno.setPaciente(null);
                    listaTurnosOldTurno = em.merge(listaTurnosOldTurno);
                }
            }
            for (Turno listaTurnosNewTurno : listaTurnosNew) {
                if (!listaTurnosOld.contains(listaTurnosNewTurno)) {
                    Paciente oldPacienteOfListaTurnosNewTurno = listaTurnosNewTurno.getPaciente();
                    listaTurnosNewTurno.setPaciente(paciente);
                    listaTurnosNewTurno = em.merge(listaTurnosNewTurno);
                    if (oldPacienteOfListaTurnosNewTurno != null && !oldPacienteOfListaTurnosNewTurno.equals(paciente)) {
                        oldPacienteOfListaTurnosNewTurno.getListaTurnos().remove(listaTurnosNewTurno);
                        oldPacienteOfListaTurnosNewTurno = em.merge(oldPacienteOfListaTurnosNewTurno);
                    }
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = paciente.getId_paciente();
                if (findPaciente(id) == null) {
                    throw new NonexistentEntityException("The paciente with id " + id + " no longer exists.");
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
            Paciente paciente;
            try {
                paciente = em.getReference(Paciente.class, id);
                paciente.getId_paciente();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The paciente with id " + id + " no longer exists.", enfe);
            }
            Responsable responsable = paciente.getResponsable();
            if (responsable != null) {
                responsable.setPaciente(null);
                responsable = em.merge(responsable);
            }
            List<Turno> listaTurnos = paciente.getListaTurnos();
            for (Turno listaTurnosTurno : listaTurnos) {
                listaTurnosTurno.setPaciente(null);
                listaTurnosTurno = em.merge(listaTurnosTurno);
            }
            em.remove(paciente);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Paciente> findPacienteEntities() {
        return findPacienteEntities(true, -1, -1);
    }

    public List<Paciente> findPacienteEntities(int maxResults, int firstResult) {
        return findPacienteEntities(false, maxResults, firstResult);
    }

    private List<Paciente> findPacienteEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Paciente.class));
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

    public Paciente findPaciente(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Paciente.class, id);
        } finally {
            em.close();
        }
    }

    public int getPacienteCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Paciente> rt = cq.from(Paciente.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
