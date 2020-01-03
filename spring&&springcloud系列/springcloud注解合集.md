** 初始化** 
- @PostConstruct

** 配置**
- @Configuration
- @EnableAutoConfiguration

- @ControllerAdvice与@RestControllerAdvice
-  @InitBinder 和 @ModelAttribute 
   - [springboot 详解RestControllerAdvice(ControllerAdvice)](https://blog.csdn.net/qq_35098526/article/details/88949425)
   - [Spring @ControllerAdvice与@RestControllerAdvice注解](https://blog.csdn.net/fang_qiming/article/details/79907979)  
- @Qualifier
- @ConditionalOnProperty(
      name = {"seimi.crawler.enabled"}
  )
- @EnableConfigurationProperties({CrawlerProperties.class})
- @Import
- @ImportResource({"classpath*:**/seimi*.xml"})
- @EnableScheduling
**组件类**

- @Component
- @Service
- @Bean
- @Repository
- @RestController
- @Controller

