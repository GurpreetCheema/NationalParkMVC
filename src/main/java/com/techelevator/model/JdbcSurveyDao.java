package com.techelevator.model;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

@Component
	public class JdbcSurveyDao implements SurveyDao {

		private JdbcTemplate jdbcTemplate;
		@Autowired
		public JdbcSurveyDao(DataSource dataSource) {
			this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
		
		@Override
		public void save(Survey survey) {
			String sqlInsertSurvey = "INSERT INTO survey_result (parkcode, emailaddress, state, activitylevel) VALUES (?, ?, ?, ?) RETURNING surveyid";
			int surveyId = jdbcTemplate.queryForObject(sqlInsertSurvey, int.class, survey.getParkCode(), survey.getEmailAddress(), survey.getState(), survey.getActivityLevel());
			
			survey.setSurveyId(surveyId);
		}
		

		
}

