package javax.activation.calapp.domain.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.activation.calapp.domain.model.Event;
import javax.activation.calapp.domain.repository.EventRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class CalService {

	private static final Map<String, String> eventMap = new HashMap<>();
	static {
		eventMap.put("birthday", "誕生日");
		eventMap.put("convention", "大会");
		eventMap.put("drink", "飲み会");
		eventMap.put("businessTrip", "出張");
		eventMap.put("barber", "床屋");
		eventMap.put("hospital", "病院");
		eventMap.put("eatingOut", "外食");
		eventMap.put("trip", "旅行");
		eventMap.put("other", "その他");
	}

	@Autowired
	EventRepository eventRepository;

	public List<Event> getUserEvents(Long userId) {
		return eventRepository.findByUserId(userId);
	}

	public String addEvent(Long userId, String title, String start, String detail) {
		Event event = new Event();
		event.setUserId(userId);
		event.setStart(Date.valueOf(start));
		event.setTitle(getEventName(title));
		event.setDetail(detail);
		eventRepository.save(event);
		return "success";
	}

	public String modEvent(Long userId, String eventId, String title, String start, String detail) {
		Event event = new Event();
		event.setEventId(Long.valueOf(eventId));
		event.setUserId(userId);
		event.setStart(Date.valueOf(start));
		event.setTitle(getEventName(title));
		event.setDetail(detail);
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

	private String getEventName(String eventKey) {
		return eventMap.containsKey(eventKey) ? eventMap.get(eventKey) : "その他";
	}

}
