const toggleBtnState = () => {
  const button = document.querySelector('#results-button')

  if (button) {
    button.addEventListener('click', (event) => {
      console.log(event.currentTarget);
      event.currentTarget.style.opacity = '85%';
      event.currentTarget.innerHTML = '<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> Finding Wines';

      sleep(250);
      event.currentTarget.disabled = true;
    });
  }
}

export { toggleBtnState };
