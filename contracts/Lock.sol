// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract PlayLudo{
    /* 
    this contracts lets us play ludo
    
    Write a contract that uses a pseudorandom generator to play ludo. 
    Basically, implement a simple version of the ludo map and also focus mainly on the dice throwing algorithm. 
    There is no strict design to this. You can use any design method you want.

    Basically players begi the game by

    1. joining and choosing colors
    2. rolls dice
    
     */
    uint256 numberOfPlayers;
     struct Player{
        address player;
        string color;
     }

     Player[] allPlayers;
     
     mapping(address => bool) hasJoined;
     mapping(uint256 => Player) playerID;

     constructor()

     function joinGame() external{
        // require the msg.sender has not joined

     }

     function playGame() external{

     }

     function exitGame() external{

     }


     function movePosition() external{

     }


}