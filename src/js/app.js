App = {
  web3Provider: null,
  contracts: {},

  init: function() {

    return App.initWeb3();
  },

  initWeb3: function() {
     // Is there an injected web3 instance?
    if (typeof web3 !== 'undefined') {
      App.web3Provider = web3.currentProvider;
    } else {
      // If no injected web3 instance is detected, fall back to Ganache
      App.web3Provider = new Web3.providers.HttpProvider('http://localhost:8545');
    }
    web3 = new Web3(App.web3Provider);
    return App.initContract();
  },

  initContract: function() {
       $.getJSON('LUV.json', function(data) {
    // Get the necessary contract artifact file and instantiate it with truffle-contract
    var LUVArtifact = data;
    App.contracts.LUV = TruffleContract(LUVArtifact);

    // Set the provider for our contract
    App.contracts.LUV.setProvider(App.web3Provider);

    // Use our contract to retrieve and mark the adopted pets
    //return App.markAdopted();
  });


    return App.bindEvents();
  },

  bindEvents: function() {
    $(document).on('click', '.btn-add', App.handleAdd);
  },


  handleAdd: function(event) {
    event.preventDefault();
    var LUVInstance;
    var userName = document.getElementById("userID");
    // var userNAme= $('#userID');
    console.log(userName);
   // var petId = parseInt($(event.target).data('id'));

  web3.eth.getAccounts(function(error, accounts) {
    if (error) {
      console.log(error);
    }

    var account = accounts[0];
console.log(account);
    App.contracts.LUV.deployed().then(function(instance) {
     LUVInstance = instance;

      // Execute adopt as a transaction by sending account
      return LUVInstance.setUser(account, userName);
    }).then(function(result) {
     console.log(result)
    }).catch(function(err) {
      console.log(err.message);
    });
  });
  }
 

};

$(function() {
  $(window).load(function() {
    App.init();
  });
});
