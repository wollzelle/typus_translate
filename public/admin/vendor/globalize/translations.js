// Typus = (typeof(Typus) == "undefined") ? {} : Typus;
// 
// Typus.Translate = function(){
//   
//   var private_var;
//   
//   var private_method = function(){
//     console.log('woot');
//   };
//   
//   return {
//     
//     public_method_1: function(){
//       console.log('public_method_1');
//     },
//     
//     public_method_2: function(){
//       console.log('public_method_2');      
//     }
//         
//   }
//   
// }();


$(document).ready(function(){
  
  // console.log(Typus);

  $('.inputs .translation').hide();
  $('.inputs .translation').first().show().addClass('active');  
  $('.inputs .tabs a').first().addClass('active');  

  // $('.translation').each(function(idx, el) {
  //   var el = $(el);
  //   // var tabs = el.find('.tab');
  //   // tabs.hide();
  //   // tabs.first().show();
  // });

  // $('.inputs .translation .tab').hide();
  // $('.inputs .translation .tab').first().show().addClass('active');  
  // $('.inputs .translation .tabs a').first().addClass('active');  


  // $('h2').append('in');  
  $('.inputs .tabs a').click(function(e){
    var el = $(this);
    // var lang = $(this).text();
    var target = el.attr('href').replace('#', '');
  
    $('.inputs .tabs a').removeClass('active');
    el.addClass('active');

    $('.inputs .translation').hide().removeClass('active');
    $('.inputs').find('.tab-'+target).show().addClass('active');
  
    // $('h2').append(' ' + lang);
    
    e.preventDefault();
  });
  
  
});