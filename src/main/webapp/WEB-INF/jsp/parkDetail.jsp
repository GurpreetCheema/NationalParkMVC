<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@include file="common/header.jspf"%>

<c:set var="pageTitle" value="${park.parkName} Details"/>

<c:url var="parksDetailPage" value="/parkDetail"/>

	<div class=clearfix>
		<c:url var="parksImgUrl" value="/img/parks/${parks.parkCodeLower}.jpg" />
		<c:url var="parkDetailPageUrl" value="/parkDetail/${parks.parkCode}"/>
		<img class="homeParks" src="${parksImgUrl}"/>
		<p class="parkName">${parks.parkName}</p>
		<br>
		<p>${parks.parkDescription}</p>
	 	<br/>
	</div>
<hr>
<br/>
<h3 class="quote">"<c:out value="${parks.inspirationalQuote}" />" --<c:out value="${parks.inspirationalQuoteSource}" /></h3>
<br/><hr/>
<br/>

<div class="table-width media-left">
	<p class="tableOfFacts">${parks.parkName} facts</p>
	<table class="table table-hover">
		<tr>
			<th>Acreage</th>
			<td><fmt:formatNumber type="number" value="${parks.acreage}" /> acres</td>
		</tr>
		<tr>
			<th>Elevation in Feet</th>
			<td><fmt:formatNumber type="number" value="${parks.elevationInFeet}" /> ft.</td>
		</tr>
		<tr>
			<th>Miles of Trail</th>
			<td><fmt:formatNumber type="number" value="${parks.milesOfTrail}" /> mi.</td>
		</tr>
		<tr>
			<th>Number of Campsites</th>
			<td><fmt:formatNumber type="number" value="${parks.numberOfCampsites}" /></td>
		</tr>
		<tr>
			<th>Climate</th>
			<td><c:out value="${parks.climate}" /></td>
		</tr>
		<tr>
			<th>Year Founded</th>
			<td><c:out value="${parks.yearFounded}"/></td>
		</tr>
		<tr>
			<th>Annual Visitor Count</th>
			<td><fmt:formatNumber type="number" value="${parks.annualVisitorCount}" /></td>
		</tr>
		<tr>
			<th>Number of Animal Species</th>
			<td><fmt:formatNumber type="number" value="${parks.numberOfAnimalSpecies}" /></td>
		</tr>
		<tr>
			<th>Entry Fee</th>
			<td><fmt:formatNumber type="currency" value="${parks.entryFee}" /></td>
		</tr>
	</table>
</div>


<div class="weather">
<c:set var="weather" value="${weatherList[0]}" />
<c:url var="weatherImg" value="/img/weather/${weather.forecast}.png" />
<c:choose>
	<c:when test="${isCelsius}">
		<c:set var="highTemp" value="${(weather.high - 32) / 1.8}" />
		<c:set var="lowTemp" value="${(weather.low - 32) / 1.8}" />
		<c:set var="tempScale" value="°C" />
	</c:when>
	<c:otherwise>
		<c:set var="highTemp" value="${weather.high}" />
		<c:set var="lowTemp" value="${weather.low}" />
		<c:set var="tempScale" value="°F" />

	</c:otherwise>
</c:choose>



<c:choose>
	<c:when test="${weather.forecast == 'snow'}">
			<div class="alert">
			<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
	  		<strong>Snow Warning!</strong> Be sure to pack snow shoes!.
			</div>
	</c:when>
	<c:when test="${weather.forecast == 'rain'}">
			<div class="alert warning">
  			<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  			<strong>Warning!</strong> Pack a raincoat and waterproof shoes today!
		</div>
	</c:when>
	<c:when test="${weather.forecast == 'thunderstorms'}">
		<<div class="alert warning">
  			<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  			<strong>Warning!</strong> seek shelter and avoid hiking on exposed ridges!
		</div>
	</c:when>
	<c:when test="${weather.forecast == 'sunny'}">
				<div class="alert warning">
  			<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  			<strong>Warning!</strong> Don't forget your sunblock today!
		</div>
	</c:when>
	<c:otherwise>
	</c:otherwise>
</c:choose>
<c:choose>
	<c:when test="${weather.high > 75}">
		<c:set var="tempMessage" value="Bring an extra gallon of water." />
		<div class="alert danger">
  			<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  			<strong>Warning!</strong>Temperature will increase today bring an extra galon of water!
		</div>
	</c:when>
	<c:when test="${weather.low < 20}">
		<c:set var="tempMessage" value="Be aware of dangerous, frigid temperatures." />
		<div class="alert danger">
  			<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  			<strong>Warning!</strong>Temperature will be dangerously low dress warm!
		</div>

	</c:when>
	<c:when test="${(weather.high - weather.low) > 20}">
		<c:set var="tempMessage" value="Wear breathable layers." />
		<div class="alert warning">
  			<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  			<strong>Warning!</strong>Temperature will vary today wear breathable layers!
		</div>
	</c:when>
	<c:when test="${weather.high > 75 && (weather.high - weather.low) > 20}">
		<div class="alert warning">
  			<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  			<strong>Warning!</strong>Temperature will vary today bring and extra gallon of water and wear breathable layers!
		</div>
	</c:when>
	<c:when test="${weather.low < 20 && (weather.high - weather.low) > 20}">
		<div class="alert danger">
  			<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  			<strong>Warning!</strong>Be aware of dangerous, frigid temperatures and wear breathable layers.
		</div>
	</c:when>
	<c:when test="${weather.low < 20 && weather.high > 75}">
		<c:set var="tempMessage" value="The weather sucks, prepare for anything." />
		<div class="alert danger">
  			<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  			<strong>Warning!</strong> The temperature will drastically change throughout the day prepare for anything!
		</div>
	</c:when>
	<c:otherwise>
		<c:set var="tempMessage" value="" />
	</c:otherwise>
