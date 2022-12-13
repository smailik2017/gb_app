// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

// import Rails from "@rails/ujs"
// import Turbolinks from "turbolinks"
// import * as ActiveStorage from "@rails/activestorage"
// import "channels"
// import 'bootstrap'

// import "jquery"

// import "src/profile.js" // теперь src/profile.js доступен во всем приложении
// import "src/post.js" // теперь src/post.js доступен во всем приложении

// require("trix")
// require("@rails/actiontext")

// Rails.start()
// Turbolinks.start()
// ActiveStorage.start()

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")

require("trix")
require("@rails/actiontext")


import newPostChannel from "channels/new_post_channel.js"

$(document).on('turbolinks:load', function () {
  const someNotice = document.getElementById("notice");
  if (someNotice) {
    if (someNotice.innerHTML == 'Post was successfully created.') {
      let message = 'New post message'
      if (message.length > 0) {
        newPostChannel.speak();

        console.log('##### CLIENT Created new post !!!!!!!!!!');
      }
    }
  }
})

// Rails.start()
// Turbolinks.start()
// ActiveStorage.start()

// require("channels/new_post_channel.js")

// import newPostChannel from "channels/new_post_channel.js";

// $(document).on('turbolinks:load', function () {
//   const someNotice = document.getElementById("notice");
//   if (someNotice) {
//     if (someNotice.innerHTML == 'Post was successfully created.') {
//       let message = 'New post message'
//       if (message.length > 0) {
//         newPostChannel.speak();
//         console.log('##### CLIENT Created new post !!!!!!!!!!');
//       }
//     }
//   }
// })
