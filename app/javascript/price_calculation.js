window.addEventListener('load', () => {
  const price = document.getElementById("item-price");
  price.addEventListener('input', () => {
    const inputValue = price.value;
    let fee = Math.floor(inputValue * 0.1);
    let profit = inputValue - fee;

    const addFeeDom = document.getElementById("add-tax-price");
    addFeeDom.innerHTML = fee;
    const addProfitDom = document.getElementById("profit");
    addProfitDom.innerHTML = profit;
  });
});