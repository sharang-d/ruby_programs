seconds_array = [979000000, 2158493738, 246144023, 1270166272, 1025600095]
for age_in_seconds in seconds_array
	seconds = age_in_seconds
	minutes = seconds/60 
	seconds %= 60
	hours = minutes/60
	minutes %= 60
	days = hours/24
	hours %= 24
	years = days/365
	days %= 365
	months = days/30
	days %= 30
	printf("%d seconds: I\'m %d years %d months %d days %d hours %d minutes %d seconds old\n",age_in_seconds,years,months,days,hours,minutes,seconds)
end
