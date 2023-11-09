class MemoryGameTile {
  bool isUncovered;
  int tileIndex;
  final String imagePath;
  MemoryGameTile(
      {required this.tileIndex,
      required this.imagePath,
      this.isUncovered = false});
}
