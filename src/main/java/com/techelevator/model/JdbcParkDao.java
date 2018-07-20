package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JdbcParkDao implements ParkDao{
private JdbcTemplate jdbcTemplate;


	@Autowired
	public JdbcParkDao(DataSource dataSource){
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	
	
	@Override
	public List<Park> getAllParks() {
		List<Park> parks = new ArrayList<Park>();
		String sqlSelectAllParks = "SELECT * FROM park ORDER BY parkCode";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllParks);
		while(results.next()) {
		parks.add(mapRowToPark(results));
		}
		return parks;
	}

	@Override
	public Park getParkByParkCode(String parkCode) {
		String statement = "SELECT * FROM park WHERE parkcode = ?";
		SqlRowSet result = jdbcTemplate.queryForRowSet(statement, parkCode);
		Park currentPark = null;
		if(result.next()) {
			currentPark = mapRowToPark(result);
		}
		return currentPark;
	}

	@Override
	public Park getParkByParkName(String parkName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Park> getTopParks() {
List<Park> topParks = new ArrayList<Park>();
		
		String sqlGetTopSurveys =  "SELECT survey_result.parkcode, park.*, COUNT(survey_result.parkcode) as count FROM survey_result " +
								   "JOIN park ON park.parkCode = survey_result.parkcode " +
								   "GROUP BY survey_result.parkcode, park.parkCode " +
								   "ORDER BY count desc, survey_result.parkcode "+
								   "LIMIT 5";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetTopSurveys);
		while(results.next()){
			Park park = mapRowToPark(results);
			park.setCount(results.getInt("count"));
			topParks.add(park);
		}
		
		return topParks;
	
	}
	
	private Park mapRowToPark(SqlRowSet results) {
		Park park = new Park();

		    park.setParkCode(results.getString("parkcode"));
		    park.setParkName(results.getString("parkname"));
		    park.setState(results.getString("state"));
		    park.setAcreage(results.getInt("acreage"));
		    park.setNumberOfCampsites(results.getInt("numberofCampsites"));
		    park.setClimate(results.getString("climate"));
		    park.setYearFounded(results.getInt("yearFounded"));
		    park.setAnnualVisitorCount(results.getInt("annualVisitorCount"));
		    park.setInspirationalQuote(results.getString("inspirationalQuote"));
		    park.setInspirationalQuoteSource(results.getString("inspirationalQuoteSource"));
		    park.setparkDescription(results.getString("parkDescription"));
		    park.setEntryFee(results.getInt("entryFee"));
		    park.setNumberOfAnimalSpecies(results.getInt("numberOfAnimalSpecies"));

		    
		    return park;
		}
}