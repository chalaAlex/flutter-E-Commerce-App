import 'package:e_appp/constants.dart';
import 'package:e_appp/provider/Favorite_providers.dart';
import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  final checkAvailable = 0;
  @override
  Widget build(BuildContext context) {
    final AddToCart FavoriteProvider = AddToCart.of(context);
    final FavoriteList = FavoriteProvider.favorites;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Favorites",
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: checkAvailable == FavoriteProvider.checkQuantity()
          ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "   Your Favorite Items are appear here!",
                  style: TextStyle(
                    fontSize: 22.0,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Icon(
                  Icons.favorite,
                  color: kprimaryColor,
                )
              ],
            )
          : ListView.builder(
              itemCount: FavoriteList.length,
              itemBuilder: (context, index) {
                final FavoriteItem = FavoriteList[index];
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              width: 85,
                              height: 85,
                              decoration: BoxDecoration(
                                color: kcontentColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Image.asset(FavoriteItem.image),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  FavoriteItem.title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  FavoriteItem.category,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade400,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "\$${FavoriteItem.price}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    // for delete button
                    Positioned(
                      top: 50,
                      right: 35,
                      child: GestureDetector(
                        onTap: () {
                          FavoriteList.removeAt(index);
                          setState(() {});
                        },
                        child: const Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 25,
                        ),
                      ),
                    ),
                  ],
                );
              }),
    );
  }
}
