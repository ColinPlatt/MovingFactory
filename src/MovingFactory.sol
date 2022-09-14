// SPDX-License-Identifier: The Unlicense
pragma solidity 0.8.15;

import {CREATE3} from "solmate/utils/CREATE3.sol";

contract MovingFactory {

    event NewLocation(address newLocation);

    function getNext() public view returns (address) {
        return CREATE3.getDeployed(bytes32(bytes20(address(this))));
    }

    function deployFromImage(bytes calldata depCode) public returns (address newLoc) {
        newLoc = CREATE3.deploy(
            bytes32(bytes20(address(this))),
            depCode,
            0
        );

        require(keccak256(newLoc.code) == keccak256(address(this).code), "INVALID_LAUNCH");

        emit NewLocation(newLoc);
    }

    function removeOld() public {
        require(getNext().code.length != 0, "This is the latest");

        selfdestruct(payable(address(this)));
    }

}