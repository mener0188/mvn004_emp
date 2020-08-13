package com.bw.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bw.entity.Emp;
import com.bw.mapper.EmpMapper;

@RestController
public class JsonController2 {
	@Autowired
	EmpMapper empMapper;
	
	@RequestMapping("test")
	public List<Emp> test(String empname){
		System.out.println(empname+"----------------------------");
		
		List<Emp> empList = empMapper.selectEmp(empname);
		return empList;
	}
	
	@RequestMapping("test2")
	public Emp test2(){
		Emp emp = empMapper.selectEmpById(23);
		System.out.println(emp);
		return emp;
	}
	
	
	
//	@RequestMapping("list222")
//	public ModelAndView list222(@RequestParam(defaultValue="1") int pageNum, HttpServletRequest request, String empname){
//		
//		PageHelper.startPage(pageNum, 3);
//		List<Emp> empList = empMapper.selectEmp(empname);
//		request.setAttribute("empList", empList);
//		
//		//����jsp
//		ModelAndView mv =new ModelAndView("list");
//		return mv;
//	}

}
