package javax.activation.calapp.app;

import java.util.List;

import javax.activation.calapp.domain.model.Event;
import javax.activation.calapp.domain.service.CalService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api")
public class CalendarApiController {

	@Autowired
	CalService calService;

	@RequestMapping(value = "/events", consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Event> getAllEvents() {
		return calService.getUserEvents(1L);
	}

	@RequestMapping(value = "/events/add")
	@ResponseBody
	public String addEvent(@RequestParam String title, @RequestParam String start, @RequestParam String detail) {
		return calService.addEvent(1L, title, start, detail);
	}

	@RequestMapping(value = "/events/mod")
	@ResponseBody
	public String modEvent(@RequestParam String eventId, @RequestParam String title, @RequestParam String start, @RequestParam String detail) {
		return calService.modEvent(1L, eventId, title, start, detail);
	}

	@RequestMapping(value = "/events/del")
	@ResponseBody
	public String modEvent(@RequestParam String eventId) {
		return calService.delEvent(1L, eventId);
	}
}
