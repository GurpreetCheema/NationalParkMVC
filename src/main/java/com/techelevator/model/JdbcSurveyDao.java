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
//		@Override
//		public void save(Survey survey) {
//			// here we will save the result of survey into Database
//			//insert into result ( emailAddress, state, parkcode, activityLevel) VALUES (?,?,?,?)";
//		}
//		
		@Override
		public void save(Survey survey) {
			// TODO Auto-generated method stub
			
		}
		
}

