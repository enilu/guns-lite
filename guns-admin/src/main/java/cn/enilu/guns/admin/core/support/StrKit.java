package cn.enilu.guns.admin.core.support;

import java.io.StringReader;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

/**
 * 字符串工具类
 * 
 * @author xiaoleilu
 *
 */
public class StrKit {

	public static final String SPACE = " ";
	public static final String DOT = ".";
	public static final String SLASH = "/";
	public static final String BACKSLASH = "\\";
	public static final String EMPTY = "";
	public static final String CRLF = "\r\n";
	public static final String NEWLINE = "\n";
	public static final String UNDERLINE = "_";
	public static final String COMMA = ",";

	public static final String HTML_NBSP = "&nbsp;";
	public static final String HTML_AMP = "&amp";
	public static final String HTML_QUOTE = "&quot;";
	public static final String HTML_LT = "&lt;";
	public static final String HTML_GT = "&gt;";

	public static final String EMPTY_JSON = "{}";

	/**
	 * 首字母变小写
	 */
	public static String firstCharToLowerCase(String str) {
		char firstChar = str.charAt(0);
		if (firstChar >= 'A' && firstChar <= 'Z') {
			char[] arr = str.toCharArray();
			arr[0] += ('a' - 'A');
			return new String(arr);
		}
		return str;
	}

	/**
	 * 首字母变大写
	 */
	public static String firstCharToUpperCase(String str) {
		char firstChar = str.charAt(0);
		if (firstChar >= 'a' && firstChar <= 'z') {
			char[] arr = str.toCharArray();
			arr[0] -= ('a' - 'A');
			return new String(arr);
		}
		return str;
	}

	// ------------------------------------------------------------------------
	// Blank
	/**
	 * 字符串是否为空白 空白的定义如下： <br>
	 * 1、为null <br>
	 * 2、为不可见字符（如空格）<br>
	 * 3、""<br>
	 * 
	 * @param str 被检测的字符串
	 * @return 是否为空
	 */
	public static boolean isBlank(String str) {
		int length;
		if ((str == null) || ((length = str.length()) == 0)) {
			return true;
		}
		for (int i = 0; i < length; i++) {
			// 只要有一个非空字符即为非空字符串
			if (false == Character.isWhitespace(str.charAt(i))) {
				return false;
			}
		}
		return true;
	}

	/**
	 * 字符串是否为非空白 空白的定义如下： <br>
	 * 1、不为null <br>
	 * 2、不为不可见字符（如空格）<br>
	 * 3、不为""<br>
	 * 
	 * @param str 被检测的字符串
	 * @return 是否为非空
	 */
	public static boolean notBlank(String str) {
		return false == isBlank(str);
	}

	/**
	 * 是否包含空字符串
	 * 
	 * @param strs 字符串列表
	 * @return 是否包含空字符串
	 */
	public static boolean hasBlank(String... strs) {
		if (CollectionKit.isEmpty(strs)) {
			return true;
		}
		for (String str : strs) {
			if (isBlank(str)) {
				return true;
			}
		}
		return false;
	}

	/**
	 * 给定所有字符串是否为空白
	 * 
	 * @param strs 字符串
	 * @return 所有字符串是否为空白
	 */
	public static boolean isAllBlank(String... strs) {
		if (CollectionKit.isEmpty(strs)) {
			return true;
		}
		for (String str : strs) {
			if (notBlank(str)) {
				return false;
			}
		}
		return true;
	}

	// ------------------------------------------------------------------------
	// Empty
	/**
	 * 字符串是否为空，空的定义如下 1、为null <br>
	 * 2、为""<br>
	 * 
	 * @param str 被检测的字符串
	 * @return 是否为空
	 */
	public static boolean isEmpty(String str) {
		return str == null || str.length() == 0;
	}

	/**
	 * 字符串是否为非空白 空白的定义如下： <br>
	 * 1、不为null <br>
	 * 2、不为""<br>
	 * 
	 * @param str 被检测的字符串
	 * @return 是否为非空
	 */
	public static boolean isNotEmpty(String str) {
		return false == isEmpty(str);
	}

	/**
	 * 当给定字符串为null时，转换为Empty
	 * 
	 * @param str 被转换的字符串
	 * @return 转换后的字符串
	 */
	public static String nullToEmpty(String str) {
		return nullToDefault(str, EMPTY);
	}

	/**
	 * 如果字符串是<code>null</code>，则返回指定默认字符串，否则返回字符串本身。
	 * 
	 * <pre>
	 * nullToDefault(null, &quot;default&quot;)  = &quot;default&quot;
	 * nullToDefault(&quot;&quot;, &quot;default&quot;)    = &quot;&quot;
	 * nullToDefault(&quot;  &quot;, &quot;default&quot;)  = &quot;  &quot;
	 * nullToDefault(&quot;bat&quot;, &quot;default&quot;) = &quot;bat&quot;
	 * </pre>
	 * 
	 * @param str        要转换的字符串
	 * @param defaultStr 默认字符串
	 * 
	 * @return 字符串本身或指定的默认字符串
	 */
	public static String nullToDefault(String str, String defaultStr) {
		return (str == null) ? defaultStr : str;
	}

