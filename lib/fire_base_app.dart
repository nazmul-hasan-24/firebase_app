import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/match_details_screen.dart';
import 'package:firebase/team_details.dart';
import 'package:flutter/material.dart';

class FirebaseStudentApp extends StatelessWidget {
  const FirebaseStudentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MatchDetail(),
    );
  }
}

class MatchDetail extends StatefulWidget {
  const MatchDetail({super.key});

  @override
  State<MatchDetail> createState() => _MatchDetailState();
}

class _MatchDetailState extends State<MatchDetail> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  List<MatchDetails> matchDetailsList = [];
  Future<void> getResult() async {
    QuerySnapshot result = await firebaseFirestore.collection('football').get();
    for (QueryDocumentSnapshot element in result.docs) {
      MatchDetails matchDetail = MatchDetails(element.get("team2"),
          element.get('goal'), element.get('time'), element.get('totalTime'));
      matchDetailsList.add(matchDetail);
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    getResult();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Match list"),
      ),
      body: ListView.builder(
        itemCount: matchDetailsList.length,
        itemBuilder: (context, index) {
          final indexd = matchDetailsList[index];
          return ListTile(
            title: Text(indexd.team),
            trailing: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MatchDetailsScreen(
                        teamName: indexd.team,
                        goal: indexd.goal,
                        time: indexd.time,
                        totalTime: indexd.totalTime,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.arrow_forward_outlined)),
          );
        },
      ),
    );
  }
}
