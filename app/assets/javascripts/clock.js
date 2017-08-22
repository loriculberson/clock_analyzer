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

function addAngleTextToPage (time){
  $.ajax({
    url: '/index.json',
    data: {time: time},

    success: function(result){
      var resultsDiv = document.querySelector('.results');
      resultsDiv.innerHTML = ''; 
      var h4 = document.createElement("h4");
      var p = document.createElement("p");
      var h4Text = "Angle difference between the hour and minute hand is:"
      var pText = "The time of " + result.time + " has an angle of " + result.angle + " degrees"

      resultsDiv.appendChild(h4);
      resultsDiv.appendChild(p);
      h4.textContent = h4Text;
      p.textContent = pText;
    }
  });
}

function reset (){
  var resultsDiv = document.querySelector('.results');
  var timeField = document.querySelector('#timeField');
  var submitButton = document.querySelector('.submit');
  timeField.value = '';
  submitButton.disabled = true;
  timeField.classList.remove('valid-time');
}

function setupSubmitButtonToMoveClock() {
  var timeField = document.querySelector('#timeField');
  var submitButton = document.querySelector('.submit');
  submitButton.addEventListener('click', function (e) {
    e.preventDefault();
    var time = timeField.value;
    var parsedTime = parseTime();
    var hours = parsedTime.hours;
    var minutes = parsedTime.minutes;
    moveClock(hours, minutes);
    addAngleTextToPage(time);
    reset();
  })
}

