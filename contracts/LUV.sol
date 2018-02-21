   import "./sendTracker.sol";
contract LUV is sendTracker {

    //todo do something with ether
    function () payable{
        //if ether is sent to this address, send it back.
        throw;
    }

    /* Public variables of the token */

    /*
    NOTE:
    The following variables are OPTIONAL vanities. One does not have to include them.
    They allow one to customise the token contract & in no way influences the core functionality.
    Some wallets/interfaces might not even bother to look at this information.
    */
    string public name;            //fancy name: eg Simon Bucks
    uint8 public decimals;                //How many decimals to show. ie. There could 1000 base units with 3 decimals. Meaning 0.980 SBX = 980 base units. It's like comparing 1 wei to 1 ether.
    string public symbol;                 //An identifier: eg SBX
    uint256 public unitsOneEthCanBuy;    // How many units of your coin can be bought by 1 ETH?
    string public version = 'H1.0';       //human 0.1 standard. Just an arbitrary versioning scheme.


//make sure this function name matches the contract name above. So if you're token is called TutorialToken, make sure the //contract name above is also TutorialToken instead of ERC20Token

    function Lovecoin () {
       // users[msg.sender].balance  = 100000000;               // Give the creator all initial tokens (100000 for example)
        totalSupply = 100000000;                        // Update total supply (100000 for example)
        totalUnallocated=100000000;
        name = "Lovecoin";                                   // Set the name for display purposes
        decimals = 0;                            // Amount of decimals for display purposes
        symbol = "LUV";                               // Set the symbol for display purposes
        unitsOneEthCanBuy = 1;   
    }

//for people to buy LUV
    function buyLUV()
        public
        payable
        returns (uint)
    {
      
    }
    
  // add LUV to total supply
  function addLUV() {
            if( totalSupply<7000000000){
                //balances[msg.sender] =totalSupply+100000000 ;               // Give the creator all initial tokens (100000 for example)
                totalSupply = totalSupply+100000000;                        // Update total supply (100000 for example)
                totalUnallocated = totalUnallocated+100000000;
            }
      
    }
    

}
