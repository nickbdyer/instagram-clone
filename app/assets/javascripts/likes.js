$(document).ready(function() {

  $('.like-link').on('click', function(event){
      event.preventDefault();

      var likeCount = $(this).siblings('.like_count');

      $.post(this.href, function(response){
        like_count.text(response.new_like_count);
    })
  })
})
