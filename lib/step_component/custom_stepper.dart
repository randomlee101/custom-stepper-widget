import 'package:flutter/material.dart';
import 'package:tyrads_stepper/step_component/step_content.dart';
import 'package:tyrads_stepper/step_component/step_header.dart';

class RandomStepper extends StatefulWidget {
  const RandomStepper({Key? key, this.steps, this.currentStep, this.onStepTap, this.controls})
      : super(key: key);

  final List? steps;
  final int? currentStep;
  final Widget? controls;
  final ValueChanged<int>? onStepTap;

  @override
  State<RandomStepper> createState() => _RandomStepperState();
}

class _RandomStepperState extends State<RandomStepper> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(widget.steps?.length ?? 0, (index) {
          var step = widget.steps;
          return InkWell(
            splashColor: Colors.transparent,
            onTap: (){
              widget.onStepTap!(index);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                StepHeader(
                  title: step?[index]["title"],
                  subtitle: step?[index]["subtitle"],
                  index: index,
                  isActive: widget.currentStep! > index - 1,
                  isComplete: widget.currentStep! > index,
                ),
                StepContent(
                  content: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(step?[index]["content"])),
                  index: index,
                  currentStep: widget.currentStep,
                  controls: widget.controls,
                  isLast: (index + 1) == step?.length,
                )
              ],
            ),
          );
        }));
  }
}
