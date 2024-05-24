function price (){
	const askingPrice = document.getElementById("item-price");

		askingPrice.addEventListener("input", () => {
			const inputPrice = askingPrice.value;

			const commissionVal = document.getElementById("add-tax-price");
			const commission = Math.floor(inputPrice * 0.1);
			commissionVal.innerHTML = `${commission}`;
		
			const profitVal = document.getElementById("profit");
			const profit = Math.floor(inputPrice * 0.9);
			profitVal.innerHTML = `${profit}`;
	});
};

window.addEventListener('turbo:load', price);