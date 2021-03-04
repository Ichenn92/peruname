import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('address');
  
  if (addressInput) {
    places({ container: addressInput });
  }
  
  const performanceAddressInput = document.getElementById('location_address');
  if (performanceAddressInput) {
    places({ container: performanceAddressInput });
  }
};

export { initAutocomplete };