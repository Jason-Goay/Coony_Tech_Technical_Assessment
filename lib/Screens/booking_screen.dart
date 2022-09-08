import 'package:flutter/material.dart';
import 'package:my_app/utils/app_colors.dart';
import 'package:my_app/widgets/MyCard.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingScreen extends StatefulWidget {
  BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  CalendarFormat format = CalendarFormat.week;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  bool isSelectedDate = false;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
              child: Column(
            children: [
              Container(
                height: 80,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                            "assets/image/engineer_background_image.jpg"))),
                child: Stack(children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 22,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  const SafeArea(
                    child: Center(
                      child: Text(
                        "BOOKING",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ]),
              ),
              alignRow(
                w1: buildTextButton("ASSIGNED", 0),
                w2: buildTextButton("STATUS", 1),
              ),
              buildBookingTab(selectedIndex),
            ],
          )),
        ),
        bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 30,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    color: Colors.grey,
                    Icons.camera_alt_rounded,
                    size: 40,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    size: 30,
                  ),
                  label: ""),
            ]));
  }

  alignRow({required Widget w1, required Widget w2}) {
    return Row(
      children: [
        Expanded(
          child: w1,
          flex: 1,
        ),
        Expanded(
          child: w2,
          flex: 1,
        )
      ],
    );
  }

  buildTextButton(String name, int index) {
    return TextButton(
        onPressed: () {
          selectedIndex = index;
          setState(() {});
        },
        style: ButtonStyle(
            backgroundColor: selectedIndex == index
                ? MaterialStateProperty.all(AppColors.backgroundColor)
                : MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                    side: BorderSide(color: Colors.black12)))),
        child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "$name",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: selectedIndex == index ? Colors.white : Colors.grey),
            )));
  }

  buildBookingTab(selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return buildAssigned();
      case 1:
        return buildStatus();
      default:
        return Container();
    }
  }

  buildAssigned() {
    return Column(
      children: [
        TableCalendar(
          headerStyle: const HeaderStyle(
              titleTextStyle:
                  TextStyle(fontSize: 12, color: AppColors.backgroundColor),
              formatButtonVisible: false,
              titleCentered: true,
              leftChevronIcon: Icon(
                Icons.arrow_back,
                color: AppColors.backgroundColor,
                size: 14,
              ),
              rightChevronIcon: Icon(
                Icons.arrow_forward,
                color: AppColors.backgroundColor,
                size: 14,
              ),
              headerMargin: EdgeInsets.symmetric(horizontal: 100)),
          focusedDay: selectedDay,
          firstDay: DateTime(1990),
          lastDay: DateTime(2050),
          onDaySelected: (DateTime selectDay, DateTime focusDay) {
            setState(() {
              if ((selectDay == selectedDay) & isSelectedDate) {
                isSelectedDate = false;
              } else {
                if (!isSelectedDate) isSelectedDate = true;
                selectedDay = selectDay;
                focusedDay = focusDay;
              }
            });
          },
          selectedDayPredicate: (DateTime date) {
            return isSameDay(focusedDay, date) && isSelectedDate;
          },
          calendarStyle: CalendarStyle(
              tableBorder: TableBorder(bottom: BorderSide(color: Colors.white)),
              selectedDecoration: const BoxDecoration(
                color: AppColors.backgroundColor,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.transparent)),
              todayTextStyle: const TextStyle(
                  color: AppColors.backgroundColor,
                  fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 5,
        ),
        MyCard(
          icon: Icons.note_alt_outlined,
          title: 'SIFAPP1 LIFTING - ENGLISH',
          hasSub: true,
          subtitle:
              "Assiged to me 22-10-2019 08:00 AM\nTrainer:JUMADI\nLanguage: English\nRoom: 4",
          contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 0),
        ),
        MyCard(
          icon: Icons.note_alt_outlined,
          title: 'SIFAPP1 LIFTING - ENGLISH',
          hasSub: true,
          subtitle:
              "Assiged to me 22-10-2019 08:00 AM\nTrainer:JUMADI\nLanguage: English\nRoom: 4",
          contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 0),
        ),
      ],
    );
  }

  buildStatus() {
    return Column(
      children: [
        MyCard(
          icon: Icons.check,
          title: 'JSA - ENGLISH',
          hasSub: true,
          subtitle:
              "Done by 6 - 9 -2019 08:00 AM\nTrainer:TBA\nLanguage: English\nRoom: 4",
          contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 0),
        ),
        MyCard(
          icon: Icons.check,
          title: 'JSA - ENGLISH',
          hasSub: true,
          subtitle:
              "Done by 6 - 9 -2019 08:00 AM\nTrainer:TBA\nLanguage: English\nRoom: 4",
          contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 0),
        ),
        MyCard(
          icon: Icons.check,
          title: 'JSA - ENGLISH',
          hasSub: true,
          subtitle:
              "Done by 6 - 9 -2019 08:00 AM\nTrainer:TBA\nLanguage: English\nRoom: 4",
          contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 0),
        ),
        MyCard(
          icon: Icons.check,
          title: 'JSA - ENGLISH',
          hasSub: true,
          subtitle:
              "Done by 6 - 9 -2019 08:00 AM\nTrainer:TBA\nLanguage: English\nRoom: 4",
          contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 0),
        ),
        MyCard(
          icon: Icons.check,
          title: 'JSA - ENGLISH',
          hasSub: true,
          subtitle:
              "Done by 6 - 9 -2019 08:00 AM\nTrainer:TBA\nLanguage: English\nRoom: 4",
          contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 0),
        ),
      ],
    );
  }
}
