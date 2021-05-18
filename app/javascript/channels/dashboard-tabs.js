

const tabs = document.querySelectorAll('.tab');

const initTabsClick = () => {
  tabs.forEach((tab) => {
    tab.addEventListener('click', (event) => {
      tabs.forEach((tab) => {
        tab.classList.remove('active');
        document.querySelector(`.${tab.id}`).style.display = 'none';
      });
      const activeTab = event.currentTarget;
      activeTab.classList.add('active');
      const activeDiv = document.querySelector(`.${activeTab.id}`);
      activeDiv.style.display = 'block';
    });
  })
}

export { initTabsClick };
