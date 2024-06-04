function price (){
	const askingPrice = document.getElementById("item-price");

		askingPrice.addEventListener("keyup", () => {
			const inputPrice = askingPrice.value;

			const commissionVal = document.getElementById("add-tax-price");
			const commission = Math.floor(inputPrice * 0.1);
			commissionVal.innerHTML = `${commission}`;
		
			const profitVal = document.getElementById("profit");
			const profit = inputPrice - commission;
			profitVal.innerHTML = `${profit}`;
	});
};

window.addEventListener('turbo:load', price);
window.addEventListener('turbo:render', price);