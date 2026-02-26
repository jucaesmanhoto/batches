// O nome do seu garage. Isso será usado para construir a URL da API.
const garage = "le-garage-brasil";
// A URL base da API para fazer as requisições (GET e POST).
const url = `https://garage.api.lewagon.com/${garage}/cars`;

// Selecionamos os elementos do DOM com os quais vamos interagir.
// `.cars-list` é onde os carros serão exibidos.
const garageList = document.querySelector(".cars-list")
// `.car-form` é o formulário que usaremos para adicionar novos carros.
const carForm = document.querySelector(".car-form");

// Função para buscar todos os carros da API (Requisição GET com AJAX).
const fetchAllCars = () => {
  // A função `fetch` inicia uma requisição para a URL da API. Por padrão, é uma requisição GET.
  // `fetch` retorna uma "Promise", que representa a conclusão futura de uma operação assíncrona.
  fetch(url)
  // O primeiro `.then()` trata a resposta HTTP. `response.json()` converte o corpo da resposta de JSON para um objeto JavaScript.
  // Isso também retorna uma Promise.
  .then(response => response.json())
  // O segundo `.then()` recebe os dados (`cars`) já convertidos e prontos para uso.
  .then((cars) => {
    // Limpa a lista de carros no DOM antes de adicionar os novos, para evitar duplicatas.
    garageList.innerHTML = "";

    // Itera sobre o array de carros recebido da API.
    cars.forEach(car => insertHtmlCard(car));
  });
}

// Chama a função para buscar e exibir os carros assim que o script é executado.
fetchAllCars();

// Função para adicionar um novo carro (Requisição POST com AJAX).
const addCar = (event) => {
  // `event.preventDefault()` impede o comportamento padrão do formulário, que é recarregar a página.
  event.preventDefault();

  // `new FormData(carForm)` coleta todos os dados dos campos do formulário.
  const data = new FormData(carForm);
  // `Object.fromEntries` converte os dados do formulário em um objeto JavaScript simples (ex: { brand: 'Toyota', model: 'Corolla', ... }).
  const values = Object.fromEntries(data.entries());

  // Para uma requisição POST, precisamos configurar opções adicionais para o `fetch`.
  const additionalParams = {
    "method": "POST", // Especifica o método HTTP.
    "headers": { 'Content-Type': 'application/json' }, // Informa ao servidor que estamos enviando dados em formato JSON.
    "body": JSON.stringify(values) // Converte nosso objeto JavaScript em uma string JSON para ser enviada no corpo da requisição.
  }

  // Faz a requisição POST para a API com os dados do novo carro.
  fetch(url, additionalParams)
  .then(response => response.json())
  .then(() => {
    // IMPORTANTE: Chamamos `fetchAllCars()` AQUI DENTRO do `.then()`.
    // Isso garante que a lista de carros só seja atualizada DEPOIS que a requisição POST for concluída com sucesso.
    fetchAllCars();
  });
}

// Adiciona um "ouvinte de evento" ao formulário. A função `addCar` será chamada quando o evento "submit" ocorrer.
carForm.addEventListener("submit", addCar);

// Função para criar o HTML de um carro e inseri-lo na página.
const insertHtmlCard = (car) => {
  // Template string para criar o card de um carro com os dados recebidos.
  const carCard = `
  <div class="car">
  <div class="car-image">
  <img src="https://random-pic-a92f0baa4c2c.herokuapp.com/${car.brand},${car.model}" />
  </div>
  <div class="car-info">
  <h4>${car.brand} ${car.model}</h4>
  <p><strong>Owner:</strong> ${car.owner}</p>
  <p><strong>Plate:</strong> ${car.plate}</p>
  </div>
  </div>
  `
  // Insere o HTML do card no final da lista de carros no DOM.
  garageList.insertAdjacentHTML("beforeend", carCard);
}

