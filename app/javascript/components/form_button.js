const toggleBtnState = () => {
  const button = document.querySelector('#results-button')

  if (button) {
    button.addEventListener('click', (event) => {
      event.currentTarget.style.opacity = '85%';
      event.currentTarget.innerHTML = '<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> Finding Wines';

      // setTimeout(function () {
      //   event.currentTarget.disabled = true;
      // }, 2000);
    });
  }
}

export { toggleBtnState };
