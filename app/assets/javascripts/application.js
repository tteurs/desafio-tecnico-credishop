//= require jquery3
//= require popper
//= require bootstrap


document.getElementById('calcular-inss').addEventListener('click', function () {
  // Obter o valor do salário inserido pelo usuário
  const salario = parseFloat(document.getElementById('salario').value);

  // Realizar a requisição Ajax para calcular o desconto do INSS
  const xhr = new XMLHttpRequest();
  xhr.open('GET', `/calcular_inss?salario=${salario}`, true);
  xhr.onreadystatechange = function () {
    if (xhr.readyState === 4 && xhr.status === 200) {
      // Atualizar o campo "Desconto INSS" com o valor retornado pela requisição
      const descontoInss = JSON.parse(xhr.responseText).desconto;
      document.getElementById('desconto-inss').textContent = `R$ ${descontoInss.toFixed(2)}`;
    }
  };
  xhr.send();
});
