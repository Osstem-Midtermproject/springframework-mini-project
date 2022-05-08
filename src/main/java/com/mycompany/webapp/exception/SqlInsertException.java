package com.mycompany.webapp.exception;

public class SqlInsertException  extends RuntimeException {
	public SqlInsertException() {
		super("Insert 불가");
	}


}
