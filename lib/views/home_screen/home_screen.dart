import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sizer/sizer.dart';
import 'package:to_do_app/constants/constants.dart';
import 'package:to_do_app/gen/assets.gen.dart';
import 'package:to_do_app/views/widgets/textwidget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime focusedDay = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Adaptive.h(1),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Adaptive.w(5)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black,
                ),
                gapLarge,
                Textwid(
                  text: "Hi, Paulwalker",
                  size: 18,
                  textBold: FontWeight.w500,
                ),
                gap,
                Image.asset(Assets.images.handlogo.path)
              ],
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Search Your Tasks",
                suffixIcon: Icon(Icons.search),
                fillColor: pureWhite,
                filled: true,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onChanged: (value) {},
            ),
            gapLarge,
            Align(
              alignment: Alignment.topLeft,
              child: Textwid(
                text: "Todays tasks",
                size: 17,
                textBold: FontWeight.w800,
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Textwid(
                      text: "Task Progress",
                      size: 16,
                      textBold: FontWeight.w600,
                    ),
                    gap,
                    Textwid(
                      text: "3/7 Tasks Completed Today",
                      size: 15,
                      textBold: FontWeight.w500,
                    ),
                    gap,
                    Textwid(
                      text: "Completed %",
                      size: 14,
                      textBold: FontWeight.w400,
                    ),
                    gap,
                    LinearPercentIndicator(
                      percent: 0.5,
                      trailing: Textwid(
                        text: "5 %",
                      ),
                      backgroundColor: Colors.grey,
                      progressColor: Color(0xFF82549C),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              color: Color(0xFFD4BEE4),
              child: EasyDateTimeLinePicker(
                focusedDate: focusedDay,
                firstDate: DateTime(2024, 3, 18),
                lastDate: DateTime(2030, 3, 18),
                  dayElementsOrder: const [DayElement.middle(),DayElement.bottom()],
                  
                onDateChange: (date) {
                  // Handle the selected date.
                },
              ),
              
            ),
            
            gapLarge,

 _buildCategoryFilters(),
           gapLarge,
        
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Textwid(
                        text: "Today's tasks",
                        size: 17,
                        textBold: FontWeight.w800,
                      ), 
                TextButton(
                  onPressed: () {},
                  child: 
                  Textwid(text: "See all >",
                  textColor: Colors.purple,
                  size:14,
                  textBold:FontWeight.w600,
                  
                  ),
                ),
              ],
            ),
  
   Expanded(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return TaskCard(); // **Updated to use TaskCard widget**
                },
              ),
            ),
          ],
        ),
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xFF82549C),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );




    
  }
}
 Widget _buildCategoryFilters() {
    final categories = ["All", "Personal", "Work", "Goals", "Birthday", "new", "new"];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: categories.map((category) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                color: category == "Personal" ? Color(0xFF82549C) : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(5),
              ),
            
            child: Textwid(
                        text: "${category}",
                        size: 14,
                        textBold: FontWeight.w400,
                        textColor: category == "Personal" ? Colors.white : Colors.black,
                      ),
            ),
          );
        }).toList(),
      ),
    );
  }
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Textwid(text: "Meeting with UI/UX team")),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Textwid(text: "Lorem ipsum dolor sit amet consectetur.")),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Textwid(text: "🕒 08:00pm")),
                        ],
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
                    child: isExpanded
                        ? SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(Icons.arrow_forward, color: Colors.white),
                                Icon(Icons.calendar_today, color: Colors.white),
                                Icon(Icons.edit, color: Colors.white),
                                Icon(Icons.delete, color: Colors.white),
                              ],
                            ),
                        )
                        : Center(
                            child: Icon(Icons.arrow_forward, color: Colors.white),
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

   