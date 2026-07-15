// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract FunctionModifier {
    // We will use these variables to demonstrate how to use
    // modifiers.
    address public owner;
    uint public x = 10;
    bool public locked;
    bool public isIncrease  = false;

    function increaseX(uint _x) public isIncreaseOrNot(_x) beIncrease(_x) {
    }

    modifier  isIncreaseOrNot(uint _x){
        if(_x>0){
            isIncrease = true;
        }else {
            isIncrease = false;
        }
        _;
    }

    modifier  beIncrease(uint _x){
        require(isIncrease, "Not Increase");
        _;
           x = x + _x;
    }
}