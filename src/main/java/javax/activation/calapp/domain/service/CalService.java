package javax.activation.calapp.domain.service;

import java.sql.Date;
import java.util.List;

import javax.activation.calapp.domain.model.Event;
import javax.activation.calapp.domain.repository.EventRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class CalService {

	@Autowired
	EventRepository eventRepository;

	public List<Event> getUserEvents(Long userId) {
		return eventRepository.findByUserId(userId);
	}

	public String addEvent(Long userId, String title, String start) {
		Event event = new Event();
		event.setUserId(userId);
		event.setStart(Date.valueOf(start));
		event.setTitle(title);
		eventRepository.save(event);
		return "success";
	}

	public String modEvent(Long userId, String eventId, String title, String start) {
		Event event = new Event();
		event.setEventId(Long.valueOf(eventId));
		event.setUserId(userId);
		event.setStart(Date.valueOf(start));
		event.setTitle(title);
		eventRepository.save(event);
		return "success";
	}

	public String delEvent(Long userId, String eventId) {
		Event event = new Event();
		event.setEventId(Long.valueOf(eventId));
		event.setUserId(userId);
		eventRepository.delete(event);
		return "success";
	}

}
