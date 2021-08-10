package entity;

import com.fasterxml.jackson.databind.MapperFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.HashMap;
import java.util.Map;

public class HibernateUtil {

    private static EntityManager em = null;
    private static ObjectMapper customMapper = null;

    public static EntityManager getEM() {
        if (em == null) {
            Map<String, Object> configOverrides = new HashMap<String, Object>();
            System.out.println("SYSTEM ENV");
            configOverrides.put("javax.persistence.jdbc.password", System.getenv("SPRING_APP_DB_ECOMMERCE_PASSWD"));
            configOverrides.put("javax.persistence.jdbc.user", System.getenv("SPRING_APP_DB_ECOMMERCE_USR"));

            String dbUrl = "jdbc:mysql://localhost:3306/mmorpg_db?serverTimezone=UTC";
            configOverrides.put("javax.persistence.jdbc.url", dbUrl);
            System.out.println("URL CON");
            System.out.println(dbUrl);

            EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("mmorpgdb", configOverrides);
            em = entityManagerFactory.createEntityManager();
        }
        return em;
    }

    public static ObjectMapper getCustomMapper()
    {
        if (customMapper == null) {
            customMapper = new ObjectMapper();
            customMapper.disable(MapperFeature.DEFAULT_VIEW_INCLUSION);
        }
        return customMapper;
    }
}