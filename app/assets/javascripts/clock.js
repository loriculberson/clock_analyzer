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
  const minutesInDegrees = parseInt(minutes) * 6;
  const hoursInDegrees = ((parseInt(hours)% 12) / 12) * 360 + 90 + minutes / 12;
  const hourSelector = document.querySelector('#hour');
  const minuteSelector = document.querySelector('#minute');
  hourSelector.style.transform = "rotate(" + hoursInDegrees + "deg)";
  minuteSelector.style.transform = "rotate(" + minutesInDegrees + "deg)";
}

function addAngleTextToPage (time){
  $.ajax({
    url: '/index.json',
    data: {time: time},

    success: function(result){
      var resultsDiv = document.querySelector('.results');
      resultsDiv.innerHTML = ''; 
      var p = document.createElement("p");
      var redTime = ' <span class="red-text">' + result.time + '</span>';
      var redAngle = ' <span class="red-text">' + result.angle + '</span>';
      var pText = 'The time of ' + redTime + ' has a central angle of ' + redAngle + '&deg';

      resultsDiv.appendChild(p);
      p.innerHTML = pText;
    }
  });
}

function reset (){
  var resultsDiv = document.querySelector('.results');
  var timeField = document.querySelector('#timeField');
  var submitButton = document.querySelector('.submit');
  timeField.value = '';
  submitButton.disabled = true;
  submitButton.style.backgroundColor = "";
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

