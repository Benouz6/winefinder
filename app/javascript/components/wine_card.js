const toggleCardState = () => {
  const small_cards = Array.from(document.getElementsByClassName('wine-card-small'));
  const large_cards = Array.from(document.getElementsByClassName('wine-card-intermediate'));

  small_to_large(small_cards, large_cards);
  large_to_small(large_cards, small_cards);
}

const small_to_large = (small_cards, large_cards) => {
  small_cards.forEach((small_card, index) => {
    small_card.addEventListener('click', (event) => {
      const large_card = large_cards[index];
      const small_card = event.currentTarget;

      // activate large card
      large_card.classList.remove('disabled-card');
      large_card.classList.add('active-card');


      // fade out small card and fade in large card
      large_card.classList.add('fade-in');
      small_card.classList.add('fade-out');

      // disable small card and remove absolute position from large one
      setTimeout(function () {
        large_card.classList.remove('fade-in');
        small_card.classList.remove('fade-out');

        small_card.classList.add('disabled-card');
        small_card.classList.remove('active-card');
        large_card.classList.remove('wine-card-intermediate-fixed-position');

        // grow large card
        large_card.classList.remove('wine-card-intermediate-small');
        large_card.classList.add('wine-card-intermediate-full');
        setTimeout(function () {
          large_card.classList.remove('wine-card-intermediate-full');
        }, 400);
      }, 350);
    });
  });
}

const large_to_small = (large_cards, small_cards) => {
  large_cards.forEach((large_card, index) => {
    large_card.addEventListener('click', (event) => {
      const large_card = event.currentTarget;
      const small_card = small_cards[index]

      // shrink large card
      large_card.classList.add('wine-card-intermediate-full');
      setTimeout(function () {
        large_card.classList.remove('wine-card-intermediate-full');
        large_card.classList.add('wine-card-intermediate-small');

        setTimeout(function () {
          // enable small card and add absolute position to large one
          large_card.classList.add('wine-card-intermediate-fixed-position');
          small_card.classList.add('active-card');
          small_card.classList.remove('disabled-card');

          // fade in small card and fade out large card
          small_card.classList.add('fade-in');
          large_card.classList.add('fade-out');

          setTimeout(function () {
            // disable large card and clean up classes
            small_card.classList.remove('fade-in');
            large_card.classList.remove('fade-out');

            large_card.classList.remove('active-card');
            large_card.classList.add('disabled-card');
          }, 350);
        }, 400);
      }, 1);
    });
  });
}

export { toggleCardState };
