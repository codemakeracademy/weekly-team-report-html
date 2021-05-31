const inviteForm = document.getElementById('invite-form');

inviteForm.addEventListener('submit', function(evt) {
  evt.preventDefault();
  sendInvite();
});

const sendInvite = () => {
  const successBlock = document.getElementById('success-invite');
  const inputs = document.querySelectorAll('input');

  inputs.forEach((el) => {
    el.value = null;
  })

  successBlock.classList.remove('d-none');
};