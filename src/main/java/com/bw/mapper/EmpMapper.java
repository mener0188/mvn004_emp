package com.bw.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bw.entity.Depart;
import com.bw.entity.Emp;
import com.bw.entity.Job;

/**
 * 
 * @ClassName: MovieMapper 
 * @Description: mapper�ӿ�
 * @author:��ԲԲ
 * @date: 2019��7��5�� ����2:12:33
 */
public interface EmpMapper {
	
	public List<Emp> selectEmp(@Param("empname")String empname);
	
	public Emp selectEmpById(Integer empid);
	
	public List<Depart> getDepartList();
	
	public List<Job> getJobList();
	
	public int insertEmp(Emp emp);
	
	public int deleteEmp(int empid);
	
	
}
