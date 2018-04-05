package cn.enilu.guns.bean.exception;

@SuppressWarnings("serial")
public class XSRuntimeException extends RuntimeException {

	public XSRuntimeException(String msg) {
		super(msg);
	}
	
	public XSRuntimeException(String msg, Throwable e) {
		super(msg, e);
	}
}
