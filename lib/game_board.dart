import 'package:chess/components/piece.dart';
import 'package:chess/components/square.dart';
import 'package:chess/helper/helper_method.dart';
import 'package:chess/values/colors.dart';
import 'package:flutter/material.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({Key? key}) : super(key: key);

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {

  //a 2D dimensional list respresenting the chessboard,
  // with each position possibly containing a chess piece.
  late List<List<ChessPiece?>> board;

  //The currently selected piece on the chessboard;
  //if no piece is selected, this is null
  ChessPiece? selectedPiece;

  //The row of the selected piece
  //Default value of -1 indicated no piece is currently selected
  int selectedRow = -1;

  //The column of the selected piece
  //Default value of -1 indicated no piece is currently selected
  int selectedCol = -1;

  //A list of valid moves for currently selected piece
  //each move is represented as a list with 2 elements: row and column
  List<List<int>> validmoves = [];

  @override
  initState() {
    super.initState();
    _initializeBoard();
  }

  //initialize board
  void _initializeBoard() {
    //initialize the board with null, meaning no pieces in those positions
    List<List<ChessPiece?>> newBoard =
    List.generate(8, (index) => List.generate(8, (index) => null));

    //place pawns
    for (int i = 0; i < 8; i++) {
      newBoard[1][i] = ChessPiece(
          type: ChessPieceType.pawn,
          isWhite: false,
          imagePath: 'images/pawn.png');

      newBoard[6][i] = ChessPiece(
          type: ChessPieceType.pawn,
          isWhite: true,
          imagePath: 'images/pawn.png');
    }
      //place rook
    newBoard[0][0] = ChessPiece(
        type: ChessPieceType.rook,
        isWhite: false,
        imagePath: 'images/rook.png');

    newBoard[0][7] = ChessPiece(
        type: ChessPieceType.rook,
        isWhite: false,
        imagePath: 'images/rook.png');

    newBoard[7][0] = ChessPiece(
        type: ChessPieceType.rook,
        isWhite: true,
        imagePath: 'images/rook.png');

    newBoard[7][7] = ChessPiece(
        type: ChessPieceType.rook,
        isWhite: true,
        imagePath: 'images/rook.png');

    //place Knight
    newBoard[0][1] = ChessPiece(
        type: ChessPieceType.knight,
        isWhite: false,
        imagePath: 'images/knight.png');

    newBoard[0][6] = ChessPiece(
        type: ChessPieceType.knight,
        isWhite: false,
        imagePath: 'images/knight.png');

    newBoard[7][1] = ChessPiece(
        type: ChessPieceType.knight,
        isWhite: true,
        imagePath: 'images/knight.png');

    newBoard[7][6] = ChessPiece(
        type: ChessPieceType.knight,
        isWhite: true,
        imagePath: 'images/knight.png');

    //place bishop
    newBoard[0][2] = ChessPiece(
        type: ChessPieceType.bishop,
        isWhite: false,
        imagePath: 'images/bishop.png');

    newBoard[0][5] = ChessPiece(
        type: ChessPieceType.bishop,
        isWhite: false,
        imagePath: 'images/bishop.png');

    newBoard[7][2] = ChessPiece(
        type: ChessPieceType.bishop,
        isWhite: true,
        imagePath: 'images/bishop.png');

    newBoard[7][5] = ChessPiece(
        type: ChessPieceType.bishop,
        isWhite: true,
        imagePath: 'images/bishop.png');

    //place queens
    newBoard[0][3] = ChessPiece(
        type: ChessPieceType.queen,
        isWhite: false,
        imagePath: 'images/queen.png');

    newBoard[7][4] = ChessPiece(
        type: ChessPieceType.queen,
        isWhite: true,
        imagePath: 'images/queen.png');

    //place king
    newBoard[0][4] = ChessPiece(
        type: ChessPieceType.king,
        isWhite: false,
        imagePath: 'images/king.png');

    newBoard[7][3] = ChessPiece(
        type: ChessPieceType.king,
        isWhite: true,
        imagePath: 'images/king.png');


    board = newBoard;
  }

  //USER SELECTED A PIECE
  void pieceSelected(int row, int col){
    setState(() {
      //selected a piece if there is a piece in that location
      if(board[row][col] != null){
        selectedPiece = board[row][col];
        selectedRow = row;
        selectedCol =col;

      }
      //if a piece is selected, calculate its valid move
      validmoves = calulateRawValidMove(selectedRow, selectedCol, selectedPiece);
      print('selexcted');
    });
  }

  //calculate raw valid move
  List<List<int>> calulateRawValidMove(int row, int col, ChessPiece? piece){
    List<List<int>> cadidateMoves = [];


    //different direction based on their color
    int direction = piece!.isWhite ? -1 : 1;

    switch(piece.type){
      case ChessPieceType.pawn:
        //pawn can move forward if the square is not occupied

      // pawn can move 2 square forward if they are at their intial positions

      //pawns can kill diagonally
        break;
      case ChessPieceType.rook:
        break;
      case ChessPieceType.knight:
        break;
      case ChessPieceType.bishop:
        break;
      case ChessPieceType.queen:
        break;
      case ChessPieceType.king:
        break;
    }

  }

  @override
  Widget build(BuildContext context) {
    // create a piece
    return Scaffold(
      backgroundColor: backgroundColor,
      body: GridView.builder(
          itemCount: 8 * 8,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),
          itemBuilder: (context, index) {
            // get the row and column position of the square
            int row = index ~/ 8;
            int col = index % 8;
            bool isSelected = selectedRow == row && selectedCol == col;

            return Square(
              isWhite: iswhite(index),
              piece: board[row][col],
              isSelected: isSelected,
              onTap: () =>  pieceSelected(row, col),
            );
          }),
    );
  }
}
