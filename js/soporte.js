const showPopupButton = document.getElementById('showPopupButton');
const closePopupButton = document.getElementById('closePopupButton');
const contactPopup = document.getElementById('contactPopup');

showPopupButton.addEventListener('click', () => {
  contactPopup.style.display = 'flex';
});

closePopupButton.addEventListener('click', () => {
  contactPopup.style.display = 'none';
});