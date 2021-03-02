import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('address');
  if (addressInput) {
    places({ container: addressInput });
  }
  
  const performanceAddressInput = document.getElementById('performance_location');
  if (performanceAddressInput) {
    places({ container: performanceAddressInput });
  }
};

export { initAutocomplete };