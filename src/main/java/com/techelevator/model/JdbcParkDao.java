package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Park getParkByParkName(String parkName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Park> getTopParks() {
		// TODO Auto-generated method stub
		return null;
	}
	
	private Park mapRowToPark(SqlRowSet results) {
		Park park = new Park();

		    park.setParkCode(results.getString("parkCode"));
		    park.setParkName(results.getString("parkName"));
		    park.setState(results.getString("state"));
		    park.setAcreage(results.getInt("acreage"));
		    park.setElevationInFeet(results.getInt("elevationInFeet"));
		    park.setMilesOfTrail(results.getInt("milesOfTrail"));
		    park.setNumberOfCampsites(results.getInt("numberOfCampsites"));
		    park.setClimate(results.getString("climate"));
		    park.setYearFounded(results.getInt("yearFounded"));
		    park.setAnnualVisitorCount(results.getInt("annualVisitorCount"));
		    park.setInspirationalQuote(results.getString("inspirationalQuote"));
		    park.setInspirationalQuoteSource(results.getString("inspirationalQuoteSource"));
		    park.setparkDescription(results.getString("parkDescription"));
		    park.setEntryFee(results.getInt("entryFee"));
		    park.setNumberOfAnimalSpecies(results.getInt("numberOfAnimalSpecies"));
		    park.setImageName(results.getString("imageName"));
		    
		    return park;
		}
}