#### 授权

##### 授权方式

- 编程式
- 注解方式
- JSP/GSP 标签

```text
如果您想要配置一个全局的PermissionResolver，
那么接收所配置的PermissionResolver的每个域必须实现PermisionResolverAware接口。
这保证了被配置的实例可以被转发到支持这种配置的每个域。
```