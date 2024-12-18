// Función para obtener información de Morty
async function obtenerMorty() {
  try {
    // URL para buscar por nombre "Morty"
    const url = 'https://rickandmortyapi.com/api/character?name=morty';
    const respuesta = await fetch(url);
    const datos = await respuesta.json();

    // Seleccionamos el contenedor en el HTML
    const container = document.getElementById('container');

    // Iteramos los resultados relacionados con Morty
    datos.results.forEach(personaje => {
      const card = document.createElement('div');
      card.className = 'card';
      card.innerHTML = `
                <img src="${personaje.image}" alt="${personaje.name}">
                <h3>${personaje.name}</h3>
                <p>Estado: ${personaje.status}</p>
                <p>Especie: ${personaje.species}</p>
                <p>Género: ${personaje.gender}</p>
                <p>Ubicación: ${personaje.location.name}</p>
            `;
      container.appendChild(card);
    });
  } catch (error) {
    console.error('Error al obtener información de Morty:', error);
  }
}

// Llamar a la función al cargar la página
obtenerMorty();