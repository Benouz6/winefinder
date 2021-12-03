const toggleCardState = () => {
  const small_cards = Array.from(document.getElementsByClassName('wine-card-small'));
  const large_cards = Array.from(document.getElementsByClassName('wine-card-large'));
  const intermediate_cards = Array.from(document.getElementsByClassName('wine-card-intermediate'));

  // small_cards.forEach =

  small_to_large(small_cards, large_cards, intermediate_cards);
  large_to_small(large_cards, small_cards, intermediate_cards);

  // large_cards.forEach((large_card) => {
  //   console.log(large_card.scrollHeight)
  // });
}

const small_to_large = (small_cards, large_cards, intermediate_cards) => {
  small_cards.forEach((small_card, index) => {
    small_card.addEventListener('click', (event) => {
      const intermediate_card = intermediate_cards[index];
      const small_card = event.currentTarget;

      // activate large card
      intermediate_card.classList.remove('disabled-card');
      intermediate_card.classList.add('active-card');


      // fade out small card and fade in large card
      intermediate_card.classList.add('fade-in');
      small_card.classList.add('fade-out');

      // disable small card and remove absolute position from large one
      setTimeout(function () {
        intermediate_card.classList.remove('fade-in');
        small_card.classList.remove('fade-out');

        small_card.classList.add('disabled-card');
        small_card.classList.remove('active-card');
        intermediate_card.classList.remove('wine-card-intermediate-fixed-position');

        // grow large card
        intermediate_card.classList.remove('wine-card-intermediate-small')
        intermediate_card.classList.add('wine-card-intermediate-full')
        setTimeout(function () {
          intermediate_card.classList.remove('wine-card-intermediate-full')
        }, 400);
      }, 350);

      // use actual card height
      // intermediate_card.style.height = `${large_card.clientHeight}px`;
      // intermediate_card.style.setProperty('heigth', `${large_card.clientHeight}px`);
      // large_cards[index].classList.add('active-card');
    });
  });
}

const large_to_small = (large_cards, small_cards, intermediate_cards) => {
  large_cards.forEach((large_card, index) => {
    large_card.addEventListener('click', (event) => {
      const intermediate_card = intermediate_cards[index];
      const large_card = event.currentTarget;
      const small_card = small_cards[index]

      // shrink large card
      intermediate_card.classList.add('wine-card-intermediate-full')
      setTimeout(function () {
        intermediate_card.classList.remove('wine-card-intermediate-full')
        intermediate_card.classList.add('wine-card-intermediate-small')

        setTimeout(function () {
          // enable small card and add absolute position to large one
          intermediate_card.classList.add('wine-card-intermediate-fixed-position');

        }, 400);










      }, 1);




      // fade in small card and fade out large card



      // disable large card











      // // hide large card
      // event.currentTarget.classList.add('disabled-card');
      // event.currentTarget.classList.remove('active-card');

      // // show small card
      // small_cards[index].classList.add('active-card');
      // small_cards[index].classList.remove('disabled-card');
    });
  });
}

export { toggleCardState };
