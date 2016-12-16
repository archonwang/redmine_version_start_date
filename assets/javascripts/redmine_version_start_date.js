$(function(){
  var $org_elements = $('h3.version + p');
  var $mod_elements = $('.redmine_version_start_date');
  $.each($mod_elements, function(i, mod_element){
    if(!$(mod_element).hasClass('none')){
      $org_elements[i].replaceWith(mod_element);
    }
  });
})
