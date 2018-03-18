package javax.activation.calapp.app;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("cal")
public class CalendarController {

	@RequestMapping(method = RequestMethod.GET)
	public String test(Model model) {
		model.addAttribute("name", "API");
		model.addAttribute("get", "GET /cal");
		model.addAttribute("post", "POST /cal");
		return "cal/index";
	}

}
