// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {ERC20} from "../src/ERC20.sol";
import {Proxy} from "../src/Proxy.sol";
import {Attack} from "../src/Attack.sol";

contract ReviewTest is Test {
    ERC20 public erc20Logic;
    Proxy public proxy;
    Attack public attack;

    address public owner = makeAddr("owner");
    address public user1 = makeAddr("user1");
    address public user2 = makeAddr("user2");

    function setUp() public {
        erc20Logic = new ERC20();
        proxy = new Proxy(address(erc20Logic), owner);
        attack = new Attack(address(proxy));
        

        deal(address(erc20Logic), user1, 1 ether);
    }

   function test_exploit() public {
        attack.exploitProxy(user1, user2, 1 ether);
    }

}
