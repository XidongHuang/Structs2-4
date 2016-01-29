package javaweb.struts;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.util.ValueStack;

public class Product implements RequestAware, SessionAware{
	
	private Integer productId;
	private String productName;
	private String productDesc;
	
	private double productPrice;

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductDesc() {
		return productDesc;
	}

	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}

	public double getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(double productPrice) {
		this.productPrice = productPrice;
	}

	@Override
	public String toString() {
		return "Product [productId=" + productId + ", productName=" + productName + ", productDesc=" + productDesc
				+ ", productPrice=" + productPrice + "]";
	}
	
	
	public String save(){
		System.out.println("save:" + this);
		
		//1. Gain stack
		ValueStack valueStack = ActionContext.getContext().getValueStack();
		
		//2. Create a Test Object, and add attribute 
		Test test = new Test();
		test.setProductDesc("AABBCCDD");
		test.setProductName("ABCD");
		
		
		//3. Put the Test Object into the stack
		valueStack.push(test);
		
		sessionMap.put("product", this);
		requestMap.put("test", test);
		
		int i = 1/0;
		
		
		return "success";
		
	}

	private Map<String, Object> sessionMap;
	
	@Override
	public void setSession(Map<String, Object> arg0) {

		this.sessionMap = arg0;
	}

	private Map<String, Object> requestMap;
	
	@Override
	public void setRequest(Map<String, Object> arg0) {

		this.requestMap = arg0;
	}
	
	
	private List<Person> persons = new ArrayList<Person>();
	
	public List<Person> getPersons() {
		return persons;
	}
	
	public String testTag(){
		
		this.productId = 1001;
		this.productDesc = "CPU";
		this.productName = "Intel";
		this.productPrice = 1000;
		
		
		persons.add(new Person("CCC",33));
		persons.add(new Person("DDD",44));
		persons.add(new Person("EEE",55));
		persons.add(new Person("BBB",22));
		persons.add(new Person("AAA",11));
		
		return "success";
		
	}
	
	
	
}
