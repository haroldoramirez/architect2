package br.udc.edu.sistemas.ia6.util;

import java.beans.Transient;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Collection;
import java.util.Vector;

import br.udc.edu.sistemas.ia6.annotation.Column;
import br.udc.edu.sistemas.ia6.annotation.Entity;
import br.udc.edu.sistemas.ia6.annotation.Id;
import br.udc.edu.sistemas.ia6.annotation.Table;

public class Reflection {
	
	private static void validate(Class<?> c) throws Exception {
		if (!c.isAnnotationPresent(Entity.class)) {
			throw new Exception("");
		}
		if (!c.isAnnotationPresent(Table.class)) {
			throw new Exception();
		}
	}

	public static Table getTable(Class<?> c) throws Exception {
		validate(c);
		return (Table) c.getAnnotation(Table.class);
	}

	public static Field getIdField(Class<?> c) throws Exception {
		validate(c);
		Field fieldList[] = c.getDeclaredFields();
		for (int i = 0; i < fieldList.length; i++) {
			Field field = fieldList[i];
			if ((field.isAnnotationPresent(Id.class)) &&
				(field.isAnnotationPresent(Column.class))) {
				return field;
			}
		}
		throw new Exception();
	}

	public static Field[] getFields(Class<?> c, boolean bTransient) throws Exception {
		validate(c);
		Field fieldList[] = c.getDeclaredFields();
		Collection<Field> result = new Vector<Field>();
		for (int i = 0; i < fieldList.length; i++) {
			Field field = fieldList[i];
			if ((field.isAnnotationPresent(Column.class)) ||
				((bTransient) &&
				(field.isAnnotationPresent(Transient.class)))) {
				result.add(field);
			}
		}
		return (Field[]) result.toArray(new Field[result.size()]);
	}
	
	public static Object getFieldValue(Field field,Object obj) throws Exception {
		Class <?> c = obj.getClass();
		Method methodList[] = c.getDeclaredMethods();
		for (int i = 0; i < methodList.length; i++) {
			if (methodList[i].getName().toUpperCase().equals("GET" + field.getName().toUpperCase())) {
				return methodList[i].invoke(obj, new Object[0]); 
			}
		}
		throw new Exception();
	}

	public static void setFieldValue(Field field,Object obj,Object value) throws Exception {
		Class <?> c = obj.getClass();
		Method methodList[] = c.getDeclaredMethods();
		boolean bOk = false;
		for (int i = 0; i < methodList.length; i++) {
			if (methodList[i].getName().toUpperCase().equals("SET" + field.getName().toUpperCase())) {
				methodList[i].invoke(obj, value);
				bOk = true;
			}
		}
		if (!bOk) {
			throw new Exception();
		}
	}
	
	public static Object getIdFieldValue(Object obj) throws Exception {
		return getFieldValue(getIdField(obj.getClass()), obj);		
	}

	public static void setIdFieldValue(Object obj,Object value) throws Exception {
		setFieldValue(getIdField(obj.getClass()), obj, value);
	}
}
