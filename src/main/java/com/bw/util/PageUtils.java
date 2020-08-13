package com.bw.util;

import org.springframework.ui.Model;

import com.github.pagehelper.PageInfo;

public class PageUtils {
	
	public static void page(int pageNum, PageInfo info, Model model, String url) {
		//�����ǰҳ<=1  ��һҳ����1
		if (pageNum<=1) {
			info.setPrePage(1);
		}
		
		//�����ǰҳ>=���һҳ   βҳ=��ҳ��
		if (pageNum>=info.getPages()) {
			info.setNextPage(info.getPages());
		}
		
		String fenye = "��ǰ��" + pageNum + "/" + info.getPages() + "ҳ--��" + 
						info.getTotal() + "������&nbsp;&nbsp; <a href='list?pageNum=1"+url+"'>��ҳ</a> "
						+ "<a href='list?pageNum="+info.getPrePage()+""+url+"'>��һҳ</a> "
						+ "<a href='list?pageNum="+info.getNextPage()+""+url+"'>��һҳ</a> "
						+ "<a href='list?pageNum="+info.getPages()+""+url+"'>βҳ</a> ";
				
		model.addAttribute("fenye", fenye);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
