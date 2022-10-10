import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tyrads_stepper/new_home.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentStep = 0;
  final MethodChannel platform =
      const MethodChannel("com.randomlee.tyrads_stepper/steps");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Steps"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NewHome()));
        },
        child: const Icon(Icons.open_in_new),
      ),
      body: FutureBuilder(
          future: platform.invokeMethod("getSteps"),
          builder: (context, snapshot) {
            while (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            List steps = [];
            if(snapshot.hasData) steps = jsonDecode(snapshot.data as String);
            return Stepper(
              currentStep: currentStep,
              steps: steps
                  .map(
                    (e) => Step(
                        isActive: currentStep > e["id"] - 1,
                        state: currentStep > e["id"]
                            ? StepState.complete
                            : StepState.indexed,
                        title: Text(e["title"]),
                        subtitle: e["subtitle"].isNotEmpty ? Text(e["subtitle"]) : null,
                        content: Align(alignment: Alignment.centerLeft,child: Text(e["content"]))),
                  )
                  .toList(),
              onStepTapped: (e){
                setState(() {
                  currentStep = e;
                });
              },
              controlsBuilder: (context, details) => Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () => setState(() {
                              if (currentStep < 2) currentStep++;
                            }),
                        child: Text(currentStep < 2 ? "CONTINUE" : "FINISH")),
                  ),
                  Expanded(
                    child: TextButton(
                        onPressed: currentStep == 0
                            ? null
                            : () => setState(() {
                                  if (currentStep > 0) currentStep--;
                                }),
                        child: const Text("BACK")),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
