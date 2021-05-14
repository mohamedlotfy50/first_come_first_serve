import 'dart:math';

import '../model/chart.dart';
import '../model/process.dart';

class ProcessMethods {
  List<Process> process = [];
  List<Chart> chart = [];
  double averageTurnAroundTime = 0;
  double averageWaitingTime = 0;

  void createProcesses(int numberOfProcesses) {
    process.clear();
    for (int i = 1; i <= numberOfProcesses; i++) {
      process.add(
        Process(
          id: i,
          arrivalTime: Random().nextInt(10),
          burstTime: Random().nextInt(9) + 1,
        ),
      );
    }
  }

  void sortProcesses() {
    process.sort((p1, p2) {
      if (p1.arrivalTime.compareTo(p2.arrivalTime) == 0) {
        return p1.id.compareTo(p2.id);
      }
      return p1.arrivalTime.compareTo(p2.arrivalTime);
    });
  }

  void firstcomefirstServe() {
    chart.clear();
    averageTurnAroundTime = 0;
    averageWaitingTime = 0;
    int _currentTime = 0;
    for (Process p in process) {
      if (p.arrivalTime > _currentTime) {
        chart.add(
          Chart(processID: null, from: _currentTime, to: p.arrivalTime),
        );
        _currentTime = p.arrivalTime;
      }
      chart.add(Chart(
          processID: p.id, from: _currentTime, to: _currentTime + p.burstTime));
      _currentTime += p.burstTime;
      p.turnAroundTime = _currentTime - p.arrivalTime;
      p.waitingTime = p.turnAroundTime - p.burstTime;
    }
    calculateTheAverage();
  }

  void calculateTheAverage() {
    int _length = process.length;

    for (Process p in process) {
      averageTurnAroundTime += p.turnAroundTime;
      averageWaitingTime += p.waitingTime;
    }
    averageTurnAroundTime /= _length;
    averageWaitingTime /= _length;
  }
}
