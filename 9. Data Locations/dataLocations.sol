// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract DataLocations {

    struct User  {
        string name;
        uint8 age;
    }

    User public employes;
    User public students;
    User public governents;

    function  users() public view returns(User memory) {
        User memory parent = employes;

        parent.name = "Bapak Fardan Nurhidayat" ;
        parent.age = 23;

        return parent;
    }


    function setEmployes(string memory _name , uint8 _age) public{
        employes.name = _name;
        employes.age = _age;
        
    }

    function setStudents(string memory _name  , uint8 _age) public {
        students.name = _name ; 
        students.age = _age;
    }

    function getStudents() public view  returns(User memory){
        return  students;
    }

    function getEmployes() public view returns (User memory) {
        return employes;
    }
  
}