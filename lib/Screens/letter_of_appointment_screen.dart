import 'package:flutter/material.dart';
import 'package:my_app/utils/app_colors.dart';
import 'package:my_app/widgets/MyCard.dart';

class LetterOfAppointmentScreen extends StatelessWidget {
  LetterOfAppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
          children: [
            Stack(children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 10,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Container(
                height: 280,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                            "assets/image/engineer_background_image.jpg"))),
                child: Stack(children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
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
                        "LETTER \nOF \nAPPOINTMENT",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ]),
              ),
            ]),
            MyCard(
              icon: Icons.assignment_outlined,
              title: "LETTER OF \nAPPOINTMENT",
              hasSub: false,
              contentPadding: EdgeInsets.fromLTRB(15, 20, 15, 0),
              width: MediaQuery.of(context).size.width,
              color: AppColors.backgroundColor,
            ),
          ],
        )),
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
}
