pragma solidity ^0.4.4;
 
 import "./Controlled.sol";
 //tracks sends
contract sendTracker is Controlled  {
    
    //struct
    uint public totalSends=0; // number of times token was sent
    uint256 public totalSupply=100000;
    uint256 public totalUnallocated=100000;
    
    struct User{
        uint numSends;
        bytes16 userName;
         uint256 balance;
    }
    
   
    //mapping type  to  User struct 
    //using mapping we can search for a specific addy's data
    mapping (address => User) users;
    
    // need to create an array to track all users currently
    address[] public userAccts;
    
     //events
    event UserInfo(
        
        uint numSends,
        bytes16 userName,
        uint256 balance
    );
    
    function setUser (address _address, bytes16 _userName)  public {
            // todo add check to make sure account is unique and validate stuff
            
            //populate the struct
            
            var user = users[_address];
            user.numSends= 0;
            user.userName = _userName;
            totalUnallocated-=1000;
            user.balance = 1000;
            
            // ?
            userAccts.push(_address) -1;
            UserInfo(0,  _userName, 1000);
        }
        
        
        function getUsers () view public returns(address[]){
            return userAccts;
        }
        
        function getUser (address _address) view public returns(uint, bytes16){
            return(users[_address].numSends, users[_address].userName);
        }
        
        function countUsers() view public returns(uint){
            return userAccts.length;
        }
        
           function transfer(address _to, uint256 _value) returns (bool success) {
            //Default assumes totalSupply can't be over max (2^256 - 1).
            //If your token leaves out totalSupply and can issue more tokens as time goes on, you need to check if it doesn't wrap.
            //Replace the if with this one instead.
            //if (balances[msg.sender] >= _value && balances[_to] + _value > balances[_to]) {
           
            if ( users[msg.sender].balance >= _value && _value > 0) {
                users[msg.sender].balance -= _value;
                users[_to].balance += _value;
                Transfer(msg.sender, _to, _value);
                users[msg.sender].numSends += 1 ;
                totalSends += 1 ;
                return true;
            } else { return false; }
        }
        
         function balanceOf(address _owner) constant returns (uint256 balance) {
            return users[_owner].balance;
        }
        
           function numSendsOf(address _owner) constant returns (uint256 balance) {
            return users[_owner].numSends;
        }
       
        
  }
  