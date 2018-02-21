pragma solidity ^0.4.4;
 
 import "./Token.sol";
contract Controlled is Token{
    address creator;
    function Controlled() public {
        creator =msg.sender;
    }
      
    // modifier
    
    modifier onlyCreator {
        // if the sender is the "admin" run whatever function (_;) else throw an exception
        require (msg.sender ==creator);
        _;
    }
    
    function kill() onlyCreator{
       
            selfdestruct(creator);
    
    }
      
}
