// import 'package:e_appp/models/product_model.dart';
// import 'package:e_appp/screens/Home/Widget/product_cart.dart';
// import 'package:e_appp/screens/Home/Widget/search_bar.dart';
// import 'package:flutter/material.dart';
//
// import '../../models/category.dart';
// import 'Widget/home_app_bar.dart';
// import 'Widget/image_slider.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   int currentSlider = 0;
//   int selectedIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     List<List<Product>> selectcategories = [
//       all,
//       shoes,
//       beauty,
//       womenFashion,
//       jewelry,
//       menFashion
//     ];
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 35),
//               // for custom appbar
//               const CustomAppBar(),
//               const SizedBox(height: 20),
//               // for search bar
//               const MySearchBAR(),
//               const SizedBox(height: 20),
//               ImageSlider(
//                 currentSlide: currentSlider,
//                 onChange: (value) {
//                   setState(
//                     () {
//                       currentSlider = value;
//                     },
//                   );
//                 },
//               ),
//               const SizedBox(height: 20),
//               // for category selection
//               categoryItems(),
//
//               const SizedBox(height: 20),
//               if (selectedIndex == 0)
//                 const Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Special For You",
//                       style: TextStyle(
//                         fontSize: 25,
//                         fontWeight: FontWeight.w800,
//                       ),
//                     ),
//                     Text(
//                       "See all",
//                       style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 16,
//                         color: Colors.black54,
//                       ),
//                     ),
//                   ],
//                 ),
//               // for shopping items
//               const SizedBox(height: 10),
//               GridView.builder(
//                 padding: EdgeInsets.zero,
//                 physics: const NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     childAspectRatio: 0.75,
//                     crossAxisSpacing: 20,
//                     mainAxisSpacing: 20),
//                 itemCount: selectcategories[selectedIndex].length,
//                 itemBuilder: (context, index) {
//                   return ProductCard(
//                     product: selectcategories[selectedIndex][index],
//                   );
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   SizedBox categoryItems() {
//     return SizedBox(
//       height: 130,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: categoriesList.length,
//         physics: const BouncingScrollPhysics(),
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               setState(() {
//                 selectedIndex = index;
//               });
//             },
//             child: Container(
//               padding: const EdgeInsets.all(5),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 color: selectedIndex == index
//                     ? Colors.blue[200]
//                     : Colors.transparent,
//               ),
//               child: Column(
//                 children: [
//                   Container(
//                     height: 65,
//                     width: 65,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       image: DecorationImage(
//                           image: AssetImage(categoriesList[index].image),
//                           fit: BoxFit.cover),
//                     ),
//                   ),
//                   const SizedBox(height: 5),
//                   Text(
//                     categoriesList[index].title,
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:e_appp/models/product_model.dart';
import 'package:e_appp/screens/Home/Widget/category.dart';
import 'package:e_appp/screens/Home/Widget/home_app_bar.dart';
import 'package:e_appp/screens/Home/Widget/image_slider.dart';
import 'package:e_appp/screens/Home/Widget/product_cart.dart';
import 'package:e_appp/screens/Home/Widget/search_bar.dart';
import 'package:flutter/material.dart';

import '../../models/category.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSlider = 0;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<List<Product>> selectedCategory = [
      all,
      shoes,
      beauty,
      womenFashion,
      jewelry,
      menFashion
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15.0,
              ),
              CustomAppBar(),
              SizedBox(
                height: 15.0,
              ),
              MySearchBar(),
              SizedBox(
                height: 15.0,
              ),
              ImageSlider(
                currentSlide: currentSlider,
                onChanged: (value) {
                  setState(
                    () {
                      currentSlider = value;
                    },
                  );
                },
              ),
              SizedBox(
                height: 130.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    // itemBuilder: builds the list item. allows items to be visible as you scroll.
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color:
                              selectedIndex == index ? Colors.blue[200] : null,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: 65,
                              height: 65,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(categories[index].image),
                                  // This is how to insert image inside Container Widget.
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              categories[index].title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount:
                      categories.length, // total number of items in the list.
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Special For you",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 25.0,
                    ),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.78,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: selectedCategory[selectedIndex].length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: selectedCategory[selectedIndex][index],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
