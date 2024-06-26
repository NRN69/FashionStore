(function () {

  window.onload = function () {
    window.setTimeout(fadeout, 500);
  };

  function fadeout() {
    document.querySelector('.preloader').style.opacity = '0';
    document.querySelector('.preloader').style.display = 'none';
  }


  window.onscroll = function () {
    let backToTo = document.querySelector('.scroll-top');
    if (
      document.body.scrollTop > 50 ||
      document.documentElement.scrollTop > 50
    ) {
      backToTo.style.display = 'flex';
    } else {
      backToTo.style.display = 'none';
    }
  };

  //===== mobile-menu-btn
  let navbarToggler = document.querySelector('.mobile-menu-btn');
  navbarToggler.addEventListener('click', function () {
    navbarToggler.classList.toggle('active');
  });
})