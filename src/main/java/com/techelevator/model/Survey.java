package com.techelevator.model;

public class Survey {

		private int surveyId;
		private String parkCode;
		private String state;
		private String emailAddress;
		private String activityLevel;
		private String parkName;
		
		
		
		public String getParkName() {
			return parkName;
		}
		public int getSurveyId() {
			return surveyId;
		}
		public void setSurveyId(int surveyId) {
			this.surveyId = surveyId;
		}
		public String getParkCode() {
			return parkCode;
		}
		public void setParkCode(String parkCode) {
			this.parkCode = parkCode;
		}
		public String getState() {
			return state;
		}
		public void setState(String state) {
			this.state = state;
		}
		public String getEmailAddress() {
			return emailAddress;
		}
		public void setEmailAddress(String emailAddress) {
			this.emailAddress = emailAddress;
		}
		public String getActivityLevel() {
			return activityLevel;
		}
		public void setActivityLevel(String activityLevel) {
			this.activityLevel = activityLevel;
		}
		public void setParkName(String parkName) {
			this.parkName = parkName;
		}
		

	}
