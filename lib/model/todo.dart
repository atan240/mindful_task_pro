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





// class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
//   @override
//   bool get wantKeepAlive => true;

//   final todosList = ToDo.todoList();
//   List<ToDo> _foundToDo = [];
//   final _todoController = TextEditingController();

//   int completedTasks = 0; // Track the number of completed tasks

//   @override
//   void initState() {
//     _foundToDo = todosList;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 15),
//             child: searchBox(),
//           ),
//           // Container for the to-do list
//           Expanded(
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//               child: Column(
//                 children: [
//                   Expanded(
//                     child: ListView.builder(
//                       itemCount: _foundToDo.length +
//                           (_foundToDo.where((todo) => todo.isDone).length ~/ 5),
//                       itemBuilder: (context, index) {
//                         if (index < _foundToDo.length) {
//                           final todo = _foundToDo[index];
//                           return ToDoItem(
//                             todo: todo,
//                             onToDoChanged: _handleToDoChange,
//                             onDeleteItem: _deleteToDoItem,
//                           );
//                         } else {
//                           // Check if it's time to level up the pet
//                           if ((index - _foundToDo.length) % 5 == 0) {
//                             completedTasks += 5; // Increment completed tasks

//                             int level = (completedTasks ~/
//                                 5); // Calculate the pet level

//                             return Column(
//                               children: [
//                                 Text(
//                                   'My Pet',
//                                   style: TextStyle(
//                                     fontSize: 30,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.all(8.0),
//                                   child: Text(
//                                     'Complete more tasks to level up your pet! Your pet will level up after every 5 tasks completed.',
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                     ),
//                                   ),
//                                 ),
//                                 Text(
//                                   'Level $level',
//                                   style: TextStyle(
//                                     fontSize: 22,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                                 Image.asset(
//                                   'assets/images/owl$level.png', // Replace with your image path
//                                 ),
//                               ],
//                             );
//                           }

//                           return SizedBox
//                               .shrink(); // Return an empty SizedBox for other cases
//                         }
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
// // Container for "Add a new to-do item"
//           Container(
//             child: Row(children: [
//               Expanded(
//                 child: Container(
//                   margin: EdgeInsets.only(
//                     bottom: 10,
//                     right: 20,
//                     left: 20,
//                   ),
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 20,
//                     vertical: 5,
//                   ),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     boxShadow: const [
//                       BoxShadow(
//                         color: Colors.grey,
//                         offset: Offset(0.0, 0.0),
//                         blurRadius: 10.0,
//                         spreadRadius: 0.0,
//                       ),
//                     ],
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: TextField(
//                     controller: _todoController,
//                     decoration: InputDecoration(
//                         hintText: 'Add a new to-do item',
//                         border: InputBorder.none),
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(
//                   bottom: 10,
//                   right: 20,
//                 ),
//                 child: ElevatedButton(
//                   child: Text(
//                     '+',
//                     style: TextStyle(
//                       fontSize: 40,
//                     ),
//                   ),
//                   onPressed: () {
//                     _addToDoItem(_todoController.text);
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: tdBlue,
//                     minimumSize: Size(60, 60),
//                     elevation: 10,
//                   ),
//                 ),
//               ),
//             ]),
//           )
//         ],
//       ),
//     );
//   }
