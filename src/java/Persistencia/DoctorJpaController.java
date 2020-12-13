
package Persistencia;

import Logica.Doctor;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import Logica.HorarioAtencion;
import java.util.ArrayList;
import java.util.List;
import Logica.Turno;
import Persistencia.exceptions.NonexistentEntityException;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;


public class DoctorJpaController implements Serializable {

    public DoctorJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;
    
    public DoctorJpaController(){
        emf = Persistence.createEntityManagerFactory("ClinicaOdontoPU");
    }
    
    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Doctor doctor) {
        if (doctor.getListaHorarios() == null) {
            doctor.setListaHorarios(new ArrayList<HorarioAtencion>());
        }
        if (doctor.getListaTurnos() == null) {
            doctor.setListaTurnos(new ArrayList<Turno>());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            List<HorarioAtencion> attachedListaHorarios = new ArrayList<HorarioAtencion>();
            for (HorarioAtencion listaHorariosHorarioAtencionToAttach : doctor.getListaHorarios()) {
                listaHorariosHorarioAtencionToAttach = em.getReference(listaHorariosHorarioAtencionToAttach.getClass(), listaHorariosHorarioAtencionToAttach.getId_horario());
                attachedListaHorarios.add(listaHorariosHorarioAtencionToAttach);
            }
            doctor.setListaHorarios(attachedListaHorarios);
            List<Turno> attachedListaTurnos = new ArrayList<Turno>();
            for (Turno listaTurnosTurnoToAttach : doctor.getListaTurnos()) {
                listaTurnosTurnoToAttach = em.getReference(listaTurnosTurnoToAttach.getClass(), listaTurnosTurnoToAttach.getId_turno());
                attachedListaTurnos.add(listaTurnosTurnoToAttach);
            }
            doctor.setListaTurnos(attachedListaTurnos);
            em.persist(doctor);
            for (HorarioAtencion listaHorariosHorarioAtencion : doctor.getListaHorarios()) {
                Doctor oldDoctorOfListaHorariosHorarioAtencion = listaHorariosHorarioAtencion.getDoctor();
                listaHorariosHorarioAtencion.setDoctor(doctor);
                listaHorariosHorarioAtencion = em.merge(listaHorariosHorarioAtencion);
                if (oldDoctorOfListaHorariosHorarioAtencion != null) {
                    oldDoctorOfListaHorariosHorarioAtencion.getListaHorarios().remove(listaHorariosHorarioAtencion);
                    oldDoctorOfListaHorariosHorarioAtencion = em.merge(oldDoctorOfListaHorariosHorarioAtencion);
                }
            }
            for (Turno listaTurnosTurno : doctor.getListaTurnos()) {
                Doctor oldDoctorOfListaTurnosTurno = listaTurnosTurno.getDoctor();
                listaTurnosTurno.setDoctor(doctor);
                listaTurnosTurno = em.merge(listaTurnosTurno);
                if (oldDoctorOfListaTurnosTurno != null) {
                    oldDoctorOfListaTurnosTurno.getListaTurnos().remove(listaTurnosTurno);
                    oldDoctorOfListaTurnosTurno = em.merge(oldDoctorOfListaTurnosTurno);
                }
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Doctor doctor) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Doctor persistentDoctor = em.find(Doctor.class, doctor.getId_doctor());
            List<HorarioAtencion> listaHorariosOld = persistentDoctor.getListaHorarios();
            List<HorarioAtencion> listaHorariosNew = doctor.getListaHorarios();
            List<Turno> listaTurnosOld = persistentDoctor.getListaTurnos();
            List<Turno> listaTurnosNew = doctor.getListaTurnos();
            List<HorarioAtencion> attachedListaHorariosNew = new ArrayList<HorarioAtencion>();
            for (HorarioAtencion listaHorariosNewHorarioAtencionToAttach : listaHorariosNew) {
                listaHorariosNewHorarioAtencionToAttach = em.getReference(listaHorariosNewHorarioAtencionToAttach.getClass(), listaHorariosNewHorarioAtencionToAttach.getId_horario());
                attachedListaHorariosNew.add(listaHorariosNewHorarioAtencionToAttach);
            }
            listaHorariosNew = attachedListaHorariosNew;
            doctor.setListaHorarios(listaHorariosNew);
            List<Turno> attachedListaTurnosNew = new ArrayList<Turno>();
            for (Turno listaTurnosNewTurnoToAttach : listaTurnosNew) {
                listaTurnosNewTurnoToAttach = em.getReference(listaTurnosNewTurnoToAttach.getClass(), listaTurnosNewTurnoToAttach.getId_turno());
                attachedListaTurnosNew.add(listaTurnosNewTurnoToAttach);
            }
            listaTurnosNew = attachedListaTurnosNew;
            doctor.setListaTurnos(listaTurnosNew);
            doctor = em.merge(doctor);
            for (HorarioAtencion listaHorariosOldHorarioAtencion : listaHorariosOld) {
                if (!listaHorariosNew.contains(listaHorariosOldHorarioAtencion)) {
                    listaHorariosOldHorarioAtencion.setDoctor(null);
                    listaHorariosOldHorarioAtencion = em.merge(listaHorariosOldHorarioAtencion);
                }
            }
            for (HorarioAtencion listaHorariosNewHorarioAtencion : listaHorariosNew) {
                if (!listaHorariosOld.contains(listaHorariosNewHorarioAtencion)) {
                    Doctor oldDoctorOfListaHorariosNewHorarioAtencion = listaHorariosNewHorarioAtencion.getDoctor();
                    listaHorariosNewHorarioAtencion.setDoctor(doctor);
                    listaHorariosNewHorarioAtencion = em.merge(listaHorariosNewHorarioAtencion);
                    if (oldDoctorOfListaHorariosNewHorarioAtencion != null && !oldDoctorOfListaHorariosNewHorarioAtencion.equals(doctor)) {
                        oldDoctorOfListaHorariosNewHorarioAtencion.getListaHorarios().remove(listaHorariosNewHorarioAtencion);
                        oldDoctorOfListaHorariosNewHorarioAtencion = em.merge(oldDoctorOfListaHorariosNewHorarioAtencion);
                    }
                }
            }
            for (Turno listaTurnosOldTurno : listaTurnosOld) {
                if (!listaTurnosNew.contains(listaTurnosOldTurno)) {
                    listaTurnosOldTurno.setDoctor(null);
                    listaTurnosOldTurno = em.merge(listaTurnosOldTurno);
                }
            }
            for (Turno listaTurnosNewTurno : listaTurnosNew) {
                if (!listaTurnosOld.contains(listaTurnosNewTurno)) {
                    Doctor oldDoctorOfListaTurnosNewTurno = listaTurnosNewTurno.getDoctor();
                    listaTurnosNewTurno.setDoctor(doctor);
                    listaTurnosNewTurno = em.merge(listaTurnosNewTurno);
                    if (oldDoctorOfListaTurnosNewTurno != null && !oldDoctorOfListaTurnosNewTurno.equals(doctor)) {
                        oldDoctorOfListaTurnosNewTurno.getListaTurnos().remove(listaTurnosNewTurno);
                        oldDoctorOfListaTurnosNewTurno = em.merge(oldDoctorOfListaTurnosNewTurno);
                    }
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = doctor.getId_doctor();
                if (findDoctor(id) == null) {
                    throw new NonexistentEntityException("The doctor with id " + id + " no longer exists.");
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
            Doctor doctor;
            try {
                doctor = em.getReference(Doctor.class, id);
                doctor.getId_doctor();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The doctor with id " + id + " no longer exists.", enfe);
            }
            List<HorarioAtencion> listaHorarios = doctor.getListaHorarios();
            for (HorarioAtencion listaHorariosHorarioAtencion : listaHorarios) {
                listaHorariosHorarioAtencion.setDoctor(null);
                listaHorariosHorarioAtencion = em.merge(listaHorariosHorarioAtencion);
            }
            List<Turno> listaTurnos = doctor.getListaTurnos();
            for (Turno listaTurnosTurno : listaTurnos) {
                listaTurnosTurno.setDoctor(null);
                listaTurnosTurno = em.merge(listaTurnosTurno);
            }
            em.remove(doctor);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Doctor> findDoctorEntities() {
        return findDoctorEntities(true, -1, -1);
    }

    public List<Doctor> findDoctorEntities(int maxResults, int firstResult) {
        return findDoctorEntities(false, maxResults, firstResult);
    }

    private List<Doctor> findDoctorEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Doctor.class));
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

    public Doctor findDoctor(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Doctor.class, id);
        } finally {
            em.close();
        }
    }

    public int getDoctorCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Doctor> rt = cq.from(Doctor.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
