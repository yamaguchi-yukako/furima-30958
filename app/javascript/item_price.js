window.addEventListener('load', () => {
  console.log("OK");

const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  console.log(inputValue);
  const addTaxDom = document.getElementById("add-tax-price");
  console.log(addTaxDom);
  addTaxDom.innerHTML = (Math.floor(inputValue*0.1));
  console.log(profitNumber);
  const profitNumber = document.getElementById("profit");
  profitNumber.innerHTML = (Math.floor(inputValue-inputValue*0.1));

});
});

