package utils;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.Reader;

public class MyBatisUtil {
    private static SqlSessionFactory sessionFactory;

    static {

        try {
            Reader reader = Resources.getResourceAsReader("mybatis-config.xml");

            if (sessionFactory == null) {

                sessionFactory = new SqlSessionFactoryBuilder().build(reader);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    public static SqlSessionFactory getSessionFactory() {
        return sessionFactory;
    }
}
