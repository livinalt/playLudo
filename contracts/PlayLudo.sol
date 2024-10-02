// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract PlayLudo {
    /* 
    This contract allows players to play a simplified version of Ludo.
    
    1. Players join the game and choose colors.
    2. Players take turns to roll the dice.
    3. Players advance based on their dice rolls.
    */

    uint8 public maxPlayers = 4;  
    uint256 public playerCount = 0; 
    uint256 public currentTurn = 0;  // tracks the current player's turn

    event DiceRolled(uint256 currentTurn, address indexed player, uint8 diceRoll, uint8 newPosition);

    struct Player {
        address playerAddress;
        string color;
        uint8 position;  // track player position on the board
    }

    Player[] public allPlayers;
    string[4] public availableColors = ["Red", "Green", "Blue", "Yellow"];
    mapping(address => bool) public hasJoined;
    mapping(address => Player) public playerDetails;

    constructor(uint8 _numberOfPlayers) {
        require(_numberOfPlayers <= maxPlayers, "Max players allowed is 4.");
        maxPlayers = _numberOfPlayers;
    }

    // Players join the game
    function joinGame() external {
        require(!hasJoined[msg.sender], "Already joined the game.");
        require(playerCount < maxPlayers, "Maximum players reached.");

        hasJoined[msg.sender] = true;
        string memory _color = availableColors[playerCount]; // Assigns available color

        Player memory newPlayer = Player({
            playerAddress: msg.sender,
            color: _color,
            position: 0  // All players start at position 0
        });

        playerDetails[msg.sender] = newPlayer;
        allPlayers.push(newPlayer);
        playerCount++;
    }

    function playGame() external {
        require(playerCount == maxPlayers, "Waiting for other players to join.");
        require(allPlayers[currentTurn].playerAddress == msg.sender, "Not your turn.");

        uint8 diceRoll = uint8((block.timestamp % 6) + 1);  // Simplified random roll (1 to 6)
        Player storage currentPlayer = allPlayers[currentTurn];
        
        // Move player based on the dice roll
        currentPlayer.position += diceRoll;

        emit DiceRolled(currentTurn, msg.sender, diceRoll, currentPlayer.position);
        
        // If the roll is not 6, move to the next turn
        if (diceRoll != 6) {
            nextTurn();
        }
    }

    // Handle players exiting the game (optional, simplified)
    function exitGame() external {
        require(hasJoined[msg.sender], "You are not in the game.");
        
        hasJoined[msg.sender] = false;
        playerCount--;

        // Remove player from the list and update the current turn
        for (uint i = 0; i < allPlayers.length; i++) {
            if (allPlayers[i].playerAddress == msg.sender) {
                delete allPlayers[i];
                break;
            }
        }

        if (currentTurn >= playerCount) {
            currentTurn = 0;
        }
    }

    // Function to move to the next turn
    function nextTurn() internal {
        currentTurn = (currentTurn + 1) % playerCount;
    }

    // For testing: View the current player details
    function getCurrentPlayer() external view returns (address player, string memory color, uint8 position) {
        Player memory currentPlayer = allPlayers[currentTurn];
        return (currentPlayer.playerAddress, currentPlayer.color, currentPlayer.position);
    }


}
