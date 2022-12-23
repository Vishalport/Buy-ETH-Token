// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.0;

interface IERC20 {
    // function totalSupply() external view returns(uint256);
    function balanceOf(address account) external view returns(uint256);
    function transfer(address recipient, uint256 account) external returns(bool);

    event Transfer(address indexed from, address indexed to, uint256 value);
}

contract CGCToken is IERC20 {
    string public constant name = "CGCToken";
    string public constant symbol = "CGCT";
    uint8 public constant decimals = 0;

    event Approval(address indexed toOwner,  address indexed spender, uint tokens);
    event Transfer(address indexed from, address indexed to, uint tokens);

    mapping(address => uint256) balance;

    mapping(address => mapping(address => uint256)) allowed;

    uint256 totalSupply_ = 1000 wei;

    constructor() public {
        balance[msg.sender] = totalSupply_;
    }

    function balanceOf(address tokenOwner) public override view returns(uint256) {
        return balance[tokenOwner];
    }

    function transfer(address receiver, uint256 numToken) public override returns(bool) {
        require(numToken <= balance[msg.sender]);
        balance[msg.sender] -= numToken;
        balance[receiver] += numToken;
        emit Transfer(msg.sender, receiver, numToken);
        return true;
    }
  
}