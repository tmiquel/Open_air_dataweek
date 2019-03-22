var mapid = L.map('mapid').setView([43.307827, 5.404262], 6);

L.tileLayer(
	'https://stamen-tiles-{s}.a.ssl.fastly.net/watercolor/{z}/{x}/{y}.{ext}', 
	{
		maxZoom: 20
		}).addTo(mapid);

