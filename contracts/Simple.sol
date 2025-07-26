// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract Simple {

    address[] public users;
    mapping(address => bool) public isUser;

    struct Demat {
        uint cid;
        string shareName;
        uint price;
    }

    mapping(address => Demat[]) public userToDemat;

    function addUser() public {

        require(!isUser[msg.sender], "Already registered");
        users.push(msg.sender);
        isUser[msg.sender] = true;
    }

    function buyShare(string memory _shareName, uint _cid, uint _price) public {

        Demat memory yourDemat = Demat(_cid, _shareName, _price);
        userToDemat[msg.sender].push(yourDemat);
    }

    function getMyShares() public view returns (Demat[] memory) {

        return userToDemat[msg.sender];
    }
}


