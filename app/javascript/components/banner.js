import Typed from 'typed.js';

const loadDynamicBannerText = () => {
    if(document.querySelector('#banner-typed-text')){
        new Typed('#banner-typed-text', {
            // stringsElement: '#banner-typed-text',
            strings: ["Need someone to keep you from drinking?", "Always picking fights in clubs?", "Tired of always showing up alone?", "Hire your buddy."],
            typeSpeed: 50,
            loop: true,
            backDelay: 1500,
        });
    }
}

export { loadDynamicBannerText };