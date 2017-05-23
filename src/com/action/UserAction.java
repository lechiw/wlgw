package com.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.dao.TUserDAO;
import com.model.TUser;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Cart;

public class UserAction extends ActionSupport
{
	private Integer userId;
	private String userName;  //�û���
	private String userPw;

	private String userRealname;
	private String userSex;
	private String userAddress;
	private String userTel;	
	
	private String message;
	private String path;
	
	private TUserDAO userDAO;
	
	
	
	public String userReg()     //�û�ע��
	{
		TUser user=new TUser();
		
		user.setUserName(userName);
		user.setUserPw(userPw);
		
		user.setUserRealname(userRealname);
		user.setUserSex(userSex);
		user.setUserAddress(userAddress);
		user.setUserTel(userTel);
		
		user.setUserDel("no");
		
		userDAO.save(user);
		
		
		HttpServletRequest request=ServletActionContext.getRequest();
		request.setAttribute("msg", "ע��ɹ�,���¼");
		return "msg";
	}
	public String userEdit()
	{
		TUser user=userDAO.findById(userId);
		
		user.setUserName(userName);
		user.setUserPw(userPw);
		
		user.setUserRealname(userRealname);
		user.setUserSex(userSex);
		user.setUserAddress(userAddress);
		user.setUserTel(userTel);
		
		user.setUserDel("no");
		
		userDAO.attachDirty(user);

		HttpServletRequest request=ServletActionContext.getRequest();
		request.setAttribute("msg", "�޸ĳɹ�,���µ�¼����Ч");
		return "msg";
	}
	
	
	public String userLogin()
	{
		String sql="from TUser where userName=? and userPw=?";
		Object[] con={userName,userPw};
		List userList=userDAO.getHibernateTemplate().find(sql,con);
		if(userList.size()==0)
		{
			this.setMessage("�û������������");
			this.setPath("qiantai/default.jsp");
		}
		else
		{
			 Map session= ServletActionContext.getContext().getSession();
			 TUser user=(TUser)userList.get(0);
			 session.put("user", user);
			 
			 Cart cart=new Cart();
			 session.put("cart", cart);
			 
			 this.setMessage("�ɹ���¼");
			 this.setPath("qiantai/default.jsp");
		}
		return "succeed";
	}
	
	
	public String userLogout()
	{
		Map session= ServletActionContext.getContext().getSession();
		session.remove("user");
		return ActionSupport.SUCCESS;
	}
	
	
	
	
	
	
	public String userDel()
	{
		TUser user=userDAO.findById(userId);
		user.setUserDel("yes");
		userDAO.attachDirty(user);
		this.setMessage("ɾ���ɹ�");
		this.setPath("userMana.action");
		return "succeed";
	}
	
	
	public String userXinxi()
	{
		TUser user=userDAO.findById(userId);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("user", user);
		return ActionSupport.SUCCESS;
	}
	
	
	public String userMana()
	{
		List userList=userDAO.findAll();
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("userList", userList);
		return ActionSupport.SUCCESS;
	}
	public String getMessage()
	{
		return message;
	}
	public void setMessage(String message)
	{
		this.message = message;
	}
	public String getPath()
	{
		return path;
	}
	public void setPath(String path)
	{
		this.path = path;
	}
	public String getUserAddress()
	{
		return userAddress;
	}
	public void setUserAddress(String userAddress)
	{
		this.userAddress = userAddress;
	}
	public TUserDAO getUserDAO()
	{
		return userDAO;
	}
	public void setUserDAO(TUserDAO userDAO)
	{
		this.userDAO = userDAO;
	}
	public Integer getUserId()
	{
		return userId;
	}
	public void setUserId(Integer userId)
	{
		this.userId = userId;
	}
	public String getUserName()
	{
		return userName;
	}
	public void setUserName(String userName)
	{
		this.userName = userName;
	}
	public String getUserPw()
	{
		return userPw;
	}
	public void setUserPw(String userPw)
	{
		this.userPw = userPw;
	}
	public String getUserRealname()
	{
		return userRealname;
	}
	public void setUserRealname(String userRealname)
	{
		this.userRealname = userRealname;
	}
	public String getUserSex()
	{
		return userSex;
	}
	public void setUserSex(String userSex)
	{
		this.userSex = userSex;
	}
	public String getUserTel()
	{
		return userTel;
	}
	public void setUserTel(String userTel)
	{
		this.userTel = userTel;
	}
	
	
	
}
