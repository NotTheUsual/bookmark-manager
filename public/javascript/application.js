function addFavouritesHandler() {
  $(".star.solid").click(function (event) {
    var link = $(this).parent();
    var favourited = !!$(link).data('favourited');
    var newOpacity = favourited ? 0 : 1;
    $(link).data('favourited', !favourited);
    $(this).animate({opacity: newOpacity}, 200);
  });
}

$(function () {
  addFavouritesHandler();
});
