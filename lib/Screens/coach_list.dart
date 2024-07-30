import 'package:flutter/material.dart';
import 'package:flutter_application_1/Const/Colors.dart';
import 'package:flutter_application_1/Data/Coach_data.dart';
import 'package:flutter_application_1/Data/arena_data.dart';
import 'package:flutter_application_1/Screens/Calendar_screen.dart';
import 'package:flutter_application_1/Screens/Coach_details_page.dart';
import 'package:flutter_application_1/Screens/arena_detail_page.dart';
import 'package:flutter_application_1/Screens/main_dashboard.dart';
import 'package:flutter_application_1/Widgets/Scrollable_card_.dart';

import 'package:flutter_application_1/Widgets/sport_tile.dart';

class coach_list extends StatefulWidget {
  const coach_list({super.key});

  @override
  State<coach_list> createState() => _coach_listState();
}

class _coach_listState extends State<coach_list> {
  String dropdownValue = 'Colombo 7';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: maincolor,
          title: const Text(
            'Search Coaches',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.calendar_month,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => calendar_screen()
                            //  MyCalendarPage(),/
                            ));
                    // Handle search logic
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    // Handle search logic
                  },
                ),
              ],
            ),
          ],
          leading: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => main_dash()));
            },
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            ),
          ),
        ),
        body: SizedBox(
          height: 2000,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined),
                    const SizedBox(
                      width: 10,
                    ),
                    DropdownButton<String>(
                      value: dropdownValue, // Current selected value
                      icon: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 35,
                      ), // Down arrow icon

                      elevation: 30,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500),

                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!; // Update selected value
                        });
                      },
                      items: <String>[
                        'Colombo 7',
                        'Rajagiriya',
                        'Kottawa',
                        'Gampaha'
                      ] // List of options
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: 'Search',
                      prefixIcon: const Icon(
                        Icons.search,
                        size: 25,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Categories",
                  style:
                      TextStyle(fontWeight: FontWeight.w500, color: maincolor),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    sport_tile(
                      image: "assets/images/menu.png",
                      title: "All",
                      bgcolor: Color(0xffEC9B6D),
                      width: 0.2,
                    ),
                    sport_tile(
                      image: "assets/images/basket ball.png",
                      title: "Basket Ball",
                      bgcolor: Color(0xffCDCCF3),
                      width: 0.32,
                    ),
                    sport_tile(
                        image: "assets/images/Foot ball.png",
                        title: "Foot Ball",
                        bgcolor: Color(0xffB1F0F0),
                        width: 0.32)
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    sport_tile(
                        image: "assets/images/golf.png",
                        title: "Golf",
                        bgcolor: Color(0xffF2DAF4),
                        width: 0.2),
                    sport_tile(
                        image: "assets/images/cricket.png",
                        title: "Cricket",
                        bgcolor: Color(0xffFFF96E),
                        width: 0.32),
                    sport_tile(
                        image: "assets/images/love.png",
                        title: "Favourites",
                        bgcolor: Color.fromRGBO(137, 136, 136, 0.259),
                        width: 0.34)
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                SingleChildScrollView(
                  child: SizedBox(
                    height: 457,
                    child: Expanded(
                      child: ListView.builder(
                        itemCount: coach_cards.length,
                        itemBuilder: (context, index) {
                          final card =
                              coach_cards[index]; // Get the current card data
                          return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        Coach_DetailPage(card: card),
                                  ),
                                );
                              },
                              child: ScrollableCard(
                                  title: card.title,
                                  location: card.location,
                                  status: card.status,
                                  category: card.category,
                                  image: card.image,
                                  price: card.price,
                                  tp1: card.tp1,
                                  tp2: card.tp2,
                                  monday: card.monday,
                                  tue_wedn: card.tue_wedn,
                                  sunday: card.sunday,
                                  reviewer_img: card.reviewer_img,
                                  reviewer_name: card.reviewer_name,
                                  review: card.review,
                                  reviewer2_img: card.reviewer2_img,
                                  reviewer2_name: card.reviewer2_name,
                                  review2: card.review2,
                                  loc_img: card.loc_img)
                              // ... other card properties

                              ); // Build each card from the list
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
    ;
  }
}