	/**
	 * 当给定字符串为空字符串时，转换为<code>null</code>
	 * 
	 * @param str 被转换的字符串
	 * @return 转换后的字符串
	 */
	public static String emptyToNull(String str) {
		return isEmpty(str) ? null : str;
	}

	/**
	 * 是否包含空字符串
	 * 
	 * @param strs 字符串列表
	 * @return 是否包含空字符串
	 */
	public static boolean hasEmpty(String... strs) {
		if (CollectionKit.isEmpty(strs)) {
			return true;
		}

		for (String str : strs) {
			if (isEmpty(str)) {
				return true;
			}
		}
		return false;
	}

	/**
	 * 是否全部为空字符串
	 * 
	 * @param strs 字符串列表
	 * @return 是否全部为空字符串
	 */
	public static boolean isAllEmpty(String... strs) {
		if (CollectionKit.isEmpty(strs)) {
			return true;
		}

		for (String str : strs) {
			if (isNotEmpty(str)) {
				return false;
			}
		}
		return true;
	}

	// ------------------------------------------------------------------------ Trim
	/**
	 * 除去字符串头尾部的空白，如果字符串是<code>null</code>，依然返回<code>null</code>。
	 * 
	 * <p>
	 * 注意，和<code>String.trim</code>不同，此方法使用<code>Character.isWhitespace</code>
	 * 来判定空白， 因而可以除去英文字符集之外的其它空白，如中文空格。
	 * 
	 * <pre>
	 * trim(null)          = null
	 * trim(&quot;&quot;)            = &quot;&quot;
	 * trim(&quot;     &quot;)       = &quot;&quot;
	 * trim(&quot;abc&quot;)         = &quot;abc&quot;
	 * trim(&quot;    abc    &quot;) = &quot;abc&quot;
	 * </pre>
	 * 
	 * </p>
	 * 
	 * @param str 要处理的字符串
	 * 
	 * @return 除去空白的字符串，如果原字串为<code>null</code>，则返回<code>null</code>
	 */
	public static String trim(String str) {
		return (null == str) ? null : trim(str, 0);
	}

	/**
	 * 给定字符串数组全部做去首尾空格
	 * 
	 * @param strs 字符串数组
	 */
	public static void trim(String[] strs) {
		if (null == strs) {
			return;
		}
		String str;
		for (int i = 0; i < strs.length; i++) {
			str = strs[i];
			if (null != str) {
				strs[i] = str.trim();
			}
		}
	}

	/**
	 * 除去字符串头部的空白，如果字符串是<code>null</code>，则返回<code>null</code>。
	 * 
	 * <p>
	 * 注意，和<code>String.trim</code>不同，此方法使用<code>Character.isWhitespace</code>
	 * 来判定空白， 因而可以除去英文字符集之外的其它空白，如中文空格。
	 * 
	 * <pre>
	 * trimStart(null)         = null
	 * trimStart(&quot;&quot;)           = &quot;&quot;
	 * trimStart(&quot;abc&quot;)        = &quot;abc&quot;
	 * trimStart(&quot;  abc&quot;)      = &quot;abc&quot;
	 * trimStart(&quot;abc  &quot;)      = &quot;abc  &quot;
	 * trimStart(&quot; abc &quot;)      = &quot;abc &quot;
	 * </pre>
	 * 
	 * </p>
	 * 
	 * @param str 要处理的字符串
	 * 
	 * @return 除去空白的字符串，如果原字串为<code>null</code>或结果字符串为<code>""</code>，则返回
	 *         <code>null</code>
	 */
	public static String trimStart(String str) {
		return trim(str, -1);
	}

	/**
	 * 除去字符串尾部的空白，如果字符串是<code>null</code>，则返回<code>null</code>。
	 * 
	 * <p>
	 * 注意，和<code>String.trim</code>不同，此方法使用<code>Character.isWhitespace</code>
	 * 来判定空白， 因而可以除去英文字符集之外的其它空白，如中文空格。
	 * 
	 * <pre>
	 * trimEnd(null)       = null
	 * trimEnd(&quot;&quot;)         = &quot;&quot;
	 * trimEnd(&quot;abc&quot;)      = &quot;abc&quot;
	 * trimEnd(&quot;  abc&quot;)    = &quot;  abc&quot;
	 * trimEnd(&quot;abc  &quot;)    = &quot;abc&quot;
	 * trimEnd(&quot; abc &quot;)    = &quot; abc&quot;
	 * </pre>
	 * 
	 * </p>
	 * 
	 * @param str 要处理的字符串
	 * 
	 * @return 除去空白的字符串，如果原字串为<code>null</code>或结果字符串为<code>""</code>，则返回
	 *         <code>null</code>
	 */
	public static String trimEnd(String str) {
		return trim(str, 1);
	}

