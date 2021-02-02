window.addEventListener('load', () => {
  const price = document.getElementById("item-price");
  price.addEventListener('input', () => {
    const inputValue = price.value;
    console.log(inputValue);
    let fee = Math.floor(inputValue * 0.1);
    let profit = inputValue - fee;
    const addFeeDom = document.getElementById("add-tax-price");
    const addProfitDom = document.getElementById("profit");

    addFeeDom.innerHTML = fee;
    addProfitDom.innerHTML = profit;
  });
});