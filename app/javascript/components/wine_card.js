const toggleCardState = () => {
  const small_cards = Array.from(document.getElementsByClassName('wine-card-small'));
  const large_cards = Array.from(document.getElementsByClassName('wine-card-large'));
  const intermediate_cards = Array.from(document.getElementsByClassName('wine_card_intermediate'));

  small_to_large(small_cards, large_cards);
  large_to_small(large_cards, small_cards);
}

const small_to_large = (small_cards, large_cards) => {
  small_cards.forEach((small_card, index) => {
    small_card.addEventListener('click', (event) => {
      // hide small card
      event.currentTarget.classList.add("card-fade-out");



      sleep(2000);




      event.currentTarget.classList.add('disabled-card');
      event.currentTarget.classList.remove('active-card');

      // show large card
      large_cards[index].classList.add('active-card');
      large_cards[index].classList.remove('disabled-card');
    });
  });
}

const large_to_small = (large_cards, small_cards) => {
  large_cards.forEach((large_card, index) => {
    large_card.addEventListener('click', (event) => {
      // hide large card
      event.currentTarget.classList.add('disabled-card');
      event.currentTarget.classList.remove('active-card');

      // show small card
      small_cards[index].classList.add('active-card');
      small_cards[index].classList.remove('disabled-card');
    });
  });
}

export { toggleCardState };
