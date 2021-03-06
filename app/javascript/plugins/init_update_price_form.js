const initUpdatePriceForm = () => {
  const date_dom = document.getElementById("booking_date");
  const startTime_dom = document.getElementById("booking_start_time_4i");
  const endTime_dom = document.getElementById("booking_end_time_4i");
  const submit_dom = document.getElementById("submit-button");

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

  const updateTotalPrice = () => {
    const priceHour_dom = document.getElementById("booking_Price/hour");
    const totalPrice_dom = document.getElementById("booking_Price");
    const duration = parseInt(endTime_dom.value, 10) - parseInt(startTime_dom.value, 10);
    const priceHour = parseInt(priceHour_dom.value, 10);
    const totalPrice = duration * priceHour;
    if (totalPrice > 0) {
      inputsIsValid();
      totalPrice_dom.value = `${totalPrice} CHF`;
  } else {
      inputsIsInvalid();
      totalPrice_dom.value = "Error.. Verify your inputs";
    }
  };

  if (startTime_dom && endTime_dom && submit_dom) {
    startTime_dom.addEventListener("change", (e) => {
      updateTotalPrice();
    });
    endTime_dom.addEventListener("change", (e) => {
      updateTotalPrice();
    });
  };

};

export { initUpdatePriceForm };