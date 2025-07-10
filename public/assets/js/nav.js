// Carica navbar
fetch('components/navbar.html')
    .then(res => res.text())
    .then(data => {
        document.getElementById('navbar-container').innerHTML = data;
    })
    .catch(err => console.error('Errore caricamento navbar:', err));