package cn.enilu.guns.admin.common.constant.dictmap.factory;

import cn.enilu.guns.admin.common.exception.BizExceptionEnum;
import cn.enilu.guns.admin.core.exception.GunsException;
import cn.enilu.guns.service.system.IConstantFactory;
import cn.enilu.guns.service.system.impl.ConstantFactory;

import java.lang.reflect.Method;

/**
 * 字段的包装创建工厂
 *
 * @author fengshuonan
 * @date 2017-05-06 15:12
 */
public class DictFieldWarpperFactory {

	public static Object createFieldWarpper(Object field, String methodName) {
		IConstantFactory me = ConstantFactory.me();
		try {
			Method method = IConstantFactory.class.getMethod(methodName, field.getClass());
			Object result = method.invoke(me, field);
			return result;
		} catch (Exception e) {
			try {
				Method method = IConstantFactory.class.getMethod(methodName, Integer.class);
				Object result = method.invoke(me, Integer.parseInt(field.toString()));
				return result;
			} catch (Exception e1) {
				throw new GunsException(BizExceptionEnum.ERROR_WRAPPER_FIELD);
			}
		}
	}

}
