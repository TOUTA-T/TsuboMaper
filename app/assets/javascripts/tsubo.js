$(function() {
    $('.area').hover(function() {
        console.log('area-over', $(this).index());
    }, function() {
        console.log('area-out', $(this).index());
    });
    $('.area').on('click', function(e) {
        console.log('area-click', $(this).index());
        e.preventDefault();
    });
});
