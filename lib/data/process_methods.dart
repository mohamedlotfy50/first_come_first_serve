import 'dart:math';

import 'package:first_come_first_serve/model/process.dart';

class ProcessMethods {
  List<Process> porcess = [];
  List<Process> sortedList = [];

  void createProcesses(int numberOfProcesses) {
    porcess.clear();
    for (int i = 1; i <= numberOfProcesses; i++) {
      porcess.add(
        Process(
          id: i,
          arrivalTime: Random().nextInt(10),
          burstTime: Random().nextInt(9) + 1,
        ),
      );
    }
  }

  void sortProcesses() {
    sortedList.clear();
  }
}
