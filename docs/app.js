(() => {
  const slides = [...document.querySelectorAll('.slide')];
  const current = document.querySelector('#current');
  const total = document.querySelector('#total');
  const progress = document.querySelector('#progress');
  const previous = document.querySelector('#prev');
  const next = document.querySelector('#next');
  const fullscreen = document.querySelector('#fullscreen');
  let index = Math.max(0, slides.findIndex(slide => `#${slide.id}` === location.hash));

  function show(target, updateAddress = true) {
    index = Math.max(0, Math.min(slides.length - 1, target));
    slides.forEach((slide, i) => {
      slide.classList.toggle('active', i === index);
      slide.hidden = i !== index;
      slide.setAttribute('aria-hidden', String(i !== index));
    });
    slides[index].scrollTop = 0;
    current.textContent = String(index + 1).padStart(2, '0');
    total.textContent = String(slides.length).padStart(2, '0');
    progress.style.width = `${(index + 1) / slides.length * 100}%`;
    previous.disabled = index === 0;
    next.disabled = index === slides.length - 1;
    document.title = `${slides[index].dataset.label} · Popularidad y persistencia en Steam`;
    if (updateAddress) {
      try { history.replaceState(null, '', `#${slides[index].id}`); } catch (_) { /* La navegación sigue funcionando sin modificar la URL. */ }
    }
  }

  previous.addEventListener('click', () => show(index - 1));
  next.addEventListener('click', () => show(index + 1));
  document.querySelectorAll('[data-next]').forEach(button => button.addEventListener('click', () => show(index + 1)));
  fullscreen.addEventListener('click', async () => {
    try {
      if (document.fullscreenElement) await document.exitFullscreen();
      else if (document.documentElement.requestFullscreen) await document.documentElement.requestFullscreen();
    } catch (_) { fullscreen.title = 'La pantalla completa no está disponible en este navegador'; }
  });
  document.addEventListener('fullscreenchange', () => {
    const label = document.fullscreenElement ? 'Salir de pantalla completa' : 'Pantalla completa';
    fullscreen.setAttribute('aria-label', label);
    fullscreen.title = label;
  });
  document.addEventListener('keydown', event => {
    if (event.altKey || event.ctrlKey || event.metaKey || /INPUT|TEXTAREA|SELECT/.test(event.target.tagName)) return;
    if (event.key === 'ArrowRight' || event.key === 'PageDown') { event.preventDefault(); show(index + 1); }
    if (event.key === 'ArrowLeft' || event.key === 'PageUp') { event.preventDefault(); show(index - 1); }
    if (event.key === 'Home') { event.preventDefault(); show(0); }
    if (event.key === 'End') { event.preventDefault(); show(slides.length - 1); }
    if (event.key.toLowerCase() === 'f') fullscreen.click();
  });
  window.addEventListener('hashchange', () => {
    const target = slides.findIndex(slide => `#${slide.id}` === location.hash);
    if (target >= 0) show(target, false);
  });
  let touch = null;
  document.querySelector('#slides').addEventListener('touchstart', e => { touch = [e.changedTouches[0].clientX, e.changedTouches[0].clientY]; }, { passive: true });
  document.querySelector('#slides').addEventListener('touchend', e => {
    if (!touch) return;
    const dx = e.changedTouches[0].clientX - touch[0], dy = e.changedTouches[0].clientY - touch[1];
    if (Math.abs(dx) > 70 && Math.abs(dx) > Math.abs(dy) * 1.5) show(index + (dx < 0 ? 1 : -1));
    touch = null;
  }, { passive: true });
  show(index, false);
})();
