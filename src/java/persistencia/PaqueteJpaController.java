package persistencia;

import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import logica.Servicio;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import logica.Paquete;
import persistencia.exceptions.NonexistentEntityException;

public class PaqueteJpaController implements Serializable {

    public PaqueteJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    
    public PaqueteJpaController() {
        emf = Persistence.createEntityManagerFactory("TPFinalCom2PU");
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Paquete paquete) {
        if (paquete.getLista_servicios() == null) {
            paquete.setLista_servicios(new ArrayList<Servicio>());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            List<Servicio> attachedLista_servicios = new ArrayList<Servicio>();
            for (Servicio lista_serviciosServicioToAttach : paquete.getLista_servicios()) {
                lista_serviciosServicioToAttach = em.getReference(lista_serviciosServicioToAttach.getClass(), lista_serviciosServicioToAttach.getCodigo_servicio());
                attachedLista_servicios.add(lista_serviciosServicioToAttach);
            }
            paquete.setLista_servicios(attachedLista_servicios);
            em.persist(paquete);
            for (Servicio lista_serviciosServicio : paquete.getLista_servicios()) {
                lista_serviciosServicio.getLista_paquetes().add(paquete);
                lista_serviciosServicio = em.merge(lista_serviciosServicio);
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Paquete paquete) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Paquete persistentPaquete = em.find(Paquete.class, paquete.getCodigo_paquete());
            List<Servicio> lista_serviciosOld = persistentPaquete.getLista_servicios();
            List<Servicio> lista_serviciosNew = paquete.getLista_servicios();
            List<Servicio> attachedLista_serviciosNew = new ArrayList<Servicio>();
            for (Servicio lista_serviciosNewServicioToAttach : lista_serviciosNew) {
                lista_serviciosNewServicioToAttach = em.getReference(lista_serviciosNewServicioToAttach.getClass(), lista_serviciosNewServicioToAttach.getCodigo_servicio());
                attachedLista_serviciosNew.add(lista_serviciosNewServicioToAttach);
            }
            lista_serviciosNew = attachedLista_serviciosNew;
            paquete.setLista_servicios(lista_serviciosNew);
            paquete = em.merge(paquete);
            for (Servicio lista_serviciosOldServicio : lista_serviciosOld) {
                if (!lista_serviciosNew.contains(lista_serviciosOldServicio)) {
                    lista_serviciosOldServicio.getLista_paquetes().remove(paquete);
                    lista_serviciosOldServicio = em.merge(lista_serviciosOldServicio);
                }
            }
            for (Servicio lista_serviciosNewServicio : lista_serviciosNew) {
                if (!lista_serviciosOld.contains(lista_serviciosNewServicio)) {
                    lista_serviciosNewServicio.getLista_paquetes().add(paquete);
                    lista_serviciosNewServicio = em.merge(lista_serviciosNewServicio);
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = paquete.getCodigo_paquete();
                if (findPaquete(id) == null) {
                    throw new NonexistentEntityException("The paquete with id " + id + " no longer exists.");
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
            Paquete paquete;
            try {
                paquete = em.getReference(Paquete.class, id);
                paquete.getCodigo_paquete();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The paquete with id " + id + " no longer exists.", enfe);
            }
            List<Servicio> lista_servicios = paquete.getLista_servicios();
            for (Servicio lista_serviciosServicio : lista_servicios) {
                lista_serviciosServicio.getLista_paquetes().remove(paquete);
                lista_serviciosServicio = em.merge(lista_serviciosServicio);
            }
            em.remove(paquete);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Paquete> findPaqueteEntities() {
        return findPaqueteEntities(true, -1, -1);
    }

    public List<Paquete> findPaqueteEntities(int maxResults, int firstResult) {
        return findPaqueteEntities(false, maxResults, firstResult);
    }

    private List<Paquete> findPaqueteEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Paquete.class));
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

    public Paquete findPaquete(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Paquete.class, id);
        } finally {
            em.close();
        }
    }

    public int getPaqueteCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Paquete> rt = cq.from(Paquete.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
