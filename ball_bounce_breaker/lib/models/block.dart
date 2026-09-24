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

List<Block> buildBlocks() {
  const columns = 5;

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
    for (int column = 0; column < columns; column++) {
      blocks.add(Block(row: row, column: column, color: color));
    }
  }

  return blocks;
}
