window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    
    const addTaxDom = document.getElementById("add-tax-price");
    const salesTax = Math.floor(inputValue * 0.1);
    addTaxDom.innerHTML = salesTax.toString(); 

    const sellProfit = document.getElementById("profit");
    const netIncome = inputValue - salesTax;
    sellProfit.innerHTML = netIncome.toString();
  })
});