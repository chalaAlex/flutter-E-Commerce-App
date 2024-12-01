import 'package:e_appp/constants.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final description;
  const Description({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 120.0,
                height: 40.0,
                decoration: BoxDecoration(
                  color: kprimaryColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                alignment: Alignment.center,
                child: const Text(
                  "Description",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
              Text(
                "Specifications",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
              Text(
                "Reviews",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
