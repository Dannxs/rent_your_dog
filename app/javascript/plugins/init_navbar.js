document.addEventListener("DOMContentLoaded", function(){
  window.addEventListener('scroll', function() {
      if (window.scrollY > 0) {
        document.getElementById('navbar_top').classList.add('fixed-top');
        // add padding top to show content behind navbar
        navbar_height = document.querySelector('.navbar').offsetHeight;
        document.body.style.paddingTop = navbar_height + 'px';
        

      } else {
        document.getElementById('navbar_top').classList.remove('fixed-top');
         // remove padding top from body
        document.body.style.paddingTop = '0';
        
      }
      if (window.scrollY > 66) {
        $('#navbar_top').css('background-color', 'rgba(140, 82, 158, 0.5)')
      } else {
        $('#navbar_top').css('background-color', 'rgba(140, 82, 158, 0.8)')
      }
  });
}); 
