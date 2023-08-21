import 'package:chess/components/piece.dart';
import 'package:chess/values/colors.dart';
import 'package:flutter/material.dart';

class Square extends StatelessWidget {
  final bool isWhite;
  final ChessPiece? piece;
  final bool isSelected;
  final void Function()? onTap;

  const Square({Key? key,
    required this.isWhite,
    required this.piece,
    required this.isSelected,
    required this.onTap
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? squareColor;
    //if selected, square is green

    if(isSelected){
      squareColor  = Colors.green;
    }
    // otherwise, it's  white or black
    else{
      squareColor = isWhite ? foregroundColor : backgroundColor;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: squareColor,
        child: piece != null
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  piece!.imagePath,
                  color: piece!.isWhite ? Colors.white : Colors.black,
                ),
              )
            : null,
      ),
    );
  }
}

