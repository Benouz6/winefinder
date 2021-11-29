const toggleCardState = () => {
  const small_cards = Array.from(document.getElementsByClassName('wine-card-small'));
  const large_cards = Array.from(document.getElementsByClassName('wine-card-large'));

  small_to_large(small_cards, large_cards);
  large_to_small(large_cards, small_cards);
}

const small_to_large = (small_cards, large_cards) => {
  small_cards.forEach((small_card, index) => {
    small_card.addEventListener('click', (event) => {
      // hide small card
      event.currentTarget.classList.add('d-none')
      event.currentTarget.classList.remove('d-flex')

      // show large card
      large_cards[index].classList.add('d-flex')
      large_cards[index].classList.remove('d-none')
    });
  });
}

const large_to_small = (large_cards, small_cards) => {
  large_cards.forEach((large_card, index) => {
    large_card.addEventListener('click', (event) => {
      // hide large card
      event.currentTarget.classList.add('d-none')
      event.currentTarget.classList.remove('d-flex')

      // show small card
      small_cards[index].classList.add('d-flex')
      small_cards[index].classList.remove('d-none')
    });
  });
}

export { toggleCardState };
