$(function() {
  $('a[data_method]').live("click", function() {
    var link = $(this);
    var href = link.attr('data_submit_form'), 
        method = link.attr('data_method'),
        form = $('<form method="post" action="' + href + '"></form>'),
        metadata_input = '<input name="_method" value="' + method + '" type="hidden" />';
        form.hide().append(metadata_input).appendTo('body');
        form.submit();
    });

  setInterval(function() {
    location.reload();
  }, 5000);


});
