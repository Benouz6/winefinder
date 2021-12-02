const toggleCardState = () => {
  const small_cards = Array.from(document.getElementsByClassName('wine-card-small'));
  const large_cards = Array.from(document.getElementsByClassName('wine-card-large'));
  const intermediate_cards = Array.from(document.getElementsByClassName('wine-card-intermediate'));

  small_to_large(small_cards, large_cards, intermediate_cards);
  large_to_small(large_cards, small_cards, intermediate_cards);
}

const small_to_large = (small_cards, large_cards, intermediate_cards) => {
  small_cards.forEach((small_card, index) => {
    small_card.addEventListener('click', (event) => {
      // hide small card

      // fade out small card
      event.currentTarget.classList.add("card-fade-out");

      event.currentTarget.classList.add('disabled-card');
      event.currentTarget.classList.remove('active-card');
      event.currentTarget.classList.remove("card-fade-out");


      intermediate_cards[index].classList.remove('wine-card-intermediate-small')
      intermediate_cards[index].classList.add('wine-card-intermediate-full')



      setTimeout(function () {
      }, 200);

      // pop in large card in it's small state
      large_cards[index].classList.add('active-card');
      large_cards[index].classList.remove('disabled-card');






      sleep(2000);





      // show large card
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
