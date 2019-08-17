# 字典管理

该模块提供了对各种枚举数据进行维护的功能。

![dict](./img/dict.jpg)

后台中常量工厂ConstantFactory封装了的对字典的常规功能。

## 根据名称获取其所有字典列表

使用场景，比如页面查询表单中需要一个联系人关系的下拉框来所搜索，具体用法为：
  
```html
      <#select id="account" name="我方账户" >
            @for(dict in constant.getDicts('学历类型')){
            <option value="${dict.value}" }>${dict.name}</option>
              @}
      </#select>
```
    

## 根据字典id获取字典名称

数据库中存的是字典id，但是页面展示需要具体的值

```java
String degreeName = ConstantFactory.me().findByPnameAndCode("学历类型",1).getName();
model.addAttribute('degreeName',degreeName);
```


