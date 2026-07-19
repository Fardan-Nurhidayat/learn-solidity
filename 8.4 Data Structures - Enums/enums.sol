// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Enum {
    // Enum representing shipping status
    enum Status {
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }

    enum Size {
        S, 
        M, 
        L
    }

    enum Team {
        FE, 
        BE, 
        PM, 
        Desain,
        Devops
    }

    struct Employes {
        address id;
        string name;
        uint8 age; 
        Team team;
        bool isRegistered;
    }

    mapping(address => Employes) public employes;

    // Default value is the first element listed in
    // definition of the type, in this case "Pending"
    Status public status;
    Size public sizes;

    // Returns uint
    // Pending  - 0
    // Shipped  - 1
    // Accepted - 2
    // Rejected - 3
    // Canceled - 4
    function get() public view returns (Status) {
        return status;
    }

    // Update status by passing uint into input
    function set(Status _status) public {
        status = _status;
    }

    // You can update to a specific enum like this
    function cancel() public {
        status = Status.Canceled;
    }

    // delete resets the enum to its first value, 0
    function reset() public {
        delete status;
    }

    function getSize() public view returns (Size) {
        return sizes;
    }

    function setSize(Size _size) public {
        sizes = _size;
    }

    function registerEmploye(string memory _name , uint8 _age , Team _team , address _addr) public isRegistered(_addr) {
        employes[_addr] = Employes({
            id: _addr,
            name: _name,
            age: _age,
            team: _team,
            isRegistered: true
        });
    }

    function getEmployes(address _addr) public isUserRegistered(_addr) view returns(Employes memory)  {
        return employes[_addr];
    }

   function getTeam(uint id) public pure returns (Team) {
        return Team(id);
    }

    modifier isRegistered(address _addr){
        require(employes[_addr].isRegistered == false , "The employes has been register");
        _;
    }

    modifier isUserRegistered(address _addr){
        require(employes[_addr].isRegistered == true , "The employes has not been register");
        _;
    }

}