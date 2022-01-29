pragma solidity ^0.8.11;

contract timekeeper {
    //struct
    //want to register activities with some basic information, time spent on it and the name of activity, and time when registred.
    struct database_input {
        string _activityName;
        uint _timeSpent;
        uint _datetime;
    } 
    uint accIndex;
    address owner;
    //admin access, for removing activities to start with, probably going to expand to some payment system.
    constructor () {
        owner = msg.sender;
    }

    modifier onlyOwner () {
        require(msg.sender == owner, "you are not the owner");
        _;
    }

    //mappings 
    //want there to be a index based on the the account and number of registrations per that account.
    //right now the index is general.
    mapping (address => mapping (uint => database_input)) public accountActivities;


    //events

    //functions
    //register an activity
   function registerActivity (string memory _activityName, uint _timeSpent) public {
       accountActivities[msg.sender][accIndex]._activityName = _activityName;
       accountActivities[msg.sender][accIndex]._timeSpent = _timeSpent;
       accountActivities[msg.sender][accIndex]._datetime = block.timestamp;
       accIndex++;
   }
    //remove activity
   function removeOwnActivity (uint _index) public {
       accountActivities[msg.sender][_index]._activityName = " ";
       accountActivities[msg.sender][_index]._timeSpent = 0;
       accountActivities[msg.sender][_index]._datetime = 0;
   }
    //remove other activity, uses the modifier onlyOwner. 
    function removeOtherActivity (address _registrator, uint _index) onlyOwner public {
        accountActivities[_registrator][_index]._activityName = " ";
        accountActivities[_registrator][_index]._timeSpent = 0;
        accountActivities[_registrator][_index]._datetime = 0;
    }
}
