const cardsDiv = document.getElementById('cardsDiv');

function loadCustomers() {
    cardsDiv.innerHTML = ''; // pulisco il contenitore

    fetch('backend/api.php/customers', {
            method: 'GET',
            headers: { 'Content-Type': 'application/json' }
        })
        .then(res => res.json())
        .then(data => {
            data.forEach(item => {
                let card = document.createElement('div');
                card.classList.add('cardView');

                let id = document.createElement('span');
                id.classList.add('cardId');
                id.textContent = "ID: " + item.id_cliente;

                let name = document.createElement('span');
                name.textContent = item.nome;

                let surname = document.createElement('span');
                surname.textContent = item.cognome;

                let btnEdit = document.createElement('button');
                btnEdit.textContent = "Edit";

                let btnDelete = document.createElement('button');
                btnDelete.textContent = "Delete";

                card.appendChild(btnDelete);
                card.appendChild(btnEdit);
                card.appendChild(id);
                card.appendChild(name);
                card.appendChild(surname);

                cardsDiv.appendChild(card);

                btnEdit.addEventListener('click', () => {
                    if (btnEdit.textContent === "Edit") {
                        // Passo a modalità modifica
                        let inputName = document.createElement('input');
                        inputName.type = 'text';
                        inputName.value = item.nome; // meglio prendere il valore originale

                        let inputSurname = document.createElement('input');
                        inputSurname.type = 'text';
                        inputSurname.value = item.cognome;

                        card.replaceChild(inputName, name);
                        card.replaceChild(inputSurname, surname);

                        btnEdit.textContent = "OK";

                        btnEdit.onclick = () => {
                            const updatedName = inputName.value.trim();
                            const updatedSurname = inputSurname.value.trim();

                            fetch('backend/api.php/customers', {
                                    method: 'PUT', // ATTENZIONE: normalmente per aggiornare si usa PUT o PATCH, non UPDATE
                                    headers: { 'Content-Type': 'application/json' },
                                    body: JSON.stringify({
                                        id: item.id_cliente,
                                        nome: updatedName,
                                        cognome: updatedSurname
                                    })
                                })
                                .then(res => {
                                    if (!res.ok) throw new Error('Errore aggiornamento');
                                    return res.text();
                                })
                                .then(() => {
                                    loadCustomers();
                                })
                                .catch(err => {
                                    alert(err.message);
                                    loadCustomers();
                                });
                        };
                    }
                });


                btnDelete.addEventListener('click', () => {
                    if (!confirm('Sei sicuro di voler eliminare questo cliente?')) return;
                    fetch('backend/api.php/customers', {
                            method: 'DELETE',
                            headers: { 'Content-Type': 'application/json' },
                            body: JSON.stringify({ id: item.id_cliente })
                        })
                        .then(res => {
                            if (!res.ok) throw new Error('Errore eliminazione');
                            return res.text();
                        })
                        .then(() => {
                            loadCustomers();
                        })
                        .catch(err => {
                            alert(err.message);
                        });
                });
            });
        })
        .catch(err => {
            cardsDiv.textContent = 'Errore caricamento clienti';
            console.error(err);
        });
}

// Carico i clienti all’avvio
loadCustomers();