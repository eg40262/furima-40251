    window.addEventListener('turbo:load', () => {
      const priceInput = document.getElementById("item-price");
      priceInput.addEventListener("input", () => {
        const inputValue = priceInput.value;
        const addTaxDom = document.getElementById("add-tax-price");
        const taxValue = Math.floor(inputValue * 0.1);
        addTaxDom.innerHTML = taxValue;
    
        const profitDom = document.getElementById("profit");
        const profitValue = inputValue - taxValue;
        profitDom.innerHTML = profitValue;
      });
    });

    // window.addEventListener('turbo:load', () => {
      // console.log("OK");
    // });
    
    // const priceInput = document.getElementById("item-price");
    // priceInput.addEventListener("input", () => {
      // const inputValue = priceInput.value;
      // console.log(inputValue);
    // })
    
        // const addTaxDom = document.getElementById("add-tax-price");
        // addTaxDom.innerHTML = "入力した金額をもとに販売手数料を計算する処理"
    
    