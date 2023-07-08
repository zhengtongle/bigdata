package cn.edu.nyvc.springbootbackend;

import cn.edu.nyvc.springbootbackend.mapper.EbMapper;
import lombok.AllArgsConstructor;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest

class SpringbootBackendApplicationTests {

	EbMapper  mapper;

	@Test
	void contextLoads() {
		System.out.println(mapper.selectCustomerTypeCount());
	}

}
