import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Need someone to keep you from drinking too much?", "Always picking fights in clubs?", "Tired of always showing up to everything alone?", "Hire your buddy."],
    typeSpeed: 30,
    loop: true
  });
}

export { loadDynamicBannerText };