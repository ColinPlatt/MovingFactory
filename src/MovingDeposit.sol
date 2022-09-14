// SPDX-License-Identifier: The Unlicense
pragma solidity ^0.8.13;


import {Create2} from './openzeppelin-contracts/utils/Create2.sol';

// This contract uses Create2 to calculate where the next deployment will be. Rather than using a typical factory, the user always deposits to the last contract (marked valid) and all funds in the contract and the contract logic move to the next address. 

contract MovingDeposit {

    address immutable nextAddress;
    bool isValid;







}
