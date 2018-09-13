package cn.enilu.guns.dao.cache;

public class ValidException extends RuntimeException {

	public ValidException(String msg) {
		super(msg);
	}

	public ValidException(String msg, Throwable e) {
		super(msg, e);
	}
}
