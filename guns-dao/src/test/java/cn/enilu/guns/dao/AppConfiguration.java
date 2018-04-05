package cn.enilu.guns.dao;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;


@SpringBootApplication
@EntityScan(basePackages="cn.enilu.guns.bean.entity")
@EnableJpaRepositories(basePackages= "cn.enilu.guns.dao.system")
public class AppConfiguration {
}

