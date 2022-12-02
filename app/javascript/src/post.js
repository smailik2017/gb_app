const changeHeartClass = (heartElement, color) => {
  const className = `fa-solid fa-heart fa-heart--${color}`;
  heartElement.className = className;
}

const handleClick = (event) => {
  color = event.target.className.includes('red') ? '' : 'red'
  changeHeartClass(event.target, color);
}

window.addEventListener('turbolinks:load', function () {
  const heartElement = document.getElementById("heart");
  if (heartElement) {
      heartElement.addEventListener("click", handleClick);
  }
})
  