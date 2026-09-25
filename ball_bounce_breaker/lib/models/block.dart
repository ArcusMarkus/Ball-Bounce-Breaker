import 'package:flutter/material.dart';

class Block {
  final int row;
  final int column;
  final Color color;
  bool broken = false;

  Block({
    required this.row,
    required this.column,
    required this.color,
  });
}

// block layout used for collisions and for painting
const int blockColumns = 5;
const double blockGap = 6;
const double blockTopOffset = 50;
const double blockHeight = 18;

Rect blockRect(Block block, Size screenSize) {
  final blockWidth =
      (screenSize.width - (blockColumns + 1) * blockGap) / blockColumns;

  final top = blockTopOffset + block.row * (blockHeight + blockGap);
  final left = blockGap + block.column * (blockWidth + blockGap);

  return Rect.fromLTWH(left, top, blockWidth, blockHeight);
}

List<Block> buildBlocks() {
  // color list for block colors
  const rowColors = <Color>[
    Colors.red,
    Colors.deepOrange,
    Colors.orange,
    Colors.yellow,
    Color.fromARGB(255, 119, 255, 0),
    Colors.lightGreen,
    Colors.green,
    Colors.cyan,
    Colors.blue,
    Colors.purpleAccent,
    Colors.purple,
    Colors.deepPurple,
  ];

  final blocks = <Block>[];

  for (int row = 0; row < rowColors.length; row++) {
    final color = rowColors[row];
    for (int column = 0; column < blockColumns; column++) {
      blocks.add(Block(row: row, column: column, color: color));
    }
  }

  return blocks;
}
