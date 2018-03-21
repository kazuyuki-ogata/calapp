package javax.activation.calapp.domain.service;

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

}
