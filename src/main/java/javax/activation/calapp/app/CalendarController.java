package javax.activation.calapp.app;

import java.util.List;

import javax.activation.calapp.domain.model.Event;
import javax.activation.calapp.domain.service.CalService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("cal")
public class CalendarController {

	@Autowired
	CalService calService;

	@RequestMapping(method = RequestMethod.GET)
	public String test(Model model) {
		List<Event> list = calService.getUserEvents(1L);
		System.out.println(list);
		model.addAttribute("name", "API");
		model.addAttribute("get", "GET /cal");
		model.addAttribute("post", "POST /cal");
		return "cal/index";
	}

}
