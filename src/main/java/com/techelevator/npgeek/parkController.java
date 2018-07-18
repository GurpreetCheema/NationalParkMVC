package com.techelevator.npgeek;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.techelevator.model.ParkDao;


@Controller
public class parkController {
	@Autowired
	private ParkDao parkDao;
	
	
	@RequestMapping(path="/",method=RequestMethod.GET)
	public String showPark(ModelMap modelHolder) {
		return "park";
	}

	@RequestMapping(path="/", method=RequestMethod.GET)
	public String showParkImage(ModelMap modelHolder) {
		modelHolder.put("parks", parkDao.getAllParks());
		
		return "/park";
	}

	@RequestMapping(path="/park", method=RequestMethod.GET)
	public String showparkImage() {
		return "/park";
	}
}
