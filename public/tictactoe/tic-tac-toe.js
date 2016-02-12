function TicTacToe() {
  this.player1 = true;
  this.board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]];
  this.turns = 0;
  this.board_spaces = ["r0c0", "r0c1", "r0c2", "r1c0", "r1c1", "r1c2", "r2c0", "r2c1", "r2c2"];
}

TicTacToe.prototype.play = function() {
  var self = this;
  this.board_spaces.forEach(function(space) {
    $("#" + space).click(function() {
      // Proceed if space has not been taken
      if (this.innerHTML === "") {
        $("#" + space).text(self.getSymbol());
        self.updateBoard(this);
        self.changePlayer();
        self.checkWinner(this);
      }
    });
  });
};

TicTacToe.prototype.checkWinner = function(cell) {
  row = (cell.id[1]);
  column = (cell.id[3]);
  // Check horizontal win
  if (this.board[row][0] == this.board[row][1] && this.board[row][1] == this.board[row][2]) {
    this.displayWinner(this.board[row][column] + " wins!");
  // Check vertical win
  } else if (this.board[0][column] == this.board[1][column] && this.board[1][column] == this.board[2][column]) {
    this.displayWinner(this.board[row][column] + " wins!");
  // Check diagonal wins
  } else if (this.board[0][0] == this.board[1][1] && this.board[1][1] == this.board[2][2]) {
      this.displayWinner(this.board[row][column] + " wins!");
  } else if (this.board[2][0] == this.board[1][1] && this.board[1][1] == this.board[0][2]) {
      this.displayWinner(this.board[row][column] + " wins!");
  // Check for cat's game
  } else if (this.turns == 9) {
    this.displayWinner("It's a tie!");
  }
};

TicTacToe.prototype.displayWinner = function(winnerText) {
  swal({
    title: winnerText,
    confirmButtonColor: "#47d1d1",
    imageUrl: "https://pbs.twimg.com/profile_images/479955426390196224/mB_v2TSf.png" });
  this.resetGame();
};

TicTacToe.prototype.resetGame = function() {
  this.board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]];
  this.board_spaces.forEach(function(space) {
    $("#" + space).text("");
  });
  this.player1 = true;
  this.turns = 0;
};

TicTacToe.prototype.updateBoard = function(cell) {
  row = (cell.id[1]);
  column = (cell.id[3]);
  this.board[row][column] = this.getSymbol();
};

TicTacToe.prototype.changePlayer = function() {
  this.player1 = !this.player1;
  this.turns += 1;
};

TicTacToe.prototype.getSymbol = function() {
  return this.player1 ? "X" : "O";
};
