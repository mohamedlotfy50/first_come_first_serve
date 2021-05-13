import 'package:flutter/foundation.dart';

class Process {
  final int id;
  final int arrivalTime;
  int burstTime;
  int completionTime;
  int turnAroundTime;
  int waitingTime;
  int responseTime;

  Process({
    @required this.id,
    @required this.arrivalTime,
    this.burstTime,
    this.completionTime,
    this.turnAroundTime,
    this.waitingTime,
    this.responseTime,
  });
  bool isShorter(Process process) {
    return burstTime > process.burstTime;
  }
}
