function item() {
 const itemPrice = document.getElementById("item-price");
 const addTaxPrice = document.getElementById("add-tax-price");
 const profit = document.getElementById("profit");
  itemPrice.addEventListener("input",() => {
    const inputValue = itemPrice.value;
    addTaxPrice.innerHTML = Math.floor(inputValue / 10);
    profit.innerHTML = inputValue - addTaxPrice.innerHTML;
  });
}
window.addEventListener('load',item);
