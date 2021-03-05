$(function() {
  $('#timepicker-input').timepicker({
    //timeFormat: 'h:mm p',
    interval: 60,
    minTime: '10',
    maxTime: '6:00pm',
    defaultTime: '11:00am',
    startTime: '10:00am',
    dynamic: true,
    dropdown: true,
    scrollbar: true
  });
});
