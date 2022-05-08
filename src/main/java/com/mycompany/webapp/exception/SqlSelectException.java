package com.mycompany.webapp.exception;

public class SqlSelectException  extends RuntimeException{
	public SqlSelectException() {
		super("Select Null");
	}
}
