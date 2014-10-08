package br.udc.edu.sistemas.ia6.util;

import java.lang.reflect.Field;

import br.udc.edu.sistemas.ia6.annotation.Column;
import br.udc.edu.sistemas.ia6.annotation.GeneratedValue;
import br.udc.edu.sistemas.ia6.annotation.Id;
import br.udc.edu.sistemas.ia6.annotation.Table;


public class Query {
	public static String getTableName(Object obj) throws Exception {
		Table table = Reflection.getTable(obj.getClass());
		return table.name();
	}

	private static String getIdName(Object obj) throws Exception  {
		Field field = Reflection.getIdField(obj.getClass());
		Column column = field.getAnnotation(Column.class);
		return column.name();
	}

	private static String getIdValue(Object obj) throws Exception {
		Field field = Reflection.getIdField(obj.getClass());
		return String.valueOf(Reflection.getFieldValue(field, obj)); 
	}
	
	private static String getFieldFormatedValue(Field field,Object obj) throws Exception {
		Column column = field.getAnnotation(Column.class);				
		if (Reflection.getFieldValue(field, obj) != null) {
			if ((column.type() == Column.BOOLEAN) ||
				(column.type() == Column.INTEGER) ||
				(column.type() == Column.LONG) ||
				(column.type() == Column.FLOAT)) {
				return String.valueOf(Reflection.getFieldValue(field, obj));
			} else if (column.type() == Column.OBJECT) {
				Object objFK = Reflection.getFieldValue(field, obj);
				Field idField = Reflection.getIdField(objFK.getClass());
				if (Reflection.getFieldValue(idField, objFK) == null) {
					return "null";
				} else {
					return String.valueOf(Reflection.getFieldValue(idField, objFK));
				}
			} else {
				return "'" + String.valueOf(Reflection.getFieldValue(field, obj)) + "'";
			}
		} else {
			return "null";
		}
	}
	
	public static String getFieldNames(Object obj, boolean bId) throws Exception {
		Field fields[] = Reflection.getFields(obj.getClass(),false);
		String result = "";
		Boolean bFirst = true;		
		for (int i = 0; i < fields.length; i++) {
			if ((bId) ||
				(!fields[i].isAnnotationPresent(Id.class)) ||
				(!fields[i].isAnnotationPresent(GeneratedValue.class))) {
				Column column = fields[i].getAnnotation(Column.class);
				if (bFirst) {
					result = column.name();
					bFirst = false;
				} else {
					result += "," + column.name();
				}
			}
		}
		return result;
	}

	private static String getFieldValues(Object obj, Boolean bId) throws Exception {
		Field fields[] = Reflection.getFields(obj.getClass(),false);
		String result = "";
		Boolean bFirst = true;		
		for (int i = 0; i < fields.length; i++) {
			if ((bId) ||
				(!fields[i].isAnnotationPresent(Id.class)) ||
				(!fields[i].isAnnotationPresent(GeneratedValue.class))) {
				String sField = getFieldFormatedValue(fields[i], obj);
				if (bFirst) {
					result = sField;
					bFirst = false;
				} else {
					result += "," + sField;
				}
			}
		}
		return result;
	}
	
	private static String getFieldNamesValues(Object obj) throws Exception {
		Field fields[] = Reflection.getFields(obj.getClass(),false);
		String result = "";
		Boolean bFirst = true;		
		for (int i = 0; i < fields.length; i++) {
			if (!fields[i].isAnnotationPresent(Id.class)) {
				Column column = fields[i].getAnnotation(Column.class);
				String sField = getFieldFormatedValue(fields[i], obj);				
				if (bFirst) {
					result = column.name() + " = " + sField;
					bFirst = false;
				} else {
					result += "," + column.name() + " = " + sField;
				}
			}
		}
		return result;
	}
	
	private static String getSQLWhere(Object obj) throws Exception {
		Field fields[] = Reflection.getFields(obj.getClass(),false);
		String result = "";
		Boolean bFirst = true;		
		for (int i = 0; i < fields.length; i++) {
			Column column = fields[i].getAnnotation(Column.class);
			String sField = "";
			if ((Reflection.getFieldValue(fields[i],obj) != null) &&
				(!Reflection.getFieldValue(fields[i],obj).equals(""))) {
				if ((column.type() == Column.BOOLEAN) ||
					(column.type() == Column.INTEGER) ||
					(column.type() == Column.LONG) ||
					(column.type() == Column.FLOAT)) {
					sField = " = " + String.valueOf(Reflection.getFieldValue(fields[i],obj));
				} else if (column.type() == Column.OBJECT) {
					Object objFK = Reflection.getFieldValue(fields[i],obj);
					Field idField = Reflection.getIdField(objFK.getClass());
					if (Reflection.getFieldValue(idField,objFK) == null) {
						continue;
					} else {
						sField = " = " + String.valueOf(Reflection.getFieldValue(idField,objFK));
					}
				} else if (column.type() == Column.STRING) {
					sField = " like '%" + String.valueOf(Reflection.getFieldValue(fields[i],obj)) + "%'";
				} else {
					sField = " = '" + String.valueOf(Reflection.getFieldValue(fields[i],obj)) + "'";
				}

				if (bFirst) {
					result = "where " + column.name() + sField;
					bFirst = false;
				} else {
					result += " and " + column.name() + sField;
				}
			}
		}
		return result;
	}
	public static String getSQLInsert(Object obj) throws Exception {
		String sql = "insert into " + getTableName(obj) + " " + 
				     "(" + getFieldNames(obj,false) + ") " +
				     "values(" + getFieldValues(obj,false) + ")";		
		return sql;
	}
	
	public static String getSQLUpdate(Object obj) throws Exception  {
		String sql = "update " + getTableName(obj) + " " +
					 "set " + getFieldNamesValues(obj) + " " +
					 "where " + getIdName(obj) + " = " + getIdValue(obj);
			
		return sql;				
	}
	
	public static String getSQLDelete(Object obj) throws Exception {
		String sql = "delete from " + getTableName(obj) + " " +
					 "where " + getIdName(obj)  + " = " + getIdValue(obj);
		return sql;				
	}
	
	public static String getSQLSelect(Object obj) throws Exception  {
		String sql = "select " + getFieldNames(obj,true) + " " + 
					 "from " + getTableName(obj) + " " +
					 getSQLWhere(obj);
		return sql;
	}
}
