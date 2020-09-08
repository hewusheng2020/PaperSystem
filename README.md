idea搭建ssm框架(spring+springmvc+mybatis)

版权声明：本文为博主原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接和本声明。 
本文链接：https://blog.csdn.net/h_j_c_123/article/details/96999464
版权 
idea搭建ssm框架(spring+springmvc+mybatis)：
先创建一个maven工程：
 
next
 
next
 
next
 
到这里项目创建完成。
下面我们来创建文件夹：
在main下new 一个directory名为java和resourses
选择java点击右键
 
选择resourses单击右键
 
创建具体的包，在java下：
 
包建好之后就来集成spring的一些基础的包
1.	<!--spring相关-->
2.	<!-- https://mvnrepository.com/artifact/org.springframework/spring-context -->
3.	<dependency>
4.	    <groupId>org.springframework</groupId>
5.	    <artifactId>spring-context</artifactId>
6.	    <version>4.3.18.RELEASE</version>
7.	</dependency>
8.	 
9.	<!-- https://mvnrepository.com/artifact/org.springframework/spring-core -->
10.	<dependency>
11.	    <groupId>org.springframework</groupId>
12.	    <artifactId>spring-core</artifactId>
13.	    <version>4.3.18.RELEASE</version>
14.	</dependency>
15.	 
16.	<!-- https://mvnrepository.com/artifact/org.springframework/spring-beans -->
17.	<dependency>
18.	    <groupId>org.springframework</groupId>
19.	    <artifactId>spring-beans</artifactId>
20.	    <version>4.3.18.RELEASE</version>
21.	</dependency>
22.	 
23.	<!-- https://mvnrepository.com/artifact/org.springframework/spring-web -->
24.	<dependency>
25.	    <groupId>org.springframework</groupId>
26.	    <artifactId>spring-web</artifactId>
27.	    <version>4.3.18.RELEASE</version>
28.	</dependency>
29.	 
30.	<!-- https://mvnrepository.com/artifact/org.springframework/spring-webmvc -->
31.	<dependency>
32.	    <groupId>org.springframework</groupId>
33.	    <artifactId>spring-webmvc</artifactId>
34.	    <version>4.3.18.RELEASE</version>
35.	</dependency>
然后需要用到数据库就需要有mysql和mybatis的jar包：
1.	<!--mybatis-->
2.	<!-- https://mvnrepository.com/artifact/org.mybatis/mybatis -->
3.	<dependency>
4.	    <groupId>org.mybatis</groupId>
5.	    <artifactId>mybatis</artifactId>
6.	    <version>3.4.6</version>
7.	</dependency>
8.	 
9.	<!-- https://mvnrepository.com/artifact/mysql/mysql-connector-java -->
10.	<dependency>
11.	<groupId>mysql</groupId>
12.	<artifactId>mysql-connector-java</artifactId>
13.	<version>5.1.38</version>
14.	</dependency>
 
