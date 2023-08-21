bool iswhite(int index){
  int x = index ~/ 8; //this gives us the integer division ie. row
  int y = index % 8; // this gives us the remainder ie. column

  //alternate colors for each square
  bool iswhite = (x + y ) % 2 == 0;

  return iswhite;
}

bool inBoard(int row, int col){
  return row >= 0 && row < 8 && col >= 0 && col < 8
}