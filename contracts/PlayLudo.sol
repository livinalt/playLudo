// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract PlayLudo {
    /* 
    This contract allows players to play a simplified version of Ludo.
    
    1. Players join the game and choose colors.
    2. Players take turns to roll the dice.
    */

    uint256 public maxPlayers = 4;  
    uint256 public playerCount = 0; 

    struct Player {
        address playerAddress;
        string color;
    }

    Player[] public allPlayers;

    mapping(address => bool) public hasJoined;
    mapping(address => Player) public playerDetails;
    mapping(uint8 => Player) public playerIndex;

    constructor(uint256 _numberOfPlayers) {
        require(_numberOfPlayers <= maxPlayers, "Max players allowed is 4.");
        maxPlayers = _numberOfPlayers;
    }

    function joinGame() external {

        require(!hasJoined[msg.sender], "already joined  game.");
        
        require(playerCount < maxPlayers, "Maximum players reached.");

        hasJoined[msg.sender] = true;

        playerCount++;

        //use chainlink to get colors
        //_color = "";

        Player memory newPlayer = Player({
            playerAddress: msg.sender,
            color: _color
        });

        playerDetails[msg.sender] = newPlayer;
        allPlayers.push(newPlayer);
    }

     function playGame() external {

        // 
        require(playerCount == maxPlayers, "Waiting forother to join.");
        require(allPlayers[currentTurn].playerAddress == msg.sender, "wait, not your turn.");
        require(playerIndex[msg.sender] < 4, "Invalid");

        uint8 diceRoll = uint8((block.timestamp % 6) + 1);

        Player storage currentPlayer = allPlayers[currentTurn];
        //
        

        if (diceRoll != 6) {
            nextTurn();
        }
    }


     function exitGame() external{

        hasJoined[msg.sender] = true;

        playerCount --;

     }


     function movePosition() external{

     }

     function nextTurn() internal {
        currentTurn = (currentTurn + 1) % playerCount; 
    }


}