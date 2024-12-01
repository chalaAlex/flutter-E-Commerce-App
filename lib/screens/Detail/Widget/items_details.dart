import 'package:e_appp/constants.dart';
import 'package:e_appp/models/product_model.dart';
import 'package:e_appp/screens/Detail/Widget/description.dart';
import 'package:flutter/material.dart';

class ItemsDetails extends StatefulWidget {
  final Product product;
  const ItemsDetails({super.key, required this.product});

  @override
  State<ItemsDetails> createState() => _ItemsDetailsState();
}

class _ItemsDetailsState extends State<ItemsDetails> {
  @override
  Widget build(BuildContext context) {
    int currentImage = 0;
    int currentColor = 1;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.product.title,
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 25,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "\$${widget.product.price}",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // for rating
            Row(
              children: [
                Container(
                  width: 60.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: kprimaryColor,
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.star,
                        size: 18.0,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        widget.product.rate.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  widget.product.review,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15.0,
                  ),
                ),
                // Spacer(),
                Text.rich(
                  TextSpan(
                      text: "Seller  ",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      children: [
                        TextSpan(
                          text: widget.product.seller,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Color",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 18.0,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: List.generate(
                widget.product.colors.length,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      currentColor = index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(microseconds: 300),
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currentColor == index
                          ? Colors.white
                          : widget.product.colors[index],
                      border: currentColor == index
                          ? Border.all(color: widget.product.colors[index])
                          : null,
                    ),
                    padding: currentColor == index ? EdgeInsets.all(2) : null,
                    margin: EdgeInsets.only(right: 15),
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: widget.product.colors[index],
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            // for description
            Description(
              description: widget.product.description,
            ),
          ],
        ),
      ],
    );
  }
}
