# PlayLudo Smart Contract

This is a Solidity smart contract that implements a simple of the Ludo board game, allowing up to 4 players to join and take turns rolling a dice to advance their positions.

## Contract Overview

The contract allows the following:
- Players can join the game and choose a color from available options (Red, Green, Blue, Yellow).
- Players take turns to roll a dice (values from 1 to 6).
- Players move forward on the board based on their dice roll.
- The game handles turns and ensures players play in sequence.
- A player can exit the game, and the game handles turn adjustments accordingly.

## Functions

### `constructor(uint8 _numberOfPlayers)`
- Initializes the contract by setting the maximum number of players.
- A maximum of 4 players is allowed.

### `joinGame()`
- Allows a player to join the game if they haven't already.
- Assigns an available color to the player.
- Adds the player to the game and increments the player count.

### `playGame()`
- Allows the current player to roll the dice.
- Moves the player based on the dice roll.
- Emits the `DiceRolled` event to notify about the current turn, dice roll, and new position.
- If the dice roll is not 6, the turn moves to the next player.

### `exitGame()`
- Allows a player to exit the game.
- Reduces the player count and adjusts the current turn if needed.

### `getCurrentPlayer()`
- Returns the current player's address, color, and position on the board.

### `nextTurn()`
- Moves the game to the next player's turn in a round-robin fashion.

## Events

### `DiceRolled(uint256 currentTurn, address indexed player, uint8 diceRoll, uint8 newPosition)`
- Emitted when a player rolls the dice.
- Provides the current turn, player address, dice roll value, and new position of the player.

## Deployment

The contract is deployed and verified on the Lisk Sepolia testnet:
[0xcfd76262150d39F66511a503cC2BD52cdfA5b08](https://sepolia-blockscout.lisk.com/address/0xcfd76262150d39F66511a503cC2BD52cdfA5b08C#code)

## License

This project is licensed under the MIT License.