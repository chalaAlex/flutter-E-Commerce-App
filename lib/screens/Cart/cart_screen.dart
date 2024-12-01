import 'package:e_appp/constants.dart';
import 'package:e_appp/provider/favorite_provider.dart';
import 'package:e_appp/screens/Cart/check_out.dart';
import 'package:e_appp/screens/nav_bar_screen.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    final finalList = provider.cart;
    // For Quantity
    productQuantity(IconData icon, int index) {
      return GestureDetector(
        onTap: () {
          setState(() {
            icon == Icons.add
                ? provider.incrementQtn(index)
                : provider.decrementQtn(index);
            if (finalList[index].quantity < 1) {
              finalList[index].quantity = 1;
              const snackBar = SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  "Quantity cannot be negative",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                duration: Duration(seconds: 1),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            // provider.totalPrice();
          });
        },
        child: Icon(
          icon,
          size: 20.0,
        ),
      );
    }

    return Scaffold(
      bottomSheet: const CheckOutBox(),
      backgroundColor: kcontentColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.all(15),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavBar(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                    ),
                  ),
                  Text(
                    "My Cart",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  // Container(),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: finalList.length,
                  itemBuilder: (context, index) {
                    final cartItems = finalList[index];
                    return Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.all(20),
                            child: Row(
                              children: [
                                Container(
                                  height: 100,
                                  width: 90,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: EdgeInsets.all(10),
                                  child: Image.asset(cartItems.image),
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cartItems.title,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      cartItems.category,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade400,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "\$${cartItems.price}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 35.0,
                          right: 35.0,
                          child: Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    finalList.removeAt(index);
                                  });
                                },
                                icon: Icon(
                                  size: 25.0,
                                  color: kprimaryColor,
                                  Icons.delete,
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: kcontentColor,
                                  border: Border.all(
                                    color: Colors.grey.shade200,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(width: 10.0),
                                    productQuantity(Icons.remove, index),
                                    SizedBox(width: 10.0),
                                    Text(
                                      cartItems.quantity.toString(), // 
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(width: 10.0),
                                    productQuantity(Icons.add, index),
                                    SizedBox(width: 10.0),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
