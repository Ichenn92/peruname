const initBecomeAnActor = () => {
  const actorSettings_dom = document.getElementById("actor-settings-hidden");
  const wannaBeActor_dom = document.getElementById("wanna-be-actor");
  const buttonStartJourney_dom = document.getElementById("start-my-journey");

  const toggleSideBar = () => {
    actorSettings_dom.classList.toggle("d-none");
    wannaBeActor_dom.classList.toggle("d-none");
  };

  if (actorSettings_dom && buttonStartJourney_dom) {
    buttonStartJourney_dom.addEventListener("click", () => {
      toggleSideBar();
    });
  }
};

export { initBecomeAnActor };