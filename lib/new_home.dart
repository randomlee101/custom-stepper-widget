import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tyrads_stepper/step_component/custom_stepper.dart';

class NewHome extends StatefulWidget {
  const NewHome({Key? key}) : super(key: key);

  @override
  State<NewHome> createState() => _NewHomeState();
}

class _NewHomeState extends State<NewHome> {
  int currentStep = 0;
  final MethodChannel platform = const MethodChannel("com.randomlee.tyrads_stepper/steps");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Custom Steps"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).pop();
        },
        child: const Icon(Icons.arrow_back),
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
            return RandomStepper(
              currentStep: currentStep,
              steps: steps,
              onStepTap: (e){
                  setState(() {
                    currentStep = e;
                  });
              },
              controls: Row(
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
