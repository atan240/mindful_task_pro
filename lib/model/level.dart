class Level {
  String? id;
  String? lvlName;
  String? imgPath;

  Level({
    required this.id,
    required this.lvlName,
    required this.imgPath,
  });

  static List<Level> LevelList() {
    return [
      Level(
          id: '1',
          lvlName: 'Level 1 - Rowlet',
          imgPath: 'assets/images/owl1.png'),
      Level(
          id: '2',
          lvlName: 'Level 2 - Dartrix',
          imgPath: 'assets/images/owl2.png'),
      Level(
          id: '3',
          lvlName: 'Level 3 - Decidueye',
          imgPath: 'assets/images/owl3.png'),
    ];
  }
}
