package com.mycompany.webapp.exception;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import lombok.extern.log4j.Log4j2;
//ControllerAdvice Controller가 실행이 되고 나서 
@Component
@ControllerAdvice
@Log4j2
public class Ch10ExceptionHandler {
	
	/*
	 * @ExceptionHandler(NullPointerException.class) public void
	 * handleNullPointerException(NullPointerException e) {
	 * log.info("실행"+e.getMessage());
	 * 
	 * }
	 * 
	 * @ExceptionHandler(ClassCastException.class) public void
	 * handleClassCastException(ClassCastException e) {
	 * log.info("실행"+e.getMessage());
	 * 
	 * }
	 * 
	 * @ExceptionHandler(Exception.class)
	 * 
	 * @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)//에러 상태코드 500으로 변경 public
	 * void handleException(Exception e) { log.info("실행"+e.getMessage());
	 * 
	 * }
	 * 
	 * @ExceptionHandler(NoHandlerFoundException.class)
	 * 
	 * @ResponseStatus(HttpStatus.NOT_FOUND)//에러 상태코드 404로 변경 public void
	 * NoHandlerFoundException(NoHandlerFoundException e) {
	 * log.info("실행"+e.getMessage());
	 * 
	 * }
	 */

}
