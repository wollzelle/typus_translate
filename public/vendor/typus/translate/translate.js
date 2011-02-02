/*! ----------------------------------------------------------------------------
* translate.js
* Copyright 2011 wollzelle GmbH (http://wollzelle.com). All rights reserved.
* --------------------------------------------------------------------------- */

(function($){

  $.fn.translate = function(){
    
    var self         = this,
        el           = form = this,
        tabs         = el.find('#translate-tabs'),
        inputs       = el.find('.inputs'),
        translatable = inputs.find('.translation'),
        baseLang     = tabs.find('a:first').attr('href').replace('#', '.');

    this.data('activeLang', baseLang);

    $(document).bind('translate:refresh', function() { showTab(self.data('activeLang')); });
        
    function showTab(lang){
      self.data('activeLang', lang);    
      // translatable.hide().removeClass('active');
      inputs.find('.translation').hide().removeClass('active');
      tabs.find('a').removeClass('active');
      form.find(lang).addClass('active').show();
    }

    tabs.find('a').click(function(e){          
      var lang = $(this).attr('href').replace('#', '.');    
      showTab(lang);          
      e.preventDefault();
    });
   
    showTab(baseLang);
    
    return this;    
  }

})(jQuery);