function timeValidator() {
  var submitButton = document.querySelector('.submit');
  var timeField = document.querySelector('#timeField');
  timeField.addEventListener('input', function(e) {
    var time = timeField.value;
    if (PATTERN.test(time)) {
      timeField.classList.remove('invalid-time');
      timeField.classList.add('valid-time');
      submitButton.removeAttribute("disabled");
      submitButton.style.backgroundColor = "#2e9187";
    } else {
      timeField.classList.remove('valid-time');
      timeField.classList.add('invalid-time');
    }
  });
}
