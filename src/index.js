import './styles/main.scss';

const navLinks = document.querySelectorAll('.nav-link');
navLinks.forEach(el => {
    el.addEventListener('mouseover', function(){
        el.classList.add('active');
    });
    el.addEventListener('mouseout', function(){
        el.classList.remove('active');
    });
});