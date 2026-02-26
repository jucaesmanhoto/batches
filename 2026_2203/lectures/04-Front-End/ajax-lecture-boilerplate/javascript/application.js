// Importa a biblioteca Sweet Alert 2 utilizando o importmaps
// DOCUMENTAÇÃO => https://sweetalert2.github.io/
import Swal from "sweetalert2";

// Guarda o objeto formulário em uma variável
const form = document.getElementById("form")

// Cria a função javascript para disparar ao fazer o submit do formulário
// com o addEventListner mais abaixo
const login = (event) => {
  // Ao disparar um evento em um formulário, o comportamento padrão é fazer o reffresh da página
  // Mas como isso reconstrói toda a página (DOM), perdemos todas as informações anteriores
  // Não queremos isso! Usamos o event.preventDefault() sempre que um evento tem um comportamento padrão
  // indesejado. Outro exemplo seria o click em um link. Se quisermos mostrar um aviso antes da navegação,
  // precisamos escutar o evento click neste link, e não deixar executar o comportamento padrão que seria navegar para o endereço do link.
  event.preventDefault();

  // Guarda os valores dos inputs com id "email" e "password" da página
  // em variáveis para usarmos no corpo da requisição que vamos enviar com
  // o fecth a seguir;
  const emailValue = document.getElementById("email").value
  const passwordValue = document.getElementById("password").value

  // Guarda a url que usaremos na nossa requisição fectch em um variável
  // Serve "apenas" para deixar o código mais limpo e organizado
  // Mas poderiamos passar a string direto como parâmetro no fetch
  // assim: fetch("https://jsonplaceholder.typicode.com/users")
  const url = "https://jsonplaceholder.typicode.com/users"

  // Aqui executamos a função javascript fetch
  // Como vimos, ela aceita até 2 parâmtros, sendo o segundo opcional
  // Sem o segundo parâmetro, a requisição será sempre do tipo GET.
  // Neste caso, como queremos enviar email e senha para fazer o login
  // precisamos do segundo parâmetro, que será um objeto com as chaves method, headers e body
  // Assim como a url, podemos deixar tudo em variáveis separadas:
  // (Descomente o código a seguir e comente o fetch que está ativo (linhas 42 a 46) para ver que o resultado continua igual)
  // const method = "POST";
  // const headers = { 'Content-Type': 'application/json' };
  // const body = JSON.stringify({ "login": emailValue, "password": passwordValue });
  // const requestDetails = { method, headers, body }
  // fetch(url, requestDetails)
  fetch(url, {
    method: "POST",
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ "login": emailValue, "password": passwordValue })
  }) // O fetch retorna uma promessa (Promise). Por isso precisamos do .then para que possamos processar a resposta e não uma "promessa de resposta"
    .then((response) => {
      // No log é possível ver que a resposta tem vários atributos
      // podemos usar o código de status da resposta para executar ações condicionais
      console.log(response)
      // Se a resposta vier como sucesso (200, (neste caso) 201, ...) mostramos o alerta de sucesso
      if (response.status === 201) {
        Swal.fire({ title: 'Success', text: 'You are connected', icon: 'success' })
        // retornamos como resultado do .then uma promessa de objeto Json
        return response.json();
      } else {
        // Se a resposta não vier como sucesso (qquer outro código que não (neste caso) 201) mostramos o alerta de erro
        Swal.fire({ title: 'Error!', text: 'Oups! Something went wrong', icon: 'error' })
      }
    })
    // Como o .then() acima, assim como o fetch, também tem como resultado uma Promise,
    // precisamos encadear um segundo .then()
    .then((data) => {
      // Agora conseguimos ver no console do navegador, as informações que fomos buscar no servidor!
      console.log(data);
    });
}

// Apesar de parecer que a execução do addEventListener acontece por último, na verdade ele vai deixar o
// seu navegador pronto para executar a função (no caso a função login, definida na linha 10) passada como segundo parâmetro,
// quando acontecer um evento do tipo submit no seu formulário (click no botão de submit ou enter quando o cursor estiver em um input)
// Ou seja, a função login só vai ser executada com o evento submit. Porém precisamos declarar ela antes para que o JS
// saiba o que executar quando o evento for disparado.
form.addEventListener("submit", login);


