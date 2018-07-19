package com.techelevator.npgeek;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.model.ParkDao;
import com.techelevator.model.SurveyDao;
import com.techelevator.model.WeatherDao;


@Controller
public class parkController {
	@Autowired
	private ParkDao parkDao;
	@Autowired
	private WeatherDao weatherDao;
//	@Autowired
//	private SurveyDao surveyDao;
	
	
	@RequestMapping(path="/",method=RequestMethod.GET)
	public String showPark(ModelMap modelHolder) {
		modelHolder.put("parks", parkDao.getAllParks());
		return "park";
	}

	@RequestMapping(path="/parkDetail/{parkCode}", method=RequestMethod.GET)
	public String showParkDetail(ModelMap modelHolder, @PathVariable String parkCode) {
		modelHolder.put("parks", parkDao.getParkByParkCode(parkCode));
		//modelHolder.put("weather", weatherDao.getWeatherByParkCode(parkCode));
		return "parkDetail";
	}
	
}