	/**
	 * 除去字符串头尾部的空白符，如果字符串是<code>null</code>，依然返回<code>null</code>。
	 * 
	 * @param str  要处理的字符串
	 * @param mode <code>-1</code>表示trimStart，<code>0</code>表示trim全部，
	 *             <code>1</code>表示trimEnd
	 * 
	 * @return 除去指定字符后的的字符串，如果原字串为<code>null</code>，则返回<code>null</code>
	 */
	public static String trim(String str, int mode) {
		if (str == null) {
			return null;
		}

		int length = str.length();
		int start = 0;
		int end = length;

		// 扫描字符串头部
		if (mode <= 0) {
			while ((start < end) && (Character.isWhitespace(str.charAt(start)))) {
				start++;
			}
		}

		// 扫描字符串尾部
		if (mode >= 0) {
			while ((start < end) && (Character.isWhitespace(str.charAt(end - 1)))) {
				end--;
			}
		}

		if ((start > 0) || (end < length)) {
			return str.substring(start, end);
		}

		return str;
	}

	/**
	 * 是否以指定字符串开头
	 * 
	 * @param str          被监测字符串
	 * @param prefix       开头字符串
	 * @param isIgnoreCase 是否忽略大小写
	 * @return 是否以指定字符串开头
	 */
	public static boolean startWith(String str, String prefix, boolean isIgnoreCase) {
		if (isIgnoreCase) {
			return str.toLowerCase().startsWith(prefix.toLowerCase());
		} else {
			return str.startsWith(prefix);
		}
	}

	/**
	 * 是否以指定字符串结尾
	 * 
	 * @param str          被监测字符串
	 * @param suffix       结尾字符串
	 * @param isIgnoreCase 是否忽略大小写
	 * @return 是否以指定字符串结尾
	 */
	public static boolean endWith(String str, String suffix, boolean isIgnoreCase) {
		if (isIgnoreCase) {
			return str.toLowerCase().endsWith(suffix.toLowerCase());
		} else {
			return str.endsWith(suffix);
		}
	}

	/**
	 * 是否包含特定字符，忽略大小写，如果给定两个参数都为<code>null</code>，返回true
	 * 
	 * @param str     被检测字符串
	 * @param testStr 被测试是否包含的字符串
	 * @return 是否包含
	 */
	public static boolean containsIgnoreCase(String str, String testStr) {
		if (null == str) {
			// 如果被监测字符串和
			return null == testStr;
		}
		return str.toLowerCase().contains(testStr.toLowerCase());
	}

	/**
	 * 获得set或get方法对应的标准属性名<br/>
	 * 例如：setName 返回 name
	 * 
	 * @param getOrSetMethodName
	 * @return 如果是set或get方法名，返回field， 否则null
	 */
	public static String getGeneralField(String getOrSetMethodName) {
		if (getOrSetMethodName.startsWith("get") || getOrSetMethodName.startsWith("set")) {
			return cutPreAndLowerFirst(getOrSetMethodName, 3);
		}
		return null;
	}

	/**
	 * 生成set方法名<br/>
	 * 例如：name 返回 setName
	 * 
	 * @param fieldName 属性名
	 * @return setXxx
	 */
	public static String genSetter(String fieldName) {
		return upperFirstAndAddPre(fieldName, "set");
	}

	/**
	 * 生成get方法名
	 * 
	 * @param fieldName 属性名
	 * @return getXxx
	 */
	public static String genGetter(String fieldName) {
		return upperFirstAndAddPre(fieldName, "get");
	}

	/**
	 * 去掉首部指定长度的字符串并将剩余字符串首字母小写<br/>
	 * 例如：str=setName, preLength=3 -> return name
	 * 
	 * @param str       被处理的字符串
	 * @param preLength 去掉的长度
	 * @return 处理后的字符串，不符合规范返回null
	 */
	public static String cutPreAndLowerFirst(String str, int preLength) {
		if (str == null) {
			return null;
		}
		if (str.length() > preLength) {
			char first = Character.toLowerCase(str.charAt(preLength));
			if (str.length() > preLength + 1) {
				return first + str.substring(preLength + 1);
			}
			return String.valueOf(first);
		}
		return null;
	}

	/**
	 * 原字符串首字母大写并在其首部添加指定字符串 例如：str=name, preString=get -> return getName
	 * 
	 * @param str       被处理的字符串
	 * @param preString 添加的首部
	 * @return 处理后的字符串
	 */
	public static String upperFirstAndAddPre(String str, String preString) {
		if (str == null || preString == null) {
			return null;
		}
		return preString + upperFirst(str);
	}

