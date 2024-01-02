import 'package:flutter/material.dart';

class MatchDetailsScreen extends StatelessWidget {
  final String teamName;
  final String goal;
  final String time;
  final String totalTime;
  const MatchDetailsScreen(
      {super.key,
      required this.teamName,
      required this.goal,
      required this.time,
      required this.totalTime});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(teamName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0).copyWith(),
        child: SizedBox(
          height: 120,
          width: double.infinity,
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(teamName),
                Text(goal),
                Text('Time: $time'),
                Text('Total Time: $totalTime')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
