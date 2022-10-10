import 'package:flutter/material.dart';

class StepContent extends StatelessWidget {
  const StepContent(
      {Key? key,
      this.content,
      this.controls,
      this.isLast = false,
      this.index,
      this.currentStep})
      : super(key: key);

  final Widget? content;
  final Widget? controls;
  final bool? isLast;
  final int? index;
  final int? currentStep;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 28),
      decoration: BoxDecoration(
          border: !isLast! ? Border(left: BorderSide(color: Colors.grey.shade400, width: 1)) : null) ,
      child: Row(
        children: [
          SizedBox(
            width: 25
          ),
          Visibility(
            visible: index == currentStep,
            replacement: const SizedBox(
              height: 24,
            ),
            child: Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: content ?? const SizedBox(),
                  ),
                  controls ?? const SizedBox(),
                  SizedBox(height: 20,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
