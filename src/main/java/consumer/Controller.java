package consumer;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
public class Controller {
	
	
	private String url = "http://192.168.99.100:30007/SpringKube/employee";
	
	@RequestMapping( value="/consumeemp", method= RequestMethod.GET, produces = "application/json")
	public Employee employee() {
		RestTemplate template = new RestTemplate();
				
		Employee emp=template.getForObject(url, Employee.class);
		  return emp;
	}
	

}
