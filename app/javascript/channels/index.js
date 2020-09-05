// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

window.addEventListener("DOMContentLoaded", () => {
  const path = location.pathname
  const pathRegex = /^(?=.*item)(?=.*edit)/
  if (path === "/items/new" || path === "/items" || pathRegex.test(path)) {
    //    出品ページの場合　||　出品ページの検証にかかった場合 || 商品編集の場合
    const priceInput = document.getElementById("item-price");
    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");

    priceInput.addEventListener("input", () => {
      const inputValue = document.getElementById("item-price").value;
        addTaxDom.innerHTML = Math.floor(inputValue * 0.1).toLocaleString();
        profitDom.innerHTML = Math.floor(inputValue * 0.9).toLocaleString();
    })
  }
});