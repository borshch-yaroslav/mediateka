package com.mediateka.controller;

import static com.mediateka.service.BookService.getBookById;
import static com.mediateka.service.BookService.getBookByState;
import static com.mediateka.service.EventService.getEventById;
import static com.mediateka.service.EventService.getEventsByDate;
import static com.mediateka.service.FormRecordService.saveFormRecord;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.mediateka.annotation.Controller;
import com.mediateka.annotation.Request;
import com.mediateka.comparator.BooksByName;
import com.mediateka.comparator.EventsByName;
import com.mediateka.form.FormRecordRegistrationForm;
import com.mediateka.model.Book;
import com.mediateka.model.Event;
import com.mediateka.model.FormRecord;
import com.mediateka.model.User;
import com.mediateka.model.enums.FormRecordGoal;
import com.mediateka.model.enums.State;
import com.mediateka.service.BookService;
import com.mediateka.service.UserService;
import com.mediateka.util.ObjectFiller;

@Controller
public class FormRecordController {

	private static Logger logger = Logger.getLogger(FormRecordController.class);
	@Request(url = "goToCreateFormRecord", method = "get")
	public static void goRoFormRecordCreateGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,
			SQLException, ReflectiveOperationException {

		request.getRequestDispatcher("pages/form/create_form_record.jsp")
				.forward(request, response);
	}

	@Request(url = "CreateFormRecord", method = "get")
	public static void formRecordCreateGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,
			SQLException, ReflectiveOperationException {
		Timestamp date = new Timestamp(new java.util.Date().getTime());
		List<Event> events = getEventsByDate(date);
		List<Event> activeEvents = new ArrayList<>();
		if (events != null) {
			for (Event event : events)
				if (event.getState() == State.ACTIVE)
					activeEvents.add(event);
		}

		if (events != null)
			Collections.sort(events, new EventsByName());
		Integer formId = null;
		try {
            formId = UserService.getUserById(Integer.parseInt(request.getParameter("userId").toString())).getFormId();
		} catch (NullPointerException e){
			logger.warn("trying to get formId of unexisted user", e);
		}
		request.setAttribute("formId", formId);
		request.setAttribute("events", activeEvents);
		request.getRequestDispatcher("pages/form/create_form_record.jsp")
				.forward(request, response);
		request.removeAttribute("books");
		request.removeAttribute("events");
	}