	/**
	 * 大写首字母<br>
	 * 例如：str = name, return Name
	 * 
	 * @param str 字符串
	 * @return 字符串
	 */
	public static String upperFirst(String str) {
		return Character.toUpperCase(str.charAt(0)) + str.substring(1);
	}

	/**
	 * 小写首字母<br>
	 * 例如：str = Name, return name
	 * 
	 * @param str 字符串
	 * @return 字符串
	 */
	public static String lowerFirst(String str) {
		if (isBlank(str)) {
			return str;
		}
		return Character.toLowerCase(str.charAt(0)) + str.substring(1);
	}

	/**
	 * 去掉指定前缀
	 * 
	 * @param str    字符串
	 * @param prefix 前缀
	 * @return 切掉后的字符串，若前缀不是 preffix， 返回原字符串
	 */
	public static String removePrefix(String str, String prefix) {
		if (isEmpty(str) || isEmpty(prefix)) {
			return str;
		}

		if (str.startsWith(prefix)) {
			return str.substring(prefix.length());
		}
		return str;
	}

	/**
	 * 忽略大小写去掉指定前缀
	 * 
	 * @param str    字符串
	 * @param prefix 前缀
	 * @return 切掉后的字符串，若前缀不是 prefix， 返回原字符串
	 */
	public static String removePrefixIgnoreCase(String str, String prefix) {
		if (isEmpty(str) || isEmpty(prefix)) {
			return str;
		}

		if (str.toLowerCase().startsWith(prefix.toLowerCase())) {
			return str.substring(prefix.length());
		}
		return str;
	}

	/**
	 * 去掉指定后缀
	 * 
	 * @param str    字符串
	 * @param suffix 后缀
	 * @return 切掉后的字符串，若后缀不是 suffix， 返回原字符串
	 */
	public static String removeSuffix(String str, String suffix) {
		if (isEmpty(str) || isEmpty(suffix)) {
			return str;
		}

		if (str.endsWith(suffix)) {
			return str.substring(0, str.length() - suffix.length());
		}
		return str;
	}

	/**
	 * 获得字符串对应byte数组
	 * 
	 * @param str     字符串
	 * @param charset 编码，如果为<code>null</code>使用系统默认编码
	 * @return bytes
	 */
	public static byte[] getBytes(String str, Charset charset) {
		if (null == str) {
			return null;
		}
		return null == charset ? str.getBytes() : str.getBytes(charset);
	}

	/**
	 * 忽略大小写去掉指定后缀
	 * 
	 * @param str    字符串
	 * @param suffix 后缀
	 * @return 切掉后的字符串，若后缀不是 suffix， 返回原字符串
	 */
	public static String removeSuffixIgnoreCase(String str, String suffix) {
		if (isEmpty(str) || isEmpty(suffix)) {
			return str;
		}

		if (str.toLowerCase().endsWith(suffix.toLowerCase())) {
			return str.substring(0, str.length() - suffix.length());
		}
		return str;
	}

	/**
	 * 如果给定字符串不是以prefix开头的，在开头补充 prefix
	 * 
	 * @param str    字符串
	 * @param prefix 前缀
	 * @return 补充后的字符串
	 */
	public static String addPrefixIfNot(String str, String prefix) {
		if (isEmpty(str) || isEmpty(prefix)) {
			return str;
		}
		if (false == str.startsWith(prefix)) {
			str = prefix + str;
		}
		return str;
	}

	/**
	 * 如果给定字符串不是以suffix结尾的，在尾部补充 suffix
	 * 
	 * @param str    字符串
	 * @param suffix 后缀
	 * @return 补充后的字符串
	 */
	public static String addSuffixIfNot(String str, String suffix) {
		if (isEmpty(str) || isEmpty(suffix)) {
			return str;
		}
		if (false == str.endsWith(suffix)) {
			str += suffix;
		}
		return str;
	}

	/**
	 * 清理空白字符
	 * 
	 * @param str 被清理的字符串
	 * @return 清理后的字符串
	 */
	public static String cleanBlank(String str) {
		if (str == null) {
			return null;
		}

		return str.replaceAll("\\s*", EMPTY);
	}

	/**
	 * 切分字符串<br>
	 * a#b#c -> [a,b,c] <br>
	 * a##b#c -> [a,"",b,c]
	 * 
	 * @param str       被切分的字符串
	 * @param separator 分隔符字符
	 * @return 切分后的集合
	 */
	public static List<String> split(String str, char separator) {
		return split(str, separator, 0);
	}

