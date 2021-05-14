import 'package:flutter/material.dart';

import '../../model/process.dart';

class ProcessesTable extends StatelessWidget {
  final List<Process> processes;

  const ProcessesTable({Key key, @required this.processes}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return processes.isNotEmpty
        ? DataTable(
            columns: [
              DataColumn(
                  label: Text('Process ID'),
                  numeric: true,
                  tooltip: 'Process ID'),
              DataColumn(
                  label: Text('Arrival Time'),
                  numeric: true,
                  tooltip: 'Arrival Time'),
              DataColumn(
                  label: Text('Burst Time'),
                  numeric: true,
                  tooltip: 'Burst Time'),
              DataColumn(
                  label: Text('Turn Around Time'),
                  numeric: true,
                  tooltip: 'Turn Around Time'),
              DataColumn(
                  label: Text('Waiting Time'),
                  numeric: true,
                  tooltip: 'Waiting Time'),
            ],
            rows: processes
                .map(
                  (p) => DataRow(
                    cells: [
                      DataCell(Text(
                        'P${p.id}',
                      )),
                      DataCell(Text('${p.arrivalTime}')),
                      DataCell(Text('${p.burstTime}')),
                      DataCell(Text('${p.turnAroundTime}')),
                      DataCell(Text('${p.waitingTime}')),
                    ],
                  ),
                )
                .toList(),
          )
        : Container();
  }
}