	@SuppressWarnings("deprecation")
	@Request(url = "CreateFormRecord", method = "post")
	public static void formRecordCreatePost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,
			SQLException, ReflectiveOperationException {
		StringBuilder message = new StringBuilder();
		boolean fail = false;

		FormRecordRegistrationForm form = new FormRecordRegistrationForm();
		ObjectFiller.fill(form, request);

		// form record userId valid
		if (form.getFormId() == null || form.getFormId() == "") {
			fail = true;
			message.append("User id is empty. ");
		} else {
			try {
				Integer formId = Integer.parseInt(form.getFormId());
				User user = UserService.getUserByFormId(formId);
				if (user == null)
					throw new NumberFormatException();
			} catch (NumberFormatException e) {
				fail = true;
				message.append("No such user. ");
			}
		}

		// form record timeTill valid
		Timestamp time = new Timestamp(new java.util.Date().getTime());
		int minute = -1;
		int hour = -1;
		if (form.getTimeTill() == null || form.getTimeTill() == "") {
			fail = true;
			message.append("Time is empty. ");
		} else {
			if (!timeValid(form.getTimeTill())) {
				fail = true;
				message.append("Time has illegal format. ");
			} else {
				String[] timeTill = form.getTimeTill().split(":");
				hour = Integer.parseInt(timeTill[0]);
				minute = Integer.parseInt(timeTill[1]);
				time.setHours(hour);
				time.setMinutes(minute);
			}
		}

		// form record goal valid
		if (form.getGoal() == null || form.getGoal() == "") {
			fail = true;
			message.append("Goal is empty. ");
		}

		// form record event, book, other at same time valid
		if ((form.getBook() == null && form.getEvent() == null && form
				.getOther() == null)
				|| (form.getBook() == "" && form.getEvent() == "" && form
						.getOther() == "")) {
			fail = true;
			message.append("Event, book and Other are all empty. ");
		}

		// form record book valid
		if (form.getGoal().equals("book") && form.getBook() == null&& form.getBook().equals("")) {
			fail = true;
			message.append("Book select is empty. ");
		}

		Integer bookId = null;
		if (form.getGoal().equals("book") && form.getBook() != null
				&& form.getBook() != "") {
			try {
				String libraryBookId = form.getBook();
				Book book = BookService.getBookByLibraryBookId(libraryBookId);
				if (book == null)
					throw new NumberFormatException();
				else
					bookId = book.getId();
			} catch (NumberFormatException e) {
				fail = true;
				message.append("Illegal book arguments. ");
			}
		}

		// form record event valid
		if (form.getGoal().equals("event") && form.getEvent() == null) {
			fail = true;
			message.append("Event select is empty. ");
		}

		Integer eventId = null;
		if (form.getGoal().equals("event") && form.getEvent() != null
				&& form.getEvent() != "") {
			try {
				int index = Integer.parseInt(form.getEvent());
				if (getEventById(index).getName() == null)
					throw new NumberFormatException();
				else
					eventId = index;
			} catch (NumberFormatException e) {
				fail = true;
				message.append("Illegal event arguments. ");
			}
		}

		// form record other valid
		if (form.getGoal().equals("other") && form.getOther() == null) {
			fail = true;
			message.append("Other type select is empty. ");
		}

		FormRecordGoal other = null;
		if (form.getGoal().equals("other") && form.getOther() != null
				&& form.getOther() != "") {
			try {
				int counter = 0;
				if (FormRecordGoal.valueOf(form.getOther()) != FormRecordGoal.INTERNET)
					counter++;
				if (FormRecordGoal.valueOf(form.getOther()) != FormRecordGoal.WI_FI)
					counter++;
				if (counter == 2)
					throw new IllegalArgumentException();
				other = FormRecordGoal.valueOf(form.getOther());
			} catch (IllegalArgumentException e) {
				fail = true;
				message.append("No such other type. ");
			}
		}

		if (!fail) {

			FormRecord record = new FormRecord();
			record.setUserId(UserService.getUserByFormId(Integer.parseInt(form.getFormId())).getId());
			record.setAdminId(Integer.parseInt(request.getSession()
					.getAttribute("userId").toString()));
			record.setDateFrom(new Timestamp(new java.util.Date().getTime()));
			record.setDateTill(time);
			if (form.getComment() != null && form.getComment() != "")
				record.setComment(form.getComment());
			if (bookId != null)
				record.setBookId(bookId);
			else if (eventId != null)
				record.setEventId(eventId);
			else if (other != null)
				record.setGoal(other);
			record.setState(State.ACTIVE);
			saveFormRecord(record);
			message.append("Form recod created. ");
		}

		Timestamp date = new Timestamp(new java.util.Date().getTime());
		List<Book> books = getBookByState(State.ACTIVE);
		List<Event> events = getEventsByDate(date);
		List<Event> activeEvents = new ArrayList<>();
		if (events != null) {
			for (Event event : events) {
				if (event.getState() == State.ACTIVE) {
					activeEvents.add(event);
				}
			}
			Collections.sort(events, new EventsByName());
		}
		if (books != null) {
			Collections.sort(books, new BooksByName());
		}

		request.setAttribute("books", books);
		request.setAttribute("events", activeEvents);
		request.setAttribute("message", message.toString());

		request.getRequestDispatcher("pages/form/create_form_record.jsp")
				.forward(request, response);

		request.removeAttribute("books");
		request.removeAttribute("events");
		request.removeAttribute("message");
	}

	private static boolean timeValid(String time) {
		boolean result = true;
		String[] array = time.split(":");
		try {
			int hour = Integer.parseInt(array[0]);
			int minute = Integer.parseInt(array[1]);
			if (hour > 23 || hour < 0 || minute > 59 || minute < 0)
				throw new NumberFormatException();
		} catch (NumberFormatException | ArrayIndexOutOfBoundsException e) {
			result = false;
		}
		return result;
	}
}