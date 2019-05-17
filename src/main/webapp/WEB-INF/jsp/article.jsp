<beans xsi:schemaLocation="http://www.springframework.org/schema/beans 
        http://www.springframework.org/schema/beans/spring-beans.xsd    
             http://www.springframework.org/schema/context      
                http://www.springframework.org/schema/context/spring-context.xsd">
          <context:component-scan base-package="com.hosick"/>
          <context:property-placeholder location="classpath:db.properties"/>
          <bean id="dataSource" class="org.mariadb.jdbc.MariaDbDataSource">
          <property name="url" value="${db.url}"/></bean>
          <bean id="jdbcTemplate" class="org.springframework.jdbc.core.JdbcTemplate">
          <property name="dataSource" ref="dataSource"/></bean>
</beans>