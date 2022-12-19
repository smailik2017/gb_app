require("controllers")

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

import "controllers"

import "src/profile.js"
import "src/post.js"
