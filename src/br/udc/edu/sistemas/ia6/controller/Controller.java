package br.udc.edu.sistemas.ia6.controller;

import java.lang.reflect.Method;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import br.udc.edu.sistemas.ia6.factory.FactoryEntity;
import br.udc.edu.sistemas.ia6.session.Session;

public abstract class Controller {

	protected String entityName;
	protected Class <?> entityClass;
	protected HttpServletRequest request;
	protected Object obj;
	
	Controller(String entityName) throws Exception {
		this.entityName = entityName;
		this.entityClass = Class.forName("br.udc.edu.sistemas.ia6.entity." + entityName);
	}
	
	private HashMap <String, String> getPostData() {
		Enumeration <String> parameters = this.request.getParameterNames();
		HashMap <String, String> postData = new HashMap<String, String>();
		while(parameters.hasMoreElements()) {
			String paramName = (String) parameters.nextElement();
			if ((!paramName.equals("newAction")) && 
				(!paramName.equals("entityName")) &&
				(!paramName.equals("id"))) {
				postData.put(paramName, this.request.getParameter(paramName));
			}
		}
		return postData;
	}

	private Object getDeleteObject() throws Exception {
		Integer id = null;
		try {
			id = new Integer(Integer.parseInt(request.getParameter("id")));
		} catch (Exception e) {
			return null;
		}
		return FactoryEntity.createById(id,this. entityClass);
	}
	
	
	public void execute(HttpServletRequest request, String action) throws Exception {
		this.request = request;
		this.obj = FactoryEntity.createByPost(this.getPostData(), this.entityClass);
		Object objId = this.getDeleteObject();
		
		Class <?> sessionClass = Class.forName("br.udc.edu.sistemas.ia6.session.Session" + this.entityName);
		Session session = (Session) sessionClass.newInstance();
		Object objReturn = null;
		try {
			try {
				Method sessionMethod = sessionClass.getMethod(action, Object.class);
				if (objId != null) {
					objReturn = sessionMethod.invoke(session, objId);
				} else {
					objReturn = sessionMethod.invoke(session, this.obj);
				}
			} catch(NoSuchMethodException e) {
				Method sessionMethod = sessionClass.getMethod(action, Object.class, Object.class);
				objReturn = sessionMethod.invoke(session, objId, this.obj);
			}
			
			Method controllerMethod = this.getClass().getMethod(action, Object.class);
			controllerMethod.invoke(this,objReturn);
			
		} catch (NoSuchMethodException e) {
			Method controllerMethod = this.getClass().getMethod(action);
			controllerMethod.invoke(this);
		}
	}
	
	public abstract void goNew() throws Exception;
	public abstract void goFind() throws Exception;
	public abstract void save(Object obj) throws Exception;
	public abstract void delete(Object obj) throws Exception;
	public abstract void deleteList(Object obj) throws Exception;
	public abstract void detail(Object obj) throws Exception;
	public abstract void find(Object obj) throws Exception;
	public abstract void findByPrimary(Object obj) throws Exception;	
}