</c:choose> 

<form method="POST" action="${actionUrl}">
	<select name="isCelsius">
		<option value="false" ${isCelsius ? '' : 'selected'}>Fahrenheit</option>
		<option value="true" ${isCelsius ? 'selected' : ''}>Celsius</option>
	</select>
	<input type="submit" name="submit" class="btn btn-success" value="Go"/>
</form>
</div>
<br/>


<div class="card-wrapper">

<section class="today">
<div></div>
	<h3>Today</h3>
	<c:choose>
	<c:when test="${weather.forecast == 'partly cloudy'}">
		<c:url var="weatherImg" value="/img/weather/partlyCloudy.png"/>
		<div class = "forecast">
			<img src="${weatherImg}" />
				<p>High: <fmt:formatNumber maxFractionDigits="0" value="${highTemp}" /><c:out value="${tempScale}" /></p><br>
				<p>Low: <fmt:formatNumber maxFractionDigits="0" value="${lowTemp}" /><c:out value="${tempScale}" /></p>
		</div>
	</c:when>
	<c:when test="${weather.forecast == 'cloudy'}">
		<c:url var="weatherImg" value="/img/weather/cloudy.png"/>
		<div class = "forecast">
			<img src="${weatherImg}" />
			<p>High: <fmt:formatNumber maxFractionDigits="0" value="${highTemp}" /><c:out value="${tempScale}" /></p><br>
		<p>Low: <fmt:formatNumber maxFractionDigits="0" value="${lowTemp}" /><c:out value="${tempScale}" /></p>
		</div>
	</c:when>
	<c:when test="${weather.forecast == 'rain'}">
		<c:url var="weatherImg" value="/img/weather/rain.png"/>
		<div class = "forecast">
			<img src="${weatherImg}" />
			<p>High: <fmt:formatNumber maxFractionDigits="0" value="${highTemp}" /><c:out value="${tempScale}" /></p><br>
		<p>Low: <fmt:formatNumber maxFractionDigits="0" value="${lowTemp}" /><c:out value="${tempScale}" /></p>
		</div>
	</c:when>
	<c:when test="${weather.forecast == 'snow'}">
		<c:url var="weatherImg" value="/img/weather/snow.png"/>
		<div class = "forecast">
			<img src="${weatherImg}" />
			<p>High: <fmt:formatNumber maxFractionDigits="0" value="${highTemp}" /><c:out value="${tempScale}" /></p><br>
		<p>Low: <fmt:formatNumber maxFractionDigits="0" value="${lowTemp}" /><c:out value="${tempScale}" /></p>
		</div>
	</c:when>
	<c:when test="${weather.forecast == 'sunny'}">
		<c:url var="weatherImg" value="/img/weather/sunny.png"/>
		<div class = "forecast">
			<img src="${weatherImg}" />
			<p>High: <fmt:formatNumber maxFractionDigits="0" value="${highTemp}" /><c:out value="${tempScale}" /><p><br>
		<p>Low: <fmt:formatNumber maxFractionDigits="0" value="${lowTemp}" /><c:out value="${tempScale}" /></p>
		</div>
	</c:when>
	<c:when test="${weather.forecast == 'thunderstorms'}">
		<c:url var="weatherImg" value="/img/weather/thunderstorms.png"/>
		<div class = "forecast">
			<img src="${weatherImg}" />
			<p>High: <fmt:formatNumber maxFractionDigits="0" value="${highTemp}" /><c:out value="${tempScale}" /></p><br>
		<p>Low: <fmt:formatNumber maxFractionDigits="0" value="${lowTemp}" /><c:out value="${tempScale}" /></p>
		</div>
	</c:when>
	</c:choose>
</section>

<c:forEach varStatus="loop" var="weather" items="${weatherList}" begin="1">
<section>
<br><br>
	<c:set var="weather" value="${weatherList[loop.index]}" />
	<c:choose>
			<c:when test="${isCelsius}">
				<c:set var="highTemp" value="${(weather.high - 32) / (5/9)}" />
				<c:set var="lowTemp" value="${(weather.low - 32) / (5/9)}" />
				<c:set var="tempScale" value="°C" />
			</c:when>
			<c:otherwise>
				<c:set var="highTemp" value="${weather.high}" />
				<c:set var="lowTemp" value="${weather.low}" />
				<c:set var="tempScale" value="°F" />
			</c:otherwise>
		</c:choose>

<c:choose>
	<c:when test="${weather.forecast == 'partly cloudy'}">
		<c:url var="weatherImg" value="/img/weather/partlyCloudy.png"/>
			<img src="${weatherImg}" />
			<p>High: <fmt:formatNumber maxFractionDigits="0" value="${highTemp}" /><c:out value="${tempScale}" /></p><br>
		<p>Low: <fmt:formatNumber maxFractionDigits="0" value="${lowTemp}" /><c:out value="${tempScale}" /></p>
		</c:when>
	<c:otherwise>
	<c:url var="weatherImg" value="/img/weather/${weather.forecast}.png" />
		<img src="${weatherImg}" />
		<p>High: <fmt:formatNumber maxFractionDigits="0" value="${highTemp}" /><c:out value="${tempScale}" /></p><br>
		<p>Low: <fmt:formatNumber maxFractionDigits="0" value="${lowTemp}" /><c:out value="${tempScale}" /></p>
	</c:otherwise>
	</c:choose>
</section>
</c:forEach>
</div>



<%@include file="common/footer.jspf"%>