	/**
	 * 切分字符串
	 * 
	 * @param str       被切分的字符串
	 * @param separator 分隔符字符
	 * @param limit     限制分片数
	 * @return 切分后的集合
	 */
	public static List<String> split(String str, char separator, int limit) {
		if (str == null) {
			return null;
		}
		List<String> list = new ArrayList<String>(limit == 0 ? 16 : limit);
		if (limit == 1) {
			list.add(str);
			return list;
		}

		boolean isNotEnd = true; // 未结束切分的标志
		int strLen = str.length();
		StringBuilder sb = new StringBuilder(strLen);
		for (int i = 0; i < strLen; i++) {
			char c = str.charAt(i);
			if (isNotEnd && c == separator) {
				list.add(sb.toString());
				// 清空StringBuilder
				sb.delete(0, sb.length());

				// 当达到切分上限-1的量时，将所剩字符全部作为最后一个串
				if (limit != 0 && list.size() == limit - 1) {
					isNotEnd = false;
				}
			} else {
				sb.append(c);
			}
		}
		list.add(sb.toString());// 加入尾串
		return list;
	}

	/**
	 * 切分字符串<br>
	 * from jodd
	 * 
	 * @param str       被切分的字符串
	 * @param delimiter 分隔符
	 * @return 字符串
	 */
	public static String[] split(String str, String delimiter) {
		if (str == null) {
			return null;
		}
		if (str.trim().length() == 0) {
			return new String[] { str };
		}

		int dellen = delimiter.length(); // del length
		int maxparts = (str.length() / dellen) + 2; // one more for the last
		int[] positions = new int[maxparts];

		int i, j = 0;
		int count = 0;
		positions[0] = -dellen;
		while ((i = str.indexOf(delimiter, j)) != -1) {
			count++;
			positions[count] = i;
			j = i + dellen;
		}
		count++;
		positions[count] = str.length();

		String[] result = new String[count];

		for (i = 0; i < count; i++) {
			result[i] = str.substring(positions[i] + dellen, positions[i + 1]);
		}
		return result;
	}

	/**
	 * 改进JDK subString<br>
	 * index从0开始计算，最后一个字符为-1<br>
	 * 如果from和to位置一样，返回 "" <br>
	 * 如果from或to为负数，则按照length从后向前数位置，如果绝对值大于字符串长度，则from归到0，to归到length<br>
	 * 如果经过修正的index中from大于to，则互换from和to example: <br>
	 * abcdefgh 2 3 -> c <br>
	 * abcdefgh 2 -3 -> cde <br>
	 * 
	 * @param string    String
	 * @param fromIndex 开始的index（包括）
	 * @param toIndex   结束的index（不包括）
	 * @return 字串
	 */
	public static String sub(String string, int fromIndex, int toIndex) {
		int len = string.length();
		if (fromIndex < 0) {
			fromIndex = len + fromIndex;
			if (fromIndex < 0) {
				fromIndex = 0;
			}
		} else if (fromIndex >= len) {
			fromIndex = len - 1;
		}
		if (toIndex < 0) {
			toIndex = len + toIndex;
			if (toIndex < 0) {
				toIndex = len;
			}
		} else if (toIndex > len) {
			toIndex = len;
		}
		if (toIndex < fromIndex) {
			int tmp = fromIndex;
			fromIndex = toIndex;
			toIndex = tmp;
		}
		if (fromIndex == toIndex) {
			return EMPTY;
		}
		char[] strArray = string.toCharArray();
		char[] newStrArray = Arrays.copyOfRange(strArray, fromIndex, toIndex);
		return new String(newStrArray);
	}

	/**
	 * 切割前部分
	 * 
	 * @param string  字符串
	 * @param toIndex 切割到的位置（不包括）
	 * @return 切割后的字符串
	 */
	public static String subPre(String string, int toIndex) {
		return sub(string, 0, toIndex);
	}

	/**
	 * 切割后部分
	 * 
	 * @param string    字符串
	 * @param fromIndex 切割开始的位置（包括）
	 * @return 切割后的字符串
	 */
	public static String subSuf(String string, int fromIndex) {
		if (isEmpty(string)) {
			return null;
		}
		return sub(string, fromIndex, string.length());
	}

	/**
	 * 给定字符串是否被字符包围
	 * 
	 * @param str    字符串
	 * @param prefix 前缀
	 * @param suffix 后缀
	 * @return 是否包围，空串不包围
	 */
	public static boolean isSurround(String str, String prefix, String suffix) {
		if (StrKit.isBlank(str)) {
			return false;
		}
		if (str.length() < (prefix.length() + suffix.length())) {
			return false;
		}

		return str.startsWith(prefix) && str.endsWith(suffix);
	}

	/**
	 * 给定字符串是否被字符包围
	 * 
	 * @param str    字符串
	 * @param prefix 前缀
	 * @param suffix 后缀
	 * @return 是否包围，空串不包围
	 */
	public static boolean isSurround(String str, char prefix, char suffix) {
		if (StrKit.isBlank(str)) {
			return false;
		}
		if (str.length() < 2) {
			return false;
		}

		return str.charAt(0) == prefix && str.charAt(str.length() - 1) == suffix;
	}

