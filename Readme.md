# SPRING FRAMEWORK

This application is a basic User Management System built using Spring Core without Spring Boot, Spring MVC, and Spring Data JPA. It allows users to perform CRUD operations such as creating, viewing, updating, and deleting users through a web interface.

## Table of Contents
- [Project Structure](#project-structure)
- [Dependency Injection (DI)](#dependency-injection-di)
- [Inversion of Control (IoC)](#inversion-of-control-ioc)
- [Spring Beans](#spring-beans)
- [Bean Scopes](#bean-scopes)
- [ApplicationContext](#applicationcontext)
- [Component Scanning and Stereotype Annotations](#component-scanning-and-stereotype-annotations)
- [Spring Data JPA](#spring-data-jpa)
- [Spring MVC](#spring-mvc)
- [Installation and Setup](#installation-and-setup)

### Project Structure
```
technova/
├── src/
│   └── main/
│       ├── java/
│       │   └── com.technova/
│       │       ├── controller/
│       │       │   └── UserController
│       │       ├── model/
│       │       │   └── User
│       │       ├── repository/
│       │       │   └── UserRepository
│       │       └── service/
│       │           ├── UserService
│       │           └── UserServiceImpl
│       └── webapp/
│           └── WEB-INF/
│               ├── views/
│               ├── applicationContext.xml
│               ├── dispatcher-servlet.xml
│               └── web.xml
```

### Dependency Injection (DI)
In our application, DI is implemented through both XML configuration and annotations:

1. Constructor Injection (XML):
```xml
<bean id="userServiceImpl" class="com.technova.service.UserServiceImpl">
    <constructor-arg ref="userRepository"/>
</bean>

<bean id="userController" class="com.technova.controller.UserController">
    <constructor-arg ref="userServiceImpl"/>
</bean>
```

2. Autowiring (Annotations):
```java
@Service
public class UserServiceImpl implements UserService {
    private final UserRepository userRepository;

    @Autowired
    public UserServiceImpl(UserRepository userRepository) {
        this.userRepository = userRepository;
    }
}
```

### Inversion of Control (IoC)
IoC is implemented through the Spring container, which manages object creation and lifecycle:

1. XML Configuration:
```xml
<!-- applicationContext.xml -->
<context:component-scan base-package="com.technova"/>
<jpa:repositories base-package="com.technova.repository"/>
```

2. Container Management:
- Spring container creates and manages beans
- Dependencies are automatically wired
- Bean lifecycle is managed by the container

### Spring Beans
Our application defines beans through both XML and annotations:

1. XML Bean Definitions:
```xml
<bean id="entityManagerFactory" class="org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean">
    <property name="dataSource" ref="dataSource"/>
    <property name="packagesToScan" value="com.technova.model"/>
    <!-- ... -->
</bean>
```

2. Annotation-based Beans:
```java
@Controller
public class UserController {
    // Bean created through component scanning
}

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    // Repository bean created automatically
}
```

### Bean Scopes
This project utilizes different bean scopes:

1. Singleton (Default):
- UserService
- UserRepository

2. Request Scope:
```java
@Controller
@Scope("request")
public class UserController {
    // New instance per request
}
```

### ApplicationContext
Our application uses XML-based ApplicationContext configuration:

1. Root ApplicationContext (`applicationContext.xml`):
```xml
<!-- Database and JPA Configuration -->
<bean id="dataSource" class="org.springframework.jdbc.datasource.DriverManagerDataSource">
    <property name="driverClassName" value="org.postgresql.Driver"/>
    <!-- ... -->
</bean>
```

2. Servlet ApplicationContext (`dispatcher-servlet.xml`):
```xml
<!-- MVC Configuration -->
<mvc:annotation-driven/>
<context:component-scan base-package="com.technova"/>
```

### Component Scanning and Stereotype Annotations
The application uses Spring's stereotype annotations:

1. Component Scanning Configuration:
```xml
<context:component-scan base-package="com.technova"/>
```

2. Stereotype Annotations:
```java
@Controller // Web Controllers
@Service    // Business Services
@Repository // Data Access
@Component  // General Components
```

### Spring Data JPA
JPA configuration and usage:

1. Configuration:
```xml
<bean id="entityManagerFactory" class="org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean">
    <property name="jpaProperties">
        <props>
            <prop key="hibernate.dialect">org.hibernate.dialect.PostgreSQLDialect</prop>
            <prop key="hibernate.hbm2ddl.auto">update</prop>
        </props>
    </property>
</bean>
```

2. Repository Interface:
```java
@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    // Spring Data JPA provides implementation automatically
}
```

### Spring MVC
MVC implementation details:

1. Configuration:
```xml
<!-- dispatcher-servlet.xml -->
<mvc:annotation-driven/>
<bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
    <property name="prefix" value="/WEB-INF/views/"/>
    <property name="suffix" value=".jsp"/>
</bean>
```

2. Controller Example:
```java
@Controller
@RequestMapping("/users")
public class UserController {
    @GetMapping
    public String listUsers(Model model) {
        // Handler method implementation
    }
}
```

### Installation and Setup
1. Prerequisites:
    - JDK 17
    - Maven 3.x
    - PostgreSQL Database
    - Jakarta EE compatible server

2. Database Setup:
```sql
CREATE DATABASE dev_tech_nova;
```

3. Configuration:
    - Update database credentials in `applicationContext.xml`
    - Configure server deployment settings

4. Build and Deploy:
```bash
mvn clean install
# Deploy technova.war to your server
```

5. Access Application:
```
http://localhost:8080/technova
```

Each section focuses on specific Spring Framework concepts as implemented in this project,
providing both theoretical understanding and practical examples from the actual codebase.