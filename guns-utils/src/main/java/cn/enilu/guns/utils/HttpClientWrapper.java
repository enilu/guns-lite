package cn.enilu.guns.utils;

import com.alibaba.fastjson.JSON;
import com.google.common.base.Strings;
import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.ParseException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpDelete;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.conn.params.ConnRoutePNames;
import org.apache.http.conn.scheme.Scheme;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.conn.ssl.SSLSocketFactory;
import org.apache.http.conn.ssl.X509HostnameVerifier;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.InputStreamEntity;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.net.ssl.*;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.*;

@SuppressWarnings("deprecation")
public class HttpClientWrapper {
	protected Logger logger = LoggerFactory.getLogger(getClass());
	private HttpClient httpClient = new DefaultHttpClient();

	/** 请求的url */
	private String url;

	/** 请求的方式 */
	private HttpMethod method = HttpMethod.GET;

	/** 超时时间 */
	private int timeout = 30 * 1000;

	/** 重试次数 */
	private int retryTimes = 0;

	/** 当前重试次数 */
	private int currentRetryNo = 0;

	private Map<String, String> headers = new HashMap<String, String>();

	private Map<String, Object> params = new HashMap<String, Object>();

	private InputStream inputStream;

	private HttpHost host;
	private String proxyHost;
	private String proxyPort;

	public void setHttpHost(HttpHost host) {
		this.host = host;
	}

	public static HttpClientWrapper create() {
		return new HttpClientWrapper();
	}

	public HttpClientWrapper setHttpClient(HttpClient httpClient) {
		this.httpClient = httpClient;
		return this;
	}

	public HttpClientWrapper setUrl(String url) {
		this.url = url;
		return this;
	}
	public HttpClientWrapper setProxy(String proxyHost, int proxyPort){
		if(!Strings.isNullOrEmpty(proxyHost)&&proxyPort!=0) {
			HttpHost proxy = new HttpHost(proxyHost, proxyPort);
			this.httpClient.getParams().setParameter(ConnRoutePNames.DEFAULT_PROXY, proxy);
		}
		return this;
	}

	public HttpClientWrapper setTimeout(int timeout) {
		this.timeout = timeout;
		return this;
	}

	public HttpClientWrapper setRetryTimes(int retryTimes) {
		this.retryTimes = retryTimes;
		return this;
	}

	public HttpClientWrapper setMethod(HttpMethod httpMethod) {
		this.method = httpMethod;
		return this;
	}

	public HttpClientWrapper setMethod(String method) {
		this.method = HttpMethod.getMethod(method);
		return this;
	}

	public HttpClientWrapper addHeaders(Map<String, String> headers) {
		this.headers.putAll(headers);
		return this;
	}

	public HttpClientWrapper addHeader(String key, String value) {
		this.headers.put(key, value);
		return this;
	}

	public HttpClientWrapper addParams(Map<String, Object> params) {
		this.params.putAll(params);
		return this;
	}

	public HttpClientWrapper addParam(String key, Object value) {
		this.params.put(key, value);
		return this;
	}


	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public HttpResponse execute() {
		boolean isSSL = url.startsWith("https://");

		currentRetryNo = 0;
		HttpResponse response = null;
		do {
			if (currentRetryNo > 0) {
				logger.info("Retry %d: {} {}", currentRetryNo, method.value, url);
			}
			HttpConnectionParams.setConnectionTimeout(httpClient.getParams(), timeout);
			HttpConnectionParams.setSoTimeout(httpClient.getParams(), timeout);
			try {
				long start = System.nanoTime();
				if (isSSL) {
					this.initClientForHttps(httpClient);
				}
				HttpUriRequest request = this.getHttpRequest();

				for (String key : headers.keySet()) {
					request.addHeader(key, headers.get(key));
				}

				if (host != null) {
					response = httpClient.execute(host, request);
				} else {
					response = httpClient.execute(request);
				}
				if (response != null) {
					long end = System.nanoTime();
					logger.info("{} {} {} {} ", method.value, url, response.getStatusLine().getStatusCode(),(end-start)/1000000);
				}
				break;
			} catch (Exception e) {
				logger.error(e.getMessage(), e);
				logger.error("catch exception request : " + url + ", retryNo:" + currentRetryNo);
			}
		} while (++currentRetryNo <= retryTimes);

		return response;
	}

