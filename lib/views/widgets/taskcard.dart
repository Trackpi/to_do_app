import 'package:flutter/material.dart';
import 'package:to_do_app/views/widgets/textwidget.dart';

class TaskCard extends StatefulWidget {
  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Radio(
                        value: 1,
                        groupValue: null, // Handle selection logic
                        onChanged: (value) {},
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Textwid(text: "Meeting with UI/UX team"),
                            Textwid(text: "Lorem ipsum dolor sit amet consectetur."),
                            Textwid(text: "🕒 08:00pm"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    width: isExpanded ? 120 : 40,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 236, 196, 243),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRect(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.arrow_forward, color: Colors.white),
                            if (isExpanded) ...[
                              Icon(Icons.calendar_today, color: Colors.white),
                              Icon(Icons.edit, color: Colors.white),
                              Icon(Icons.delete, color: Colors.white),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
