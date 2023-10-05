class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Morning Excercise', isDone: true),
      ToDo(id: '02', todoText: 'Eat breakfast', isDone: true),
      ToDo(id: '03', todoText: 'Exercise'),
      ToDo(id: '04', todoText: 'Meet friend'),
      ToDo(id: '05', todoText: 'Feed dog'),
    ];
  }
}
