pragma solidity ^0.4.24;

contract Election {

  struct Vote {
    address from;
    string _hash;
    uint8 candidate;
  }

  struct Voter {
    address from;
    string _hash;
  }

  struct Candidate {
    string name;
    uint8 number;
    string party;
    string vice;
    Vote[] votes;
  }

  // this variable holds the constracts creator, which is the election's administrator
  address private owner;

  // these variables hold the election's deadlines (descriptions below)
  uint256 private insertLimit; // must be given in seconds since the contract's creation
  uint256 private joinLimit;   // must be given in seconds since the contract's creation
  uint256 private voteLimit;   // must be given in seconds since the contract's creation

  // this variable defines if the contract is running or not
  bool private _isOn;

  // the constructor must receive the election's deadlines:
  // uint256 _insertLimit : the limit to the administrator to insert candidates (the edition limit goes until the first vote enters)
  // uint256 _joinLimit   : the limit to another external account to subscribe to the election
  // uint256 _voteLimit   : the limit to external accounts to insert their votes
  constructor(
    uint256 _insertLimit, // must be given in seconds since the contract's creation
    uint256 _joinLimit,   // must be given in seconds since the contract's creation
    uint256 _voteLimit    // must be given in seconds since the contract's creation
  ) public {
    owner = msg.sender;
    insertLimit = now + _insertLimit;
    joinLimit = now + _joinLimit;
    voteLimit = now + _voteLimit;
    _isOn = true;
  }

  // this function destroys the contract forever (only use in emergency case)
  function shut_down() public {

    // only the admin can perform this action
    require(msg.sender == owner, 'This action can be performed only by the account which created the contract');
    _isOn = false;
  }

  // this function lets the owner to input candidates into the eldction database

}