package struts.enable;

public class TestDynamicMethodInvocation {

	
	public String save(){
		
		System.out.println("save...");
		return "success";
	}
	
	
	public String update(){
		System.out.println("update");
		return "success";
		
	}
	
}
