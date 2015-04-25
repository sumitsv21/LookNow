# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class RichMarkerBuilder extends Gmaps.Google.Builders.Marker

@buildMap = (markers)->
	handler = Gmaps.build('Google', { markers: { maxRandomDistance: 300 }, builders: { Marker: RichMarkerBuilder} })

	handler.buildMap { provider: { maxZoom: 18, minZoom: 8 }, internal: {id: 'map'} }, ->
	  markers = handler.addMarkers(markers)
	  handler.bounds.extendWith(markers)
	  handler.fitMapToBounds()