	/**
	 * 重复某个字符
	 * 
	 * @param c     被重复的字符
	 * @param count 重复的数目
	 * @return 重复字符字符串
	 */
	public static String repeat(char c, int count) {
		char[] result = new char[count];
		for (int i = 0; i < count; i++) {
			result[i] = c;
		}
		return new String(result);
	}

	/**
	 * 重复某个字符串
	 * 
	 * @param str   被重复的字符
	 * @param count 重复的数目
	 * @return 重复字符字符串
	 */
	public static String repeat(String str, int count) {

		// 检查
		final int len = str.length();
		final long longSize = (long) len * (long) count;
		final int size = (int) longSize;
		if (size != longSize) {
			throw new ArrayIndexOutOfBoundsException("Required String length is too large: " + longSize);
		}

		final char[] array = new char[size];
		str.getChars(0, len, array, 0);
		int n;
		for (n = len; n < size - n; n <<= 1) {// n <<= 1相当于n *2
			System.arraycopy(array, 0, array, n, n);
		}
		System.arraycopy(array, 0, array, n, size - n);
		return new String(array);
	}

	/**
	 * 比较两个字符串（大小写敏感）。
	 * 
	 * <pre>
	 * equals(null, null)   = true
	 * equals(null, &quot;abc&quot;)  = false
	 * equals(&quot;abc&quot;, null)  = false
	 * equals(&quot;abc&quot;, &quot;abc&quot;) = true
	 * equals(&quot;abc&quot;, &quot;ABC&quot;) = false
	 * </pre>
	 * 
	 * @param str1 要比较的字符串1
	 * @param str2 要比较的字符串2
	 * 
	 * @return 如果两个字符串相同，或者都是<code>null</code>，则返回<code>true</code>
	 */
	public static boolean equals(String str1, String str2) {
		if (str1 == null) {
			return str2 == null;
		}

		return str1.equals(str2);
	}

	/**
	 * 比较两个字符串（大小写不敏感）。
	 * 
	 * <pre>
	 * equalsIgnoreCase(null, null)   = true
	 * equalsIgnoreCase(null, &quot;abc&quot;)  = false
	 * equalsIgnoreCase(&quot;abc&quot;, null)  = false
	 * equalsIgnoreCase(&quot;abc&quot;, &quot;abc&quot;) = true
	 * equalsIgnoreCase(&quot;abc&quot;, &quot;ABC&quot;) = true
	 * </pre>
	 * 
	 * @param str1 要比较的字符串1
	 * @param str2 要比较的字符串2
	 * 
	 * @return 如果两个字符串相同，或者都是<code>null</code>，则返回<code>true</code>
	 */
	public static boolean equalsIgnoreCase(String str1, String str2) {
		if (str1 == null) {
			return str2 == null;
		}

		return str1.equalsIgnoreCase(str2);
	}

	/**
	 * 格式化文本, {} 表示占位符<br>
	 * 例如：format("aaa {} ccc", "bbb") ----> aaa bbb ccc
	 * 
	 * @param template 文本模板，被替换的部分用 {} 表示
	 * @param values   参数值
	 * @return 格式化后的文本
	 */
	public static String format(String template, Object... values) {
		if (CollectionKit.isEmpty(values) || isBlank(template)) {
			return template;
		}

		final StringBuilder sb = new StringBuilder();
		final int length = template.length();

		int valueIndex = 0;
		char currentChar;
		for (int i = 0; i < length; i++) {
			if (valueIndex >= values.length) {
				sb.append(sub(template, i, length));
				break;
			}

			currentChar = template.charAt(i);
			if (currentChar == '{') {
				final char nextChar = template.charAt(++i);
				if (nextChar == '}') {
					sb.append(values[valueIndex++]);
				} else {
					sb.append('{').append(nextChar);
				}
			} else {
				sb.append(currentChar);
			}

		}

		return sb.toString();
	}

	/**
	 * 格式化文本，使用 {varName} 占位<br>
	 * map = {a: "aValue", b: "bValue"} format("{a} and {b}", map) ----> aValue and
	 * bValue
	 * 
	 * @param template 文本模板，被替换的部分用 {key} 表示
	 * @param map      参数值对
	 * @return 格式化后的文本
	 */
	public static String format(String template, Map<?, ?> map) {
		if (null == map || map.isEmpty()) {
			return template;
		}

		for (Entry<?, ?> entry : map.entrySet()) {
			template = template.replace("{" + entry.getKey() + "}", entry.getValue().toString());
		}
		return template;
	}

	/**
	 * 编码字符串
	 * 
	 * @param str     字符串
	 * @param charset 字符集，如果此字段为空，则解码的结果取决于平台
	 * @return 编码后的字节码
	 */
	public static byte[] bytes(String str, String charset) {
		return bytes(str, isBlank(charset) ? Charset.defaultCharset() : Charset.forName(charset));
	}

