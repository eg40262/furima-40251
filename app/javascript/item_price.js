document.addEventListener('DOMContentLoaded', () => {
  const priceInput = document.getElementById("item-price");
  if(priceInput) { // priceInputが存在するかチェック
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
});
