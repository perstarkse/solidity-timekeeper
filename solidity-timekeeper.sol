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

    //mappings 
    //want there to be a index based on the the account and number of registrations per that account
    //right now the index is general
    mapping (address => mapping (uint => database_input)) public accountActivities;

    //events

    //functions
    //register an activity
   function register_activity (string memory _activityName, uint _timeSpent) public {
       accountActivities[msg.sender][accIndex]._activityName = _activityName;
       accountActivities[msg.sender][accIndex]._timeSpent = _timeSpent;
       accountActivities[msg.sender][accIndex]._datetime = block.timestamp;
       accIndex++;
   }
}