	/**
	 * 编码字符串
	 * 
	 * @param str     字符串
	 * @param charset 字符集，如果此字段为空，则解码的结果取决于平台
	 * @return 编码后的字节码
	 */
	public static byte[] bytes(String str, Charset charset) {
		if (str == null) {
			return null;
		}

		if (null == charset) {
			return str.getBytes();
		}
		return str.getBytes(charset);
	}

	/**
	 * 将byte数组转为字符串
	 * 
	 * @param bytes   byte数组
	 * @param charset 字符集
	 * @return 字符串
	 */
	public static String str(byte[] bytes, String charset) {
		return str(bytes, isBlank(charset) ? Charset.defaultCharset() : Charset.forName(charset));
	}

	/**
	 * 解码字节码
	 * 
	 * @param data    字符串
	 * @param charset 字符集，如果此字段为空，则解码的结果取决于平台
	 * @return 解码后的字符串
	 */
	public static String str(byte[] data, Charset charset) {
		if (data == null) {
			return null;
		}

		if (null == charset) {
			return new String(data);
		}
		return new String(data, charset);
	}

	/**
	 * 将编码的byteBuffer数据转换为字符串
	 * 
	 * @param data    数据
	 * @param charset 字符集，如果为空使用当前系统字符集
	 * @return 字符串
	 */
	public static String str(ByteBuffer data, String charset) {
		if (data == null) {
			return null;
		}

		return str(data, Charset.forName(charset));
	}

	/**
	 * 将编码的byteBuffer数据转换为字符串
	 * 
	 * @param data    数据
	 * @param charset 字符集，如果为空使用当前系统字符集
	 * @return 字符串
	 */
	public static String str(ByteBuffer data, Charset charset) {
		if (null == charset) {
			charset = Charset.defaultCharset();
		}
		return charset.decode(data).toString();
	}

	/**
	 * 字符串转换为byteBuffer
	 * 
	 * @param str     字符串
	 * @param charset 编码
	 * @return byteBuffer
	 */
	public static ByteBuffer byteBuffer(String str, String charset) {
		return ByteBuffer.wrap(StrKit.bytes(str, charset));
	}

	/**
	 * 以 conjunction 为分隔符将多个对象转换为字符串
	 * 
	 * @param conjunction 分隔符
	 * @param objs        数组
	 * @return 连接后的字符串
	 */
	public static String join(String conjunction, Object... objs) {
		StringBuilder sb = new StringBuilder();
		boolean isFirst = true;
		for (Object item : objs) {
			if (isFirst) {
				isFirst = false;
			} else {
				sb.append(conjunction);
			}
			sb.append(item);
		}
		return sb.toString();
	}

	/**
	 * 将驼峰式命名的字符串转换为下划线方式。如果转换前的驼峰式命名的字符串为空，则返回空字符串。</br>
	 * 例如：HelloWorld->hello_world
	 *
	 * @param camelCaseStr 转换前的驼峰式命名的字符串
	 * @return 转换后下划线大写方式命名的字符串
	 */
	public static String toUnderlineCase(String camelCaseStr) {
		if (camelCaseStr == null) {
			return null;
		}

		final int length = camelCaseStr.length();
		StringBuilder sb = new StringBuilder();
		char c;
		boolean isPreUpperCase = false;
		for (int i = 0; i < length; i++) {
			c = camelCaseStr.charAt(i);
			boolean isNextUpperCase = true;
			if (i < (length - 1)) {
				isNextUpperCase = Character.isUpperCase(camelCaseStr.charAt(i + 1));
			}
			if (Character.isUpperCase(c)) {
				if (!isPreUpperCase || !isNextUpperCase) {
					if (i > 0)
						sb.append(UNDERLINE);
				}
				isPreUpperCase = true;
			} else {
				isPreUpperCase = false;
			}
			sb.append(Character.toLowerCase(c));
		}
		return sb.toString();
	}

	/**
	 * 将下划线方式命名的字符串转换为驼峰式。如果转换前的下划线大写方式命名的字符串为空，则返回空字符串。</br>
	 * 例如：hello_world->HelloWorld
	 *
	 * @param name 转换前的下划线大写方式命名的字符串
	 * @return 转换后的驼峰式命名的字符串
	 */
	public static String toCamelCase(String name) {
		if (name == null) {
			return null;
		}
		if (name.contains(UNDERLINE)) {
			name = name.toLowerCase();

			StringBuilder sb = new StringBuilder(name.length());
			boolean upperCase = false;
			for (int i = 0; i < name.length(); i++) {
				char c = name.charAt(i);

				if (c == '_') {
					upperCase = true;
				} else if (upperCase) {
					sb.append(Character.toUpperCase(c));
					upperCase = false;
				} else {
					sb.append(c);
				}
			}
			return sb.toString();
		} else
			return name;
	}

