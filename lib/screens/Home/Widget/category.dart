import 'package:e_appp/models/category.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.0,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          // itemBuilder: builds the list item. allows items to be visible as you scroll.
          return Column(
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
          );
        },
        separatorBuilder: (context, index) {
          // A function that builds the separator widgets displayed between list items.
          return const SizedBox(
            width: 5.0,
          );
        },
        itemCount: categories.length, // total number of items in the list.
      ),
    );
  }
}