1.	<!--数据库事务管理-->
2.	<!-- https://mvnrepository.com/artifact/org.springframework/spring-jdbc -->
3.	<dependency>
4.	    <groupId>org.springframework</groupId>
5.	    <artifactId>spring-jdbc</artifactId>
6.	    <version>4.3.18.RELEASE</version>
7.	</dependency>
8.	 
9.	<!-- https://mvnrepository.com/artifact/org.springframework/spring-tx -->
10.	<dependency>
11.	    <groupId>org.springframework</groupId>
12.	    <artifactId>spring-tx</artifactId>
13.	    <version>4.3.18.RELEASE</version>
14.	</dependency>
mybatis需要和spring整合，所以我们需要一个整合的包
1.	<!-- https://mvnrepository.com/artifact/org.mybatis/mybatis-spring -->
2.	<dependency>
3.	    <groupId>org.mybatis</groupId>
4.	    <artifactId>mybatis-spring</artifactId>
5.	    <version>1.3.2</version>
6.	</dependency>
然后这里我们采用的是传统的jsp视图，然后我们在家几个包：
1.	<!--jsp-->
2.	<!-- https://mvnrepository.com/artifact/javax.servlet/jstl -->
3.	<dependency>
4.	    <groupId>javax.servlet</groupId>
5.	    <artifactId>jstl</artifactId>
6.	    <version>1.2</version>
7.	</dependency>
8.	 
9.	<!-- https://mvnrepository.com/artifact/javax.servlet/javax.servlet-api -->
10.	<dependency>
11.	    <groupId>javax.servlet</groupId>
12.	    <artifactId>javax.servlet-api</artifactId>
13.	    <version>3.1.0</version>
14.	    <scope>provided</scope>
15.	</dependency>
在使用数据库中我们会使用数据库连接池再加一个包：
1.	<!-- 导入dbcp的jar包，用来在applicationContext.xml中配置数据库 -->
2.	<!-- https://mvnrepository.com/artifact/org.apache.commons/commons-dbcp2 -->
3.	<!-- https://mvnrepository.com/artifact/commons-dbcp/commons-dbcp -->
4.	<dependency>
5.	    <groupId>commons-dbcp</groupId>
6.	    <artifactId>commons-dbcp</artifactId>
7.	    <version>1.4</version>
8.	</dependency>
因为需要解析json数据我们需要阿里巴巴的json包
1.	<!-- https://mvnrepository.com/artifact/com.alibaba/fastjson -->
2.	<dependency>
3.	    <groupId>com.alibaba</groupId>
4.	    <artifactId>fastjson</artifactId>
5.	    <version>1.2.47</version>
6.	</dependency>
到这里我们基本的包已经引进完毕了，然后我们来写springmvc的配置在resources下新建一个包叫spring，然后新建springmvc的配置文件，叫spring-mvc.xml
 
 
内容如下：
1.	<?xml version="1.0" encoding="UTF-8"?>
2.	<beans xmlns="http://www.springframework.org/schema/beans"
3.	       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
4.	       xmlns:aop="http://www.springframework.org/schema/aop"
5.	       xmlns:c="http://www.springframework.org/schema/c"
6.	       xmlns:cache="http://www.springframework.org/schema/cache"
7.	       xmlns:context="http://www.springframework.org/schema/context"
8.	       xmlns:jee="http://www.springframework.org/schema/jee"
9.	       xmlns:lang="http://www.springframework.org/schema/lang"
10.	       xmlns:mvc="http://www.springframework.org/schema/mvc"
11.	       xmlns:p="http://www.springframework.org/schema/p"
12.	       xmlns:task="http://www.springframework.org/schema/task"
13.	       xmlns:util="http://www.springframework.org/schema/util"
14.	       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd
15.	      http://www.springframework.org/schema/aop http://www.springframework.org/schema/aop/spring-aop-4.3.xsd
16.	      http://www.springframework.org/schema/cache http://www.springframework.org/schema/cache/spring-cache-4.3.xsd
17.	      http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context-4.3.xsd
18.	      http://www.springframework.org/schema/jee http://www.springframework.org/schema/jee/spring-jee-4.3.xsd
19.	      http://www.springframework.org/schema/lang http://www.springframework.org/schema/lang/spring-lang-4.3.xsd
20.	      http://www.springframework.org/schema/mvc http://www.springframework.org/schema/mvc/spring-mvc-4.3.xsd
21.	      http://www.springframework.org/schema/task http://www.springframework.org/schema/task/spring-task-4.3.xsd
22.	      http://www.springframework.org/schema/util http://www.springframework.org/schema/util/spring-util-4.3.xsd">
23.	 
24.	    <!--使用注解驱动-->
25.	    <mvc:annotation-driven/>
26.	 
27.	    <!--配置视图解析器-->
28.	    <bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
29.	        <!--重定向时,是否加上上下文路径-->
30.	        <property name="redirectContextRelative" value="true"/>
31.	        <!--配置解析前后缀-->
32.	        <property name="prefix" value="/WEB-INF/views/"/>
33.	        <property name="suffix" value=".jsp"/>
34.	    </bean>
35.	 
36.	    <!--扫描所有handler(控制器)-->
37.	    <context:component-scan base-package="com.hjc.handler"/>
38.	</beans>
 
在web-inf目录下创建view文件夹 
在下面创建一个login.jsp
 
 
然后需要在新建一个spring-maybis整合的配置文件spring-maybis.xml，还在spring目录下
 
