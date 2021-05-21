const initStars = () => {
  const starsForm = document.querySelector('#stars-form')
  if (starsForm) {
    const star_icons = document.querySelector('fieldset').querySelectorAll('.form-check');
    const getActive = (star) => {
      star.addEventListener('mouseover', () => {
        if (!star.querySelector('i').classList.contains('clicked')) {
          const stars_array = Array.from(star_icons);
          stars_array.forEach((star_icon) => {
            if (stars_array.indexOf(star_icon) <= stars_array.indexOf(star)) {
              star_icon.querySelector('i').classList.add('active');
            } else {
              star_icon.querySelector('i').classList.remove('active');
            }
          })
        }
      })
    };

    const getUnactive = (star) => {
      star.addEventListener('mouseout', () => {
        if (!star.querySelector('i').classList.contains('clicked')) {
          const stars_array = Array.from(star_icons);
          stars_array.forEach((star_icon) => {
            if (!star_icon.querySelector('i').classList.contains('clicked')) {
              star_icon.querySelector('i').classList.remove('active');
            }
          })
        }
      })
    }

    const getClicked = (star) => {
      star.addEventListener('click', () => {
        const stars_array = Array.from(star_icons);
        stars_array.forEach((star_icon) => {
          if (stars_array.indexOf(star_icon) <= stars_array.indexOf(star)) {
            star_icon.querySelector('i').classList.add('active', 'clicked');
          } else {
            star_icon.querySelector('i').classList.remove('active', 'clicked');
          }
        })
      })
    }

    star_icons.forEach(getActive);
    star_icons.forEach(getUnactive);
    star_icons.forEach(getClicked);

  }
}

export { initStars };




