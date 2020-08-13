package com.bw.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.portlet.ModelAndView;

import com.bw.entity.Depart;
import com.bw.entity.Emp;
import com.bw.entity.Job;
import com.bw.mapper.EmpMapper;
import com.bw.util.PageUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;


/**
 * 
 * 运行报错,
 * 应运行mvn005_emplist
 * 
 *
 */
@Controller
public class EmpController {
	@Autowired
	EmpMapper empMapper;
	
	@RequestMapping("listAll")
	public String listAll(HttpServletRequest request, String empname){
		
		List<Emp> empList = empMapper.selectEmp(empname);
		System.out.println(empList.size()+"-----------");
		request.setAttribute("empList", empList);
		//����jsp
		return "list";
	}
	
	
	@RequestMapping("list")
	public String list(@RequestParam(defaultValue="1") int pageNum, Model model,
			HttpServletRequest request, String empname){
		if(empname==null || empname.equals("null")){
			empname="";
		}
		
		PageHelper.startPage(pageNum, 3);
		
		List<Emp> empList = empMapper.selectEmp(empname);
		System.out.println(empList.size()+"-----------");
		PageInfo<Emp> page=new PageInfo<Emp>(empList);
		
		
		PageUtils.page(pageNum, page, model, "&empname="+empname);
		
		//��ֵ���浽jspҳ��
		model.addAttribute("empList", empList);
		model.addAttribute("page", page);
		//����jsp
		return "list";
	}
	
	@RequestMapping("toAdd")
	public String toAdd(){
		return "add";
	}
	
	@RequestMapping("getDepartList")
	@ResponseBody
	public List<Depart> getDepartList(){
		List<Depart> departList = empMapper.getDepartList();
		return departList;
	}
	
	@RequestMapping("getJobList")
	@ResponseBody
	public List<Job> getJobList(){
		List<Job> jobList = empMapper.getJobList();
		return jobList;
	}
	
	@RequestMapping("addEmp")
	@ResponseBody
	public String addEmp(Emp emp){
		System.out.println("++++++++++++++++++++++++++++++++");
		System.out.println(emp);
		int i = empMapper.insertEmp(emp);
		System.out.println(i);
		return "success";
	}
	
	@RequestMapping("deleteEmp")
	@ResponseBody
	public String deleteEmp(String empid){
		empMapper.deleteEmp(Integer.parseInt(empid));
		return "success";
	}
	
	@RequestMapping("plsc")
	@ResponseBody
	public String plsc(String[] ids){
		System.out.println(ids+"-----------");
		for (String empid : ids) {
			empMapper.deleteEmp(Integer.parseInt(empid));
		}
		return "success";
	}
	
	
	

}
