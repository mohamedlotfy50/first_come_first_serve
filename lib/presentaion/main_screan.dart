import 'package:flutter/material.dart';

import '../data/process_methods.dart';
import 'widget/table.dart';

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
        title: Text('First come First Serve'),
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
                          _processMethods.createProcesses(
                              int.tryParse(_controller.text) ?? 0);
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
            processes: _processMethods.process,
          ),
          if (_processMethods.averageTurnAroundTime > 0)
            Text(
                'AverageTurnAroundTime = ${_processMethods.averageTurnAroundTime} units'),
          if (_processMethods.averageWaitingTime > 0)
            Text(
                'AverageWaitingTime = ${_processMethods.averageWaitingTime} units'),
          Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ..._processMethods.chart.map((e) {
                  if (e.processID == null) {
                    return Placeholder();
                  }
                  return Container(
                    child: Row(
                      children: [
                        Text('${e.from}'),
                        SizedBox(width: 5),
                        Text('p${e.processID ?? "no"}'),
                        SizedBox(width: 5),
                        Text('${e.to}'),
                      ],
                    ),
                  );
                }).toList(),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isplaying ? Icons.stop : Icons.play_arrow),
        onPressed: () {
          setState(() {
            _processMethods.sortProcesses();
            _processMethods.firstcomefirstServe();
          });
        },
      ),
    );
  }
}
