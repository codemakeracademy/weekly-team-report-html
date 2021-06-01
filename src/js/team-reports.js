(function(){
  const teamFilterBtns = document.getElementById('team-filter')
                         .querySelectorAll('button');
  const immediateTeam = document.getElementById('immediate-team');
  const immediateTeamBtn = document.getElementById('immediate-team-btn');
  const immediateTeamHeader = document.getElementById('immediate-team-header');
  const extendedTeamHeader = document.getElementById('extended-team-header');
  const extendedTeam = document.getElementById('extended-team');
  const extendedTeamBtn = document.getElementById('extended-team-btn');
  const periodFilterBtns = document.getElementById('period-filter')
                           .querySelectorAll('button');
  const olderReportsBtn = document.getElementById('older-reports-btn');
  const olderReportsContent = document.getElementById('older-reports-content');
  const typeFilter = document.getElementById('type-filter');
  const typeFilterBtns = typeFilter.querySelectorAll('button');
  const overallFilterBtn = document.getElementById('overall-filter');
  const overallFilterContent = document.getElementById('overall-filter-content');


  function resetActiveClass(elems, activeEl) {
    elems.forEach((el) => {
      el.classList.remove('active');
    });
    activeEl.classList.add('active');
  };

  function showImmediateTeamContent() {
    immediateTeam.classList.remove('d-none');
    typeFilter.classList.add('d-none');
    immediateTeamHeader.classList.remove('d-none');
    extendedTeamHeader.classList.add('d-none');
    extendedTeam.classList.add('d-none');

    periodFilterBtns.forEach((el) => {
      el.addEventListener('click', (evt) => {
        const clickedBtn = evt.currentTarget;
        resetActiveClass(periodFilterBtns, clickedBtn);
      });
    });

    typeFilterBtns.forEach((el) => {
      el.addEventListener('click', (evt) => {
        const clickedBtn = evt.currentTarget;
        resetActiveClass(typeFilterBtns, clickedBtn);
      });
    });
  };

  function showExtendedTeamContent() {
    immediateTeam.classList.add('d-none');
    typeFilter.classList.remove('d-none');
    immediateTeamHeader.classList.add('d-none');
    extendedTeamHeader.classList.remove('d-none');
    extendedTeam.classList.remove('d-none');
    olderReportsBtn.classList.add('active');

    periodFilterBtns.forEach((el) => {
      el.addEventListener('click', (evt) => {
        const clickedBtn = evt.currentTarget;
        resetActiveClass(periodFilterBtns, clickedBtn);
  
        if (extendedTeamBtn.classList.contains('active') && olderReportsBtn.classList.contains('active')) {
          olderReportsContent.classList.remove('d-none');
        } else {
          olderReportsContent.classList.add('d-none');
        }
      });
    });

    typeFilterBtns.forEach((el) => {
      el.addEventListener('click', (evt) => {
        const clickedBtn = evt.currentTarget;
        resetActiveClass(typeFilterBtns, clickedBtn);
  
        if (extendedTeamBtn.classList.contains('active') && 
            olderReportsBtn.classList.contains('active') &&
            overallFilterBtn.classList.contains('active')) {
              overallFilterContent.classList.remove('d-none');
        } else {
          overallFilterContent.classList.add('d-none');
        }
      });
    });
  }
  
  teamFilterBtns.forEach((el) => {
    el.addEventListener('click', (evt) => {
      const clickedBtn = evt.currentTarget;
      resetActiveClass(teamFilterBtns, clickedBtn);

      if (immediateTeamBtn.classList.contains('active')) {
        showImmediateTeamContent();
      } else {
        showExtendedTeamContent();
      }
    });
  });

  showImmediateTeamContent();
})();