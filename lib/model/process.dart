import 'package:flutter/foundation.dart';

class Process {
  final int id;
  final int arrivalTime;
  int burstTime;
  int turnAroundTime;
  int waitingTime;

  Process({
    @required this.id,
    @required this.arrivalTime,
    this.burstTime,
    this.turnAroundTime = 0,
    this.waitingTime = 0,
  });
  bool isShorter(Process process) {
    return burstTime > process.burstTime;
  }
}
