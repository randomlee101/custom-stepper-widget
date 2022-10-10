import 'package:flutter/material.dart';

class StepHeader extends StatelessWidget {
  const StepHeader(
      {Key? key,
      this.title,
      this.index,
      this.isActive,
      this.subtitle,
      this.isComplete})
      : super(key: key);

  final String? title;
  final String? subtitle;
  final int? index;
  final bool? isActive;
  final bool? isComplete;

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Row(
        children: [
          Container(
            height: 24,
            width: 24,
            margin: EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive ?? false ? Colors.blue : Colors.grey),
            child: Center(
              child: isComplete ?? false
                  ? Icon(
                  Icons.check,
                  color: isActive ?? false ? Colors.white : Colors.grey,
                  size: 14,
                    )
                  : Text(
                      "${(index ?? 0) + 1}",
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$title",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              Visibility(
                  visible: subtitle != null && subtitle!.isNotEmpty,
                  replacement: SizedBox.shrink(),
                  child: Text("$title"))
            ],
          ),
        ],
    ),
      );
  }
}