	/**
	 * 包装指定字符串
	 * 
	 * @param str    被包装的字符串
	 * @param prefix 前缀
	 * @param suffix 后缀
	 * @return 包装后的字符串
	 */
	public static String wrap(String str, String prefix, String suffix) {
		return format("{}{}{}", prefix, str, suffix);
	}

	/**
	 * 指定字符串是否被包装
	 * 
	 * @param str    字符串
	 * @param prefix 前缀
	 * @param suffix 后缀
	 * @return 是否被包装
	 */
	public static boolean isWrap(String str, String prefix, String suffix) {
		return str.startsWith(prefix) && str.endsWith(suffix);
	}

	/**
	 * 指定字符串是否被同一字符包装（前后都有这些字符串）
	 * 
	 * @param str     字符串
	 * @param wrapper 包装字符串
	 * @return 是否被包装
	 */
	public static boolean isWrap(String str, String wrapper) {
		return isWrap(str, wrapper, wrapper);
	}

	/**
	 * 指定字符串是否被同一字符包装（前后都有这些字符串）
	 * 
	 * @param str     字符串
	 * @param wrapper 包装字符
	 * @return 是否被包装
	 */
	public static boolean isWrap(String str, char wrapper) {
		return isWrap(str, wrapper, wrapper);
	}

	/**
	 * 指定字符串是否被包装
	 * 
	 * @param str        字符串
	 * @param prefixChar 前缀
	 * @param suffixChar 后缀
	 * @return 是否被包装
	 */
	public static boolean isWrap(String str, char prefixChar, char suffixChar) {
		return str.charAt(0) == prefixChar && str.charAt(str.length() - 1) == suffixChar;
	}

	/**
	 * 补充字符串以满足最小长度 StrUtil.padPre("1", 3, '0');//"001"
	 * 
	 * @param str       字符串
	 * @param minLength 最小长度
	 * @param padChar   补充的字符
	 * @return 补充后的字符串
	 */
	public static String padPre(String str, int minLength, char padChar) {
		if (str.length() >= minLength) {
			return str;
		}
		StringBuilder sb = new StringBuilder(minLength);
		for (int i = str.length(); i < minLength; i++) {
			sb.append(padChar);
		}
		sb.append(str);
		return sb.toString();
	}

	/**
	 * 补充字符串以满足最小长度 StrUtil.padEnd("1", 3, '0');//"100"
	 * 
	 * @param str       字符串
	 * @param minLength 最小长度
	 * @param padChar   补充的字符
	 * @return 补充后的字符串
	 */
	public static String padEnd(String str, int minLength, char padChar) {
		if (str.length() >= minLength) {
			return str;
		}
		StringBuilder sb = new StringBuilder(minLength);
		sb.append(str);
		for (int i = str.length(); i < minLength; i++) {
			sb.append(padChar);
		}
		return sb.toString();
	}

	/**
	 * 创建StringBuilder对象
	 * 
	 * @return StringBuilder对象
	 */
	public static StringBuilder builder() {
		return new StringBuilder();
	}

	/**
	 * 创建StringBuilder对象
	 * 
	 * @return StringBuilder对象
	 */
	public static StringBuilder builder(int capacity) {
		return new StringBuilder(capacity);
	}

	/**
	 * 创建StringBuilder对象
	 * 
	 * @return StringBuilder对象
	 */
	public static StringBuilder builder(String... strs) {
		final StringBuilder sb = new StringBuilder();
		for (String str : strs) {
			sb.append(str);
		}
		return sb;
	}

	/**
	 * 获得StringReader
	 * 
	 * @param str 字符串
	 * @return StringReader
	 */
	public static StringReader getReader(String str) {
		return new StringReader(str);
	}

	/**
	 * 获得StringWriter
	 * 
	 * @return StringWriter
	 */
	public static StringWriter getWriter() {
		return new StringWriter();
	}

	/**
	 * 编码字符串
	 * 
	 * @param str     字符串
	 * @param charset 字符集，如果此字段为空，则解码的结果取决于平台
	 * @return 编码后的字节码
	 */
	public static byte[] encode(String str, String charset) {
		if (str == null) {
			return null;
		}

		if (isBlank(charset)) {
			return str.getBytes();
		}
		try {
			return str.getBytes(charset);
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException(format("Charset [{}] unsupported!", charset));
		}
	}

	/**
	 * 解码字节码
	 * 
	 * @param data    字符串
	 * @param charset 字符集，如果此字段为空，则解码的结果取决于平台
	 * @return 解码后的字符串
	 */
	public static String decode(byte[] data, String charset) {
		if (data == null) {
			return null;
		}

		if (isBlank(charset)) {
			return new String(data);
		}
		try {
			return new String(data, charset);
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException(format("Charset [{}] unsupported!", charset));
		}
	}
}
