package com.techelevator.npgeek;

public class weather {
	private int fiveDayForecast ;
	private int low;
	private int high;
	private String forecast;
	
	
	public int getfiveDayForecast() {
		return fiveDayForecast;
	}
	public void setfiveDayForecast(int fiveDayForecast) {
		this.fiveDayForecast = fiveDayForecast;
	}
	public int getLow() {
		return low;
	}
	public void setLow(int low) {
		this.low = low;
	}
	public int getHigh() {
		return high;
	}
	public void setHigh(int high) {
		this.high = high;
	}
	public String getForecast() {
		return forecast;
	}
	public void setForecast(String forecast) {
		this.forecast = forecast;
	}

}
