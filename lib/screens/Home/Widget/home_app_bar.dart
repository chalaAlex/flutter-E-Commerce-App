// import 'package:flutter/material.dart';
//
// import '../../../constants.dart';
//
// class CustomAppBar extends StatelessWidget {
//   const CustomAppBar({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         IconButton(
//           style: IconButton.styleFrom(
//             backgroundColor: kcontentColor,
//             padding: const EdgeInsets.all(15),
//           ),
//           onPressed: () {},
//           icon: Image.asset(
//             "images/icon.png",
//             height: 20,
//           ),
//         ),
//         IconButton(
//           style: IconButton.styleFrom(
//             backgroundColor: kcontentColor,
//             padding: const EdgeInsets.all(15),
//           ),
//           onPressed: () {},
//           iconSize: 30,
//           icon: const Icon(Icons.notifications_outlined),
//         ),
//       ],
//     );
//   }
// }


import 'package:e_appp/constants.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            "images/icon.png",
            height: 20,
          ),
          style: IconButton.styleFrom(
            backgroundColor: kcontentColor,
            padding: EdgeInsets.all(20),
          ),
        ),
        IconButton(
          onPressed: () {

          },
          iconSize: 20,
          icon: const Icon(
            Icons.notifications_outlined,
          ),
          style: IconButton.styleFrom(
            backgroundColor: kcontentColor,
            padding: EdgeInsets.all(20),
          ),
        ),
      ],
    );
  }
}
