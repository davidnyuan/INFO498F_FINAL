----------
Keep this instructions so everyone can see them.
- Summarise what your graph is telling
- Include any relevant information (time span, etc)
- Include any code used to help determine how to display the data.  For example:
	```
	data %>% group_by(x) %>% summarise(n = n() %>% filter(n > 30)
	```
	Was used to determine which diseases I should allow users to specify in my select menu
- Keep it short.  A summary for each of the five graphs will be displayed on one page in the More tab on Shiny
----------

Monitoring Site Locations
=========================

This is a map of all of the monitoring locations of coral reefs throughout the world. The water depth of the individual sites is coded in the color of the marker, and when hovering over individual points you can see the name of the monitoring site, and the name of the organization monitoring the site. Some of the locations in the original data set lacked coordinates, and those are omitted in the map.