import 'package:first_come_first_serve/data/process_methods.dart';
import 'package:first_come_first_serve/presentaion/widget/table.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ProcessMethods _processMethods = ProcessMethods();
  TextEditingController _controller = TextEditingController();
  final bool isplaying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shortest Remaining Time First'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                child: AlertDialog(
                  title: Text('Add Number of processes'),
                  content: TextField(
                    controller: _controller,
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _processMethods
                              .createProcesses(int.parse(_controller.text));
                        });
                        Navigator.pop(context);
                      },
                      child: Text('Done'),
                      style: ElevatedButton.styleFrom(primary: Colors.green),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
      body: ListView(
        children: [
          ProcessesTable(
            processes: _processMethods.porcess,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isplaying ? Icons.stop : Icons.play_arrow),
        onPressed: () {},
      ),
    );
  }
}
