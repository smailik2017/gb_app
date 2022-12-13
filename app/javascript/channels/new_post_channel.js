import consumer from "./consumer"

const newPostChannel = consumer.subscriptions.create("NewPostChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log('Connected to the new_post channel');
    // this.perform('new_post_event("hhhhh")');
    // this.perform('new_post_event');
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log('######## CLIENT RECEIVED ##############');
    let x = document.getElementById("snackbar");
    x.className = "show";
    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
  },

  speak() {
    // Called when there's incoming data on the websocket for this channel
    console.log('######## CLIENT SPEAK ##############')
    this.perform('new_post_event', { message: 'test' });
  }

});

// console.log('in main app.js');
// newPostChannel.speak();

// newPostChannel.received('hell')

export default newPostChannel;

