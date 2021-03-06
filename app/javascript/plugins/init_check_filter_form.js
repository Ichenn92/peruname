const initCheckFilterForm = () => {
  const date_dom = document.getElementById("date");
  const startTime_dom = document.getElementById("performance_availability_start_time_4i");
  const endTime_dom = document.getElementById("performance_availability_end_time_4i");
  const submit_dom = document.getElementById("btn-submit-filter");

  const inputsIsInvalid = () => {
    submit_dom.classList.add("disable");
    submit_dom.classList.add("disabled");
    startTime_dom.classList.remove("is-valid");
    date_dom.classList.remove("is-valid");
    endTime_dom.classList.remove("is-valid");
    date_dom.classList.add("is-invalid");
    startTime_dom.classList.add("is-invalid");
    endTime_dom.classList.add("is-invalid");
  };

  const inputsIsValid = () => {
    startTime_dom.classList.remove("is-invalid");
    endTime_dom.classList.remove("is-invalid");
    date_dom.classList.remove("is-invalid");
    startTime_dom.classList.add("is-valid");
    endTime_dom.classList.add("is-valid");
    date_dom.classList.add("is-valid");
    submit_dom.classList.remove("disable");
    submit_dom.classList.remove("disabled");
  };

  const checkFields = () => {
    const duration = parseInt(endTime_dom.value, 10) - parseInt(startTime_dom.value, 10);
    console.log(new Date(date_dom.value) - new Date());
    console.log(new Date());
    if (duration > 0 && (new Date(date_dom.value) > new Date())) {
      inputsIsValid();
  } else {
      inputsIsInvalid();
    }
  };

  if (startTime_dom && endTime_dom && submit_dom) {
    startTime_dom.addEventListener("change", (e) => {
      checkFields();
    });
    endTime_dom.addEventListener("change", (e) => {
      checkFields();
    });
    date_dom.addEventListener("change", (e) => {
      checkFields();
    });
  };

};

export { initCheckFilterForm };