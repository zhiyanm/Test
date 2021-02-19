# 534_Project <img src="https://travis-ci.com/monajmn/534_Project.svg?token=G347jxEyxjdRpisspMiR&branch=master">

DATA 534 Project - R package wrapped with Weather query REST API 

Team members: Mona Jia, Zhiyan Ma


## Package Description

This is a R package wrapped with a weather query API which support functions: 
current weather query, five days' weather forecast, 
current weather list for cities with same name, and five days' historical weather query.

### Function 1 - Five Days' Weather Forecast

Five Days Weather Forecast function is available at any location or city, 
user can input city name and country code (optionally) to get weather forecasts for this city 
for five days including its weather description, temperature in Celsius, 
felt air temperature in Celsius and air humidity.

__Sample Input__

	fiveDay("vancouver")
	fiveDay("vancouver, ca")
	fiveDay("Vancouver, CA")
	fiveDay("VANCOUVER, CA")

__Sample Output__

	Location:       Vancouver CA 

	Date:           2021-02-19 09:00:00 
	Weather:        Rain 
	Tempreture(C):  3.71 
	Feels Like(C):  0.14 
	Humidity:       94 %

	Date:           2021-02-20 09:00:00 
	Weather:        Clouds 
	Tempreture(C):  3.31 
	Feels Like(C):  -0.26 
	Humidity:       94 %

	Date:           2021-02-21 09:00:00 
	Weather:        Rain 
	Tempreture(C):  3.92 
	Feels Like(C):  -1.23 
	Humidity:       94 %

	Date:           2021-02-22 09:00:00 
	Weather:        Rain 
	Tempreture(C):  8.54 
	Feels Like(C):  3.71 
	Humidity:       92 %

	Date:           2021-02-23 09:00:00 
	Weather:        Clear 
	Tempreture(C):  3.79 
	Feels Like(C):  -4.12 
	Humidity:       66 %


### Function 2 - Current Weather Query

Current Weather Query function is available at any location or city, user can input city name and country code (optionally) to get the current weather description for this city including current date and time, its weather description, temperature in Celsius/Fahrenheit/Kelvin, felt air temperature in Celsius/Fahrenheit/Kelvin, pressure value, air humidity, current visibility and current wind speed.

__Sample Input__

	current("coquitlam")
	current("coquitlam, ca")
	current("Coquitlam, CA")
	current("COQUITLAM, CA")

__Sample Output__

	City:           Coquitlam 
	Date:           2021-02-19 16:12:38 CST 
 
	Weather:        Rain 
	Tempreture(C):  2.4 
	Feels Like(C):  0.1 
	Tempreture(F):  36.4 
	Feels Like(F):  32.2 
	Tempreture(K):  275.6 
	Feels Like(K):  273.3 
	Pressure:       1015 hPa 
	Humidity:       100 % 
	Visibility:     1678 ft 
	Wind Speed:     1.03 m/



### Function 3 - Five Days' Historical Weather Query

Placeholder

Placeholder

__Sample Input__

	Placeholder

__Sample Output__

	Placeholder
	
	
	
### Function 4 - Search Weather

Placeholder

Placeholder

__Sample Input__

	Placeholder

__Sample Output__


	Placeholder


