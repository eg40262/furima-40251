// document.addEventListener("turbo:load", () => {
  const price = () => {
  const priceInput = document.getElementById("item-price");
  if(priceInput) {
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      const addTaxDom = document.getElementById("add-tax-price");
      const taxValue = Math.floor(inputValue * 0.1);
      addTaxDom.innerHTML = taxValue;

      const profitDom = document.getElementById("profit");
      const profitValue = inputValue - taxValue;
      profitDom.innerHTML = profitValue;
    });
  }
};



window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);