文件内容如下：
1.	<?xml version="1.0" encoding="UTF-8"?>
2.	<beans xmlns="http://www.springframework.org/schema/beans"
3.	       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:p="http://www.springframework.org/schema/p"
4.	       xmlns:context="http://www.springframework.org/schema/context"
5.	       xmlns:mvc="http://www.springframework.org/schema/mvc"
6.	       xsi:schemaLocation="http://www.springframework.org/schema/beans
7.	                        http://www.springframework.org/schema/beans/spring-beans-4.0.xsd
8.	                        http://www.springframework.org/schema/context
9.	                        http://www.springframework.org/schema/context/spring-context-4.0.xsd
10.	                        http://www.springframework.org/schema/mvc
11.	                        http://www.springframework.org/schema/mvc/spring-mvc-4.0.xsd">
12.	 
13.	    <!--自动扫描-->
14.	    <context:component-scan base-package="com.vrv"/>
15.	 
16.	    <!--引入properties文件-->
17.	    <bean id="placeholderConfigurer" class="org.springframework.beans.factory.config.PropertyPlaceholderConfigurer">
18.	        <property name="location" value="classpath:jdbc.properties"></property>
19.	    </bean>
20.	 
21.	    <!--配置数据源-->
22.	    <bean id="dataSource" class="org.apache.commons.dbcp.BasicDataSource">
23.	        <!--数据库连接池-->
24.	        <property name="driverClassName" value="${driver}"/>
25.	        <property name="url" value="${url}"/>
26.	        <property name="username" value="${username}"/>
27.	        <property name="password" value="${password}"/>
28.	        <!-- 初始化连接大小 -->
29.	        <property name="initialSize" value="${initialSize}"></property>
30.	        <!-- 连接池最大数量 -->
31.	        <property name="maxActive" value="${maxActive}"></property>
32.	        <!-- 连接池最大空闲 -->
33.	        <property name="maxIdle" value="${maxIdle}"></property>
34.	        <!-- 连接池最小空闲 -->
35.	        <property name="minIdle" value="${minIdle}"></property>
36.	        <!-- 获取连接最大等待时间 -->
37.	        <property name="maxWait" value="${maxWait}"></property>
38.	    </bean>
39.	 
40.	    <!--配置sqlsession工厂-->
41.	    <!-- spring和MyBatis完美整合，不需要mybatis的配置映射文件 -->
42.	    <bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
43.	        <property name="dataSource" ref="dataSource"/>
44.	        <!-- 自动扫描mapping.xml文件 -->
45.	        <property name="mapperLocations" value="classpath:mapper/*.xml"/>
46.	    </bean>
47.	 
48.	    <!--配置DAO所在spring会自动查找下面的类-->
49.	    <bean class="org.mybatis.spring.mapper.MapperScannerConfigurer">
50.	        <property name="basePackage" value="com.vrv.dao"/>
51.	        <property name="sqlSessionFactoryBeanName" value="sqlSessionFactory"/>
52.	    </bean>
53.	 
54.	    <!-- (事务管理)transaction manager, use JtaTransactionManager for global tx -->
55.	    <bean id="transactionManager"
56.	          class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
57.	        <property name="dataSource" ref="dataSource"/>
58.	    </bean>
59.	 
60.	 
61.	    <!-- 注解方式配置事物 -->
62.	    <!-- <tx:annotation-driven transaction-manager="transactionManager" /> -->
63.	 
64.	    <!-- 拦截器方式配置事物
65.	    spring有很多事物管理，其中很多都是被淘汰的了，企业一直在用，最好配置方法如下，配置事务之后，用切面直接切入所有servic层
66.	    -->
67.	    <!--<tx:advice id="transactionAdvice" transaction-manager="transactionManager">-->
68.	    <!--<tx:attributes>-->
69.	    <!--<tx:method name="add*" propagation="REQUIRED" />-->
70.	    <!--<tx:method name="append*" propagation="REQUIRED" />-->
71.	    <!--<tx:method name="insert*" propagation="REQUIRED" />-->
72.	    <!--<tx:method name="save*" propagation="REQUIRED" />-->
73.	    <!--<tx:method name="update*" propagation="REQUIRED" />-->
74.	    <!--<tx:method name="modify*" propagation="REQUIRED" />-->
75.	    <!--<tx:method name="edit*" propagation="REQUIRED" />-->
76.	    <!--<tx:method name="delete*" propagation="REQUIRED" />-->
77.	    <!--<tx:method name="remove*" propagation="REQUIRED" />-->
78.	    <!--<tx:method name="repair" propagation="REQUIRED" />-->
79.	    <!--<tx:method name="delAndRepair" propagation="REQUIRED" />-->
80.	 
81.	    <!--<tx:method name="get*" propagation="SUPPORTS" />-->
82.	    <!--<tx:method name="find*" propagation="SUPPORTS" />-->
83.	    <!--<tx:method name="load*" propagation="SUPPORTS" />-->
84.	    <!--<tx:method name="search*" propagation="SUPPORTS" />-->
85.	    <!--<tx:method name="datagrid*" propagation="SUPPORTS" />-->
86.	 
87.	    <!--<tx:method name="*" propagation="SUPPORTS" />-->
88.	    <!--</tx:attributes>-->
89.	    <!--</tx:advice>-->
90.	    <!--<aop:config>-->
91.	    <!--<aop:pointcut id="transactionPointcut" expression="execution(* com.jsx.service..*Impl.*(..))" />-->
92.	    <!--<aop:advisor pointcut-ref="transactionPointcut" advice-ref="transactionAdvice" />-->
93.	    <!--</aop:config>-->
94.	</beans>
为了更加容易的更换数据库配置我们新建一个jdbc.properties文件，在resources目录下，里面填写数据库配置：
1.	driver=com.mysql.jdbc.Driver
2.	#driver=com.mysql.cj.jdbc.Driver
3.	#mytest为我本地的数据库名
4.	url=jdbc:mysql://localhost:3306/teaching_manage
5.	#url=jdbc:mysql://192.168.220.139:3306/teaching_manage
6.	username=root
7.	#下面输入自己数据库的密码
8.	password=123456
9.	#定义初始连接数
10.	initialSize=1
11.	#定义最大连接数
12.	maxActive=20
13.	#定义最大空闲
14.	maxIdle=20
15.	#定义最小空闲
16.	minIdle=1
17.	#定义最长等待时间
18.	maxWait=60000
因为mybatis是半自动化的orm(以对象的方式操作数据库)，所以我们需要自己写mybatis的映射文件，现在在resourses目录下新建一个mapper文件夹:
mybatis扫描这个目录下的所有文件
 
 
最后我们需要在web.xml文件里面加载这两个配置文件，同时配置字符集监听，和前端控制器
内容如下：
1.	<!DOCTYPE web-app PUBLIC
2.	        "-//Sun Microsystems, Inc.//DTD Web Application 2.3//EN"
3.	        "http://java.sun.com/dtd/web-app_2_3.dtd" >
4.	<web-app
5.	        xmlns="http://java.sun.com/xml/ns/javaee"
6.	        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
7.	        xsi:schemaLocation="http://java.sun.com/xml/ns/javaee http://java.sun.com/xml/ns/javaee/web-app_3_0.xsd"
8.	        version="3.0"
9.	        metadata-complete="true">
10.	  <display-name>Archetype Created Web Application</display-name>
11.	 
12.	 
13.	  <!--请求和应答字符编码过滤器-->
14.	  <filter>
15.	    <filter-name>encoding-filter</filter-name>
16.	    <filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
17.	    <init-param>
18.	      <param-name>encoding</param-name>
19.	      <param-value>UTF-8</param-value>
20.	    </init-param>
21.	  </filter>
22.	 
23.	  <filter-mapping>
24.	    <filter-name>encoding-filter</filter-name>
25.	    <!--<url-pattern>/*</url-pattern>-->
26.	    <servlet-name>springDispatcherServlet</servlet-name>
27.	  </filter-mapping>
28.	 
29.	  <!--启动spring容器-->
30.	  <listener>
31.	    <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
32.	  </listener>
33.	  <context-param>
34.	    <param-name>contextConfigLocation</param-name>
35.	    <param-value>classpath:spring/spring-mybatis.xml</param-value>
36.	  </context-param>
37.	 
38.	  
39.	  <!-- 用前端控制器初始化springmvc容器 -->
40.	  <!-- The front controller of this Spring Web application, responsible for 
41.	      handling all application requests -->
42.	  <servlet>
43.	    <servlet-name>springDispatcherServlet</servlet-name>
44.	    <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
45.	    <init-param>
46.	      <param-name>contextConfigLocation</param-name>
47.	      <param-value>classpath:spring/spring-mvc.xml</param-value>
48.	    </init-param>
49.	    <load-on-startup>1</load-on-startup>
50.	  </servlet>
51.	 
52.	  <!-- Map all requests to the DispatcherServlet for handling -->
53.	  <servlet-mapping>
54.	    <servlet-name>springDispatcherServlet</servlet-name>
55.	    <url-pattern>*.do</url-pattern>
56.	  </servlet-mapping>
57.	 
58.	  <!--<welcome-file-list>-->
59.	  <!--<welcome-file>/WEB-INF/views/admin/homepage/admin_homePage.jsp</welcome-file>-->
60.	  <!--</welcome-file-list>-->
61.	</web-app>
下面对基本的包概念进行说明：
字符集监听器：org.springframework.web.filter.CharacterEncodingFilter
主要用来限制整个工程的字符集的。
前端控制器：org.springframework.web.servlet.DispatcherServlet
是spring用来接收用户请求的同时分配用户请求给控制器(controller)来控制请求处理
 
 
到这里我们的环境集成算是完成了，下一篇我们来写一个用ssm框架来实现的简单的登陆的例子
一个完整的ssm的系统（个人健康管理系统）：
https://blog.csdn.net/h_j_c_123/article/details/105984527