	public String executeStr() {
		HttpResponse response = execute();
		if (response != null) {
			try {
				return EntityUtils.toString(response.getEntity(),"utf8");
			} catch (ParseException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	public byte[] executeByte() {
		HttpResponse response = execute();
		if (response != null) {
			try {
				return EntityUtils.toByteArray(response.getEntity());
			} catch (ParseException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	public int getCurrentRetryNo() {
		return currentRetryNo;
	}

	private HttpUriRequest getHttpRequest() throws UnsupportedEncodingException {
		HttpUriRequest request = null;
		String requestURL = url;
		if (HttpMethod.GET == method) {
			if (params != null && params.size() != 0) {
				requestURL += "?" + getQueryParameter(params);
			}
			request = new HttpGet(requestURL);
		} else if (HttpMethod.POST == method) {
			// post for json
			request = new HttpPost(url);
			StringEntity bodyParams = new StringEntity(JSON.toJSONString(params), HTTP.UTF_8);
			bodyParams.setContentType("application/json");
			((HttpPost) request).setEntity(bodyParams);

		} else if (HttpMethod.POST_TEXT == method) {
			// post for text
			request = new HttpPost(url);
			StringEntity bodyParams = this.postForNormal();
			((HttpPost) request).setEntity(bodyParams);
		} else if (HttpMethod.POST_FORM == method) {
			// post form
			request = new HttpPost(url);
			List<NameValuePair> nvps = new ArrayList<NameValuePair>();
			for (String key : params.keySet()) {
				nvps.add(new BasicNameValuePair(key, params.get(key)==null?params.get(key).toString():""));
			}
			((HttpPost) request).setEntity(new UrlEncodedFormEntity(nvps, "utf8"));
		} else if (HttpMethod.MULTI_FORM == method) {
			request = new HttpPost(url);
			InputStreamEntity inEntity = new InputStreamEntity(inputStream, ContentType.APPLICATION_OCTET_STREAM);
			inEntity.setChunked(true);
			inEntity.setContentType("application/octet-stream");
			((HttpPost) request).setEntity(inEntity);
		} else if(HttpMethod.DELETE ==method){
			request = new HttpDelete(url);
		} else {
			throw new RuntimeException("没有指定http请求类型,eg:post,get");
		}
		return request;
	}

	public static String getQueryParameter(Map<String, Object> params) {
		StringBuilder queryBuilder = new StringBuilder();
		for (String key : params.keySet()) {
			if (queryBuilder.length() > 0) {
				queryBuilder.append("&");
			}
			queryBuilder.append(key).append("=").append(params.get(key)==null?params.get(key).toString():"");
		}
		return queryBuilder.toString();
	}

	private StringEntity postForNormal() throws UnsupportedEncodingException {
		List<NameValuePair> nvps = new ArrayList<NameValuePair>();

		StringBuilder args = new StringBuilder();
		Set<String> keySet = params.keySet();
		for (String key : keySet) {
			args.append(key).append("=").append(params.get(key)).append("&");
			nvps.add(new BasicNameValuePair(key, params.get(key)==null?params.get(key).toString():""));
		}

		logger.info("request params:" + args.toString());
		return new UrlEncodedFormEntity(nvps, HTTP.UTF_8);
	}

	/** https协议的初始化 */
	private void initClientForHttps(HttpClient httpClient) throws NoSuchAlgorithmException, KeyManagementException {
		SSLContext ctx = SSLContext.getInstance("SSL");
		X509TrustManager tm = new X509TrustManager() {
			@Override
			public void checkClientTrusted(X509Certificate[] xcs, String string) throws CertificateException {
			}

			@Override
			public void checkServerTrusted(X509Certificate[] xcs, String string) throws CertificateException {
			}

			@Override
			public X509Certificate[] getAcceptedIssuers() {
				return null;
			}
		};
		X509HostnameVerifier hostnameVerifier = new X509HostnameVerifier() {
			@Override
			public boolean verify(String arg0, SSLSession arg1) {
				return true;
			}

			@Override
			public void verify(String arg0, SSLSocket arg1) throws IOException {
			}

			@Override
			public void verify(String arg0, String[] arg1, String[] arg2) throws SSLException {
			}

			@Override
			public void verify(String arg0, X509Certificate arg1) throws SSLException {
			}
		};

		ctx.init(null, new TrustManager[] { tm }, null);
		SSLSocketFactory ssf = new SSLSocketFactory(ctx);
		ssf.setHostnameVerifier(hostnameVerifier);
		ClientConnectionManager ccm = httpClient.getConnectionManager();
		SchemeRegistry sr = ccm.getSchemeRegistry();
		sr.register(new Scheme("https", 443, ssf));
	}

	public static enum HttpMethod {
		POST("post"), GET("get"), POST_TEXT("post_text"), POST_FORM("post_form"), MULTI_FORM("multi_form"),PUT("put"),DELETE("delete");

		private String value;

		private HttpMethod(String value) {
			this.value = value;
		}

		public String getValue() {
			return value;
		}

		public void setValue(String value) {
			this.value = value;
		}

		public static HttpMethod getMethod(String value) {
			if (POST.getValue().equalsIgnoreCase(value)) {
				return POST;
			}

			if (GET.getValue().equalsIgnoreCase(value)) {
				return GET;
			}

			if (POST_TEXT.getValue().equalsIgnoreCase(value)) {
				return POST_TEXT;
			}

			if (POST_FORM.getValue().equalsIgnoreCase(value)) {
				return POST_FORM;
			}

			if (MULTI_FORM.getValue().equalsIgnoreCase(value)) {
				return MULTI_FORM;
			}
			if(DELETE.getValue().equals(value)){
				return DELETE;
			}

			throw new RuntimeException("error input method value is wrong!");
		}
	}
}
