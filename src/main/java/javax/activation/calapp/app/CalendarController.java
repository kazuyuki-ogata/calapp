package javax.activation.calapp.app;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("cal")
public class CalendarController {

	@RequestMapping(method = RequestMethod.GET)
	public String show(Model model) {
		return "cal/index";
	}

}
