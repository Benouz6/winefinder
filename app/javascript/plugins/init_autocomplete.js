import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.querySelector('#bottle_search');
  if (addressInput) {

    places({
      appId: 'RZMQODJBOI',
      apiKey:'fb641067b62f7c681c8e184da3f345da',
      container: addressInput
    });
  }
};

export { initAutocomplete };
