package com.techelevator.npgeek;

import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.taglibs.standard.tag.common.core.ChooseTag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import com.techelevator.model.Park;
import com.techelevator.model.ParkDao;
import com.techelevator.model.Survey;
import com.techelevator.model.SurveyDao;
import com.techelevator.model.WeatherDao;


@Controller
public class parkController {
	
	@Autowired
	private ParkDao parkDao;
	
	@Autowired
	private SurveyDao SurveyDao;

	
	@Autowired
	private WeatherDao weatherDao;
	
	@Autowired
	private SurveyDao surveyDao;
	
	
	@RequestMapping(path="/",method=RequestMethod.GET)
	public String showPark(ModelMap modelHolder) {
		modelHolder.put("parks", parkDao.getAllParks());
		return "park";
	}

	@RequestMapping(path="/parkDetail/{parkCode}", method=RequestMethod.GET)
	public String showParkDetail(ModelMap modelHolder, @PathVariable String parkCode) {
		modelHolder.put("parks", parkDao.getParkByParkCode(parkCode));
		modelHolder.put("weatherList", weatherDao.getWeatherByParkCode(parkCode));
		return "parkDetail";
	}
	
	@RequestMapping(path="/parkDetail/{parkCode}", method=RequestMethod.POST)
	public String chooseTempScale(HttpSession session, @RequestParam Boolean isCelsius) {
		session.setAttribute("isCelsius", isCelsius);
		
		return "redirect:/parkDetail/{parkCode}";
	}
	

	@RequestMapping(path="/Survey",method=RequestMethod.GET)
	public String showSurveyPage() {
	return "survey";
	}
	
	@RequestMapping(path="/Survey", method=RequestMethod.POST)
	public String saveSurvey(@RequestParam String parkCode, @RequestParam String email, @RequestParam String state, @RequestParam String activitylevel) {
		
		Survey survey = new Survey();
		survey.setParkCode(parkCode);
		survey.setEmailAddress(email);
		survey.setState(state);
		survey.setActivityLevel(activitylevel);
		
		surveyDao.save(survey);
		
		return"redirect:/SurveyList";
	
	}
	@RequestMapping(path="/SurveyList")
	public String showSurveyResults(HttpServletRequest request) {
		
		List<Park> topParks = parkDao.getTopParks();
		request.setAttribute("topParks", topParks);
		
		return "surveyList";
	}
	
	@RequestMapping(path="/SurveyList", method=RequestMethod.GET)
	public String showSurveyResults(ModelMap modelHolder, String parkCode) {
		modelHolder.put("topParks", parkDao.getTopParks());
		modelHolder.put("parks", parkDao.getParkByParkCode(parkCode));
		modelHolder.put("parks", parkDao.getAllParks());
		
		
		return "surveyList";
		}
	


}
