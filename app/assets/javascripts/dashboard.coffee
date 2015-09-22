# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class Log
  _toggleClass = 'log--update'
  fetch = (location_id) ->
    xhr = new XMLHttpRequest()
    url = "http://#{location.host}/api/v1/logs.json";

    xhr.open('GET' , url, false)
    xhr.send(null)

    if xhr.status == 200
      logs = JSON.parse xhr.responseText
      for value, key in logs
        if value.location.id == location_id
          return value
    else
      false
    return

  render = (log, location_id) ->
    $log = document.querySelectorAll("[data-location-id='#{location_id}']")[0]

    $log.classList.add _toggleClass

    $log.querySelector('.temperature').innerText = log.temperature.value
    $log.querySelector('.humidity').innerText = log.humidity.value
    $log.querySelector('.atmosphere').innerText = log.atmosphere.value
    $log.querySelector('.updated_at').innerText = log.updated_at.replace('.000', '').replace('T', ' ')

    setTimeout ->
      $log.classList.remove _toggleClass
    , 2000
    return

  update: (location_id) ->
    log = fetch.call @, location_id
    render.call @, log, location_id
    return

$(document).on 'page:change', ->
  log = new Log

  dispatcher = new WebSocketRails("ws://#{location.host}/websocket")
  channel = dispatcher.subscribe('streaming')

  channel.bind 'update', (location_id) ->
    log.update location_id
  return