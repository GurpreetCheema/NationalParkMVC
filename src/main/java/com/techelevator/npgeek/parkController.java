package com.techelevator.npgeek;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	

	@RequestMapping(path="/Survey",method=RequestMethod.GET)
	public String showSurveyPage() {
//		if ( modelHolder.containsAttribute("survey")) {
//			modelHolder.put("survey",new Survey());
	return "survey";
	}
//	
//@RequestMapping(path="/survey", method=RequestMethod.POST)
//public String processSurvey(@ModelAttribute Survey newSurvey, BindingResult result, RedirectAttributes flash) {
//flash.addFlashAttribute("survey", newSurvey);
//if (result.hasErrors()) {
//
//flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "survey", result);
//
//return "redirect:/survey";
//
//}
//surveyDao.savesurveyResult(newSurvey);
//return "redirect:/confirmation";
//
//}

//@RequestMapping(value = "/test", method = RequestMethod.GET)
//public String test(@ModelAttribute("exampleForm") final ExampleForm exampleForm, final Model model)
//{
//    return "test";
//}


//@RequestMapping(value = "/user/create", method = RequestMethod.POST)
//public String doCreate(@ModelAttribute("user") @Valid User user, BindingResult result, RedirectAttributes rA){
//
//  if(result.hasErrors()){
//      rA.addFlashAttribute("result", result);
//      rA.addFlashAttribute("user", user);
//
//      return "redirect:/user";
//  }
//
//  return "redirect:/user/success";
//}







}
