$(function(){
  var $org_elements =
    $('.controller-versions.action-index h3.version + p, .controller-versions.action-show #roadmap > p:first-child');
  var $mod_elements = $('.redmine_version_start_date');
  $.each($mod_elements, function(i, mod_element){
    if(!$(mod_element).hasClass('none')){
      $org_elements[i].replaceWith(mod_element);
    }
  });
})

$(document).ready(function(){
  var $effective_date_field = $('#version_effective_date').parent();
  var $start_date_field = $('#version_start_date').parent();
  $effective_date_field.before($start_date_field.show());
})
