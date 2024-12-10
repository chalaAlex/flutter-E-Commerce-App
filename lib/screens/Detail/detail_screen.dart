import 'package:e_appp/constants.dart';
import 'package:e_appp/models/product_model.dart';
import 'package:e_appp/screens/Detail/Widget/addto_cart.dart';
import 'package:e_appp/screens/Detail/Widget/detail_app_bar.dart';
import 'package:e_appp/screens/Detail/Widget/image_slider.dart';
import 'package:e_appp/screens/Detail/Widget/items_details.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final Product product;
  const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<DetailScreen> {
  int currentPage = 0;
  int currentSlider = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcontentColor,
      floatingActionButton: AddToCart(product: widget.product),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // For back button, share and favorite.
              DetailAppBar(
                product: widget.product,
              ),
              // for detail image slider
              MyImageSlider(
                  image: widget.product.image,
                  onChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  }),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) => AnimatedContainer(
                    duration: Duration(microseconds: 100),
                    width: currentPage == index ? 15 : 8,
                    height: 8,
                    margin: EdgeInsets.only(right: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: currentPage == index
                          ? Colors.black
                          : Colors.transparent,
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                ),
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                  bottom: 200,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // for product name, price, rating, seller.
                    ItemsDetails(product: widget.product),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
