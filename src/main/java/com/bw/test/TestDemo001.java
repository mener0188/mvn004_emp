package com.bw.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.junit4.SpringRunner;

import com.bw.entity.Emp;
import com.bw.mapper.EmpMapper;

/**
 * 一般在项目里不会叫spring。xml
 *
 */
@RunWith(SpringRunner.class)
//@ContextConfiguration("classpath:applicationContext.xml")
@ContextConfiguration("classpath:spring.xml")
public class TestDemo001 {
	
	@Autowired
	EmpMapper empMapper;
	
	@Test
	public void test(){
		List<Emp> list = empMapper.selectEmp("");
		for (Emp emp : list) {
			System.out.println(emp);
		}
	}

}
