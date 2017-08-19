function timeValidator() {
  var timeField = document.querySelector('#timeField');
  var submitButton = document.querySelector('.submit');
  timeField.addEventListener('input', function(e) {
    var time = timeField.value;
    var pattern = new RegExp(/^(2[0-3]|[01]?[0-9]):([0-5][0-9])$/);
    if (pattern.test(time)) {
      timeField.classList.remove('invalid-time');
      timeField.classList.add('valid-time');
      submitButton.removeAttribute("disabled");
    } else {
      timeField.classList.remove('valid-time');
      timeField.classList.add('invalid-time');
    }
  });
}

