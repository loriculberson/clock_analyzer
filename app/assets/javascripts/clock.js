function parseTime() {
  var timeField = document.querySelector('#timeField');
  var time = timeField.value;
  var hours = time.match(PATTERN)[1];
  var minutes = time.match(PATTERN)[2];
  return {
    minutes: minutes, 
    hours: hours
  };
}

function moveClock (hours, minutes){
  var minutes = parseInt(minutes) * 6;
  var hours = ((parseInt(hours)% 12) / 12) * 360 + 90 + minutes / 12;
  hourSelector = document.querySelector('#hour');
  minuteSelector = document.querySelector('#minute');
  hourSelector.style.transform = "rotate(" + hours + "deg)";
  minuteSelector.style.transform = "rotate(" + minutes + "deg)";
}

function setupSubmitButtonToMoveClock() {
  var submitButton = document.querySelector('.submit');
  submitButton.addEventListener('click', function (e) {
    e.preventDefault();
    var parsedTime = parseTime();
    var hours = parsedTime.hours;
    var minutes = parsedTime.minutes;
    moveClock(hours, minutes);
  })
}

