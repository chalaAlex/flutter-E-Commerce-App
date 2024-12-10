// import 'package:e_appp/models/category.dart';
// import 'package:flutter/material.dart';

// class Categories extends StatefulWidget {
//   const Categories({super.key});

//   @override
//   State<Categories> createState() => _CategoriesState();
// }

// class _CategoriesState extends State<Categories> {
//   int selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 130.0,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           // itemBuilder: builds the list item. allows items to be visible as you scroll.
//           return GestureDetector(
//             onTap: () {
//               setState(() {
//                 selectedIndex = index;
//               });
//             },
//             child: Container(
//               padding: EdgeInsets.all(5.0),
//               decoration: BoxDecoration(
//                 color: selectedIndex == index ? Colors.blue[200] : null,
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Column(
//                 children: [
//                   Container(
//                     width: 65,
//                     height: 65,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       image: DecorationImage(
//                         image: AssetImage(categories[index].image),
//                         // This is how to insert image inside Container Widget.
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 5.0,
//                   ),
//                   Text(
//                     categories[index].title,
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//         itemCount: categories.length, // total number of items in the list.
//       ),
//     );
//   }
// }
