
function changeFormStyle() {
  const select = document.getElementById("type");
  const selectedOption = select.options[select.selectedIndex].value;
  const form = document.getElementById("user-form");
  const userTypeLabel = document.getElementById("user-type-label");

  // Remover classes de estilo anteriores
  form.classList.remove("form-admin");
  form.classList.remove("form-professor");
  form.classList.remove("form-student");

  // Adicionar classe de estilo com base na opção selecionada
  if (selectedOption === "ADM") {
      form.classList.add("form-admin");
  } else if (selectedOption === "PROFESSOR") {
      form.classList.add("form-professor");
  } else if (selectedOption === "STUDENT") {
      form.classList.add("form-student");
  }

  // Adicionar classe de animação à label, somente teste
  userTypeLabel.classList.add("highlight-label");
  setTimeout(function() {
      userTypeLabel.classList.remove("highlight-label");
  }, 500);
}

function setPage(){
    window.location = 'index.html'
}