package com.mycompany.webapp.exception;

public class SqlUpdateException  extends RuntimeException {
	public SqlUpdateException() {
		super("Update 불가");
	}
	
}
