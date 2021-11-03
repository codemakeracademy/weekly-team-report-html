import './styles/main.scss';
import './styles/normalize.css';
import 'bootstrap';
import './_my-reports';

const navLinks = document.querySelectorAll('.nav-link');
navLinks.forEach(el => {
    el.addEventListener('mouseover', function(){
        el.classList.add('active');
    });
    el.addEventListener('mouseout', function(){
        el.classList.remove('active');
    });
});