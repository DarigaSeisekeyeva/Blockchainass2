let contract;
let userAccount;

if (typeof window.ethereum !== 'undefined') {
    web3 = new Web3(window.ethereum);
    window.ethereum.request({ method: 'eth_requestAccounts' })
        .then(accounts => {
            userAccount = accounts[0];
            contract = new web3.eth.Contract(contractABI, contractAddress);
            console.log('Connected as', userAccount);
            fetchModels();
        })
        .catch(err => console.error('Please connect MetaMask', err));
} else {
    alert('MetaMask is not installed!');
}

// List a new model
document.getElementById('listModelForm').onsubmit = async (e) => {
    e.preventDefault();
    const name = document.getElementById('modelName').value;
    const description = document.getElementById('modelDescription').value;
    const price = web3.utils.toWei(document.getElementById('modelPrice').value, 'ether');

    try {
        await contract.methods.listModel(name, description, price).send({ from: userAccount });
        alert('Model listed successfully');
        fetchModels(); // Refresh model list
    } catch (err) {
        console.error('Error listing model', err);
    }
};

// Purchase a model
async function purchaseModel(modelId) {
    const model = await contract.methods.getModelDetails(modelId).call();
    const price = model[2]; // Price in wei

    try {
        await contract.methods.purchaseModel(modelId).send({
            from: userAccount,
            value: price
        });
        alert('Model purchased successfully');
    } catch (err) {
        console.error('Error purchasing model', err);
    }
}

// Rate a model
document.getElementById('rateModelForm').onsubmit = async (e) => {
    e.preventDefault();
    const modelId = document.getElementById('modelIdToRate').value;
    const rating = document.getElementById('modelRating').value;

    if (rating < 0 || rating > 5) {
        alert('Рейтинг должен быть от 0 до 5');
        return;
    }

    try {
        await contract.methods.rateModel(modelId, rating).send({ from: userAccount });
        alert('Модель успешно оценена');
    } catch (err) {
        console.error('Ошибка при оценке модели', err);
        alert('Не удалось оценить модель');
    }
};



// View model details
document.getElementById('viewModelButton').onclick = async () => {
    const modelId = document.getElementById('modelIdToView').value;
    const model = await contract.methods.getModelDetails(modelId).call();
    const averageRating = model[4]; // Average rating

    document.getElementById('modelDetails').innerHTML = `
        <h3>${model[0]}</h3>
        <p>${model[1]}</p>
        <p>Price: ${web3.utils.fromWei(model[2], 'ether')} ETH</p>
        <p>Average Rating: ${averageRating}</p>
    `;
};

// Withdraw funds (for creators)
document.getElementById('withdrawFundsButton').onclick = async () => {
    try {
        await contract.methods.withdrawFunds().send({ from: userAccount });
        alert('Funds withdrawn successfully');
    } catch (err) {
        console.error('Error withdrawing funds', err);
    }
};

// Fetch models and display them
async function fetchModels() {
    const modelListDiv = document.getElementById('modelList');
    const modelCount = await contract.methods.models.length().call();

    modelListDiv.innerHTML = ''; // Clear previous list

    for (let i = 0; i < modelCount; i++) {
        const model = await contract.methods.getModelDetails(i).call();
        const modelDiv = document.createElement('div');
        modelDiv.className = 'model';
        modelDiv.innerHTML = `
            <h3>${model[0]}</h3>
            <p>${model[1]}</p>
            <p>Price: ${web3.utils.fromWei(model[2], 'ether')} ETH</p>
            <button onclick="purchaseModel(${i})">Purchase</button>
        `;
        modelListDiv.appendChild(modelDiv);
    }
}
