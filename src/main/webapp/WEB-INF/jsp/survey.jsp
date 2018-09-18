<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="common/header.jspf"%>


<c:url var="submitSurvey" value="/Survey" />
<h1>
	<center>Daily Survey
</h1>
</center>
<br>

<div class="formForSurvey">
	<form action="${submitSurvey}" method="POST">
		<br> <label for="favoritePark">Favorite National Park</label><br>
		<select name="parkCode" required>
			<option value="GNP">Glacier National Park</option>
			<option value="GCNP">Grand Canyon National Park</option>
			<option value="GTNP">Grand Teton National Park</option>
			<option value="MRNP">Mount Rainier National Park</option>
			<option value="GSMNP">Great Smoky Mountains National Park</option>
			<option value="ENP">Everglades National Park</option>
			<option value="YNP">Yellowstone National Park</option>
			<option value="YNP2">Yosemite National Park</option>
			<option value="CVNP">Cuyahoga Valley National Park</option>
			<option value="RMNP">Rocky Mountain National Park</option>

		</select><br>

		<div class="formGroup">
			<label for="email"> Enter your E-mail address:</label><br> <input
				type="text" name="email" id="email" required />
		</div>

		<p>
			<label for="state">State: </label> <br> <select name="state"
				id="state">
				<option value="AL">Alabama</option>
				<option value="AK">Alaska</option>
				<option value="AZ">Arizona</option>
				<option value="AR">Arkansas</option>
				<option value="CA">California</option>
				<option value="CO">Colorado</option>
				<option value="CT">Connecticut</option>
				<option value="DE">Delaware</option>
				<option value="DC">District Of Columbia</option>
				<option value="FL">Florida</option>
				<option value="GA">Georgia</option>
				<option value="HI">Hawaii</option>
				<option value="ID">Idaho</option>
				<option value="IL">Illinois</option>
				<option value="IN">Indiana</option>
				<option value="IA">Iowa</option>
				<option value="KS">Kansas</option>
				<option value="KY">Kentucky</option>
				<option value="LA">Louisiana</option>
				<option value="ME">Maine</option>
				<option value="MD">Maryland</option>
				<option value="MA">Massachusetts</option>
				<option value="MI">Michigan</option>
				<option value="MN">Minnesota</option>
				<option value="MS">Mississippi</option>
				<option value="MO">Missouri</option>
				<option value="MT">Montana</option>
				<option value="NE">Nebraska</option>
				<option value="NV">Nevada</option>
				<option value="NH">New Hampshire</option>
				<option value="NJ">New Jersey</option>
				<option value="NM">New Mexico</option>
				<option value="NY">New York</option>
				<option value="NC">North Carolina</option>
				<option value="ND">North Dakota</option>
				<option value="OH">Ohio</option>
				<option value="OK">Oklahoma</option>
				<option value="OR">Oregon</option>
				<option value="PA">Pennsylvania</option>
				<option value="RI">Rhode Island</option>
				<option value="SC">South Carolina</option>
				<option value="SD">South Dakota</option>
				<option value="TN">Tennessee</option>
				<option value="TX">Texas</option>
				<option value="UT">Utah</option>
				<option value="VT">Vermont</option>
				<option value="VA">Virginia</option>
				<option value="WA">Washington</option>
				<option value="WV">West Virginia</option>
				<option value="WI">Wisconsin</option>
				<option value="WY">Wyoming</option>
			</select>
		</p>

		<label for="activitylevel">Activity Level</label><br> <input
			type="radio" name="activitylevel" value="Active" required>
		Active <input type="radio" name="activitylevel" value="Inactive">
		Inactive <input type="radio" name="activitylevel" value="Sedentary">
		Sedentary <input type="radio" name="activitylevel" value="Extraactive">
		Extra Active <br> 
		
		<input class="formSubmitButton" type="submit"
			value="Submit" />

	</form>
</div>
<%@include file="common/footer.jspf"%>