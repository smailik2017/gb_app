const changeHeartClass = (heartElement, color) => {
  const className = `fa-solid fa-heart fa-heart--${color}`;
  heartElement.className = className;
}

const handleClick = async (event) => {
  str = window.location.toString().split('/');
  post_id = str[str.length - 1]
  // console.log(`post_id: ${post_id}`);
  color = event.target.className.includes('red') ? '' : 'red'
  changeHeartClass(event.target, color);

  try {
    const requestBody = new FormData();
    requestBody.set("color", color);
    requestBody.set("post_id", post_id);
    const response = await fetch('/likes', {
      method: 'POST',
      body: requestBody,
    });
    
      console.log(response);
    } catch (error) {
      console.log(error)
    }

}

window.addEventListener('turbolinks:load', function () {
  const heartElement = document.getElementById("heart");
  if (heartElement) {
      heartElement.addEventListener("click", handleClick);
  }
})
