// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {

    event Deposite(address indexed account, uint amount);
    event Withdraw(address indexed account, uint amount);

    constructor() ERC20("MyToken", "MTK") {}

       fallback() external payable {
        deposite();
    }

    function deposit() public payable{
        _mint(msg.sender, msg.value);
        emit Deposite(msg.sender, msg.value);
    }

    function withdraw(uint _amount) external {
        _burn(msg.sender, _amount);
        payable(msg.sender).transfer(_amount);
        emit Withdraw(msg.sender, _amount);
    }
}

