// import 'package:e_appp/Provider/favorite_provider.dart';
// import 'package:e_appp/constants.dart';
// import 'package:e_appp/models/product_model.dart';
// import 'package:e_appp/screens/Detail/detail_screen.dart';
// import 'package:flutter/material.dart';
//
// class ProductCard extends StatelessWidget {
//   final Product product;
//   const ProductCard({super.key, required this.product});
//
//   @override
//   Widget build(BuildContext context) {
//     final provider = FavoriteProvider.of(context);
//
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => DetailScreen(product: product),
//           ),
//         );
//       },
//       child: Stack(
//         children: [
//           Container(
//             width: double.infinity,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               color: kcontentColor,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 5),
//                 Center(
//                   child: Hero(
//                     tag: product.image,
//                     child: Image.asset(
//                       product.image,
//                       width: 150,
//                       height: 150,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 10),
//                   child: Text(
//                     product.title,
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Text(
//                       "\$${product.price}",
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 17,
//                       ),
//                     ),
//                     Row(
//                       children: List.generate(
//                         product.colors.length,
//                         (index) => Container(
//                           width: 18,
//                           height: 18,
//                           margin: const EdgeInsets.only(right: 4),
//                           decoration: BoxDecoration(
//                             color: product.colors[index],
//                             shape: BoxShape.circle,
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//           Positioned(
//               child: Align(
//             alignment: Alignment.topRight,
//             child: Container(
//               height: 40,
//               width: 40,
//               decoration: const BoxDecoration(
//                 color: kprimaryColor,
//                 borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(20),
//                   bottomLeft: Radius.circular(10),
//                 ),
//               ),
//               child: GestureDetector(
//                 onTap: () {
//                   provider.toggleFavorite(product);
//                 },
//                 child: Icon(
//                   provider.isExist(product)
//                       ? Icons.favorite
//                       : Icons.favorite_border,
//                   color: Colors.white,
//                   size: 22,
//                 ),
//               ),
//             ),
//           ))
//         ],
//       ),
//     );
//   }
// }

import 'package:e_appp/constants.dart';
import 'package:e_appp/models/product_model.dart';
import 'package:e_appp/provider/Favorite_providers.dart';
import 'package:e_appp/screens/Detail/detail_screen.dart';
import 'package:e_appp/screens/Favorite/favorite.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final provider = AddToCart.of(context);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              product: widget.product,
            ),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: kcontentColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Center(
                  child: Hero(
                    tag: widget.product.image,
                    child: Image.asset(
                      widget.product.image,
                      width: 130,
                      height: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: Text(
                    widget.product.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${widget.product.price}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      children: List.generate(
                        widget.product.colors.length,
                        (index) => Container(
                          width: 18.0,
                          height: 18.0,
                          margin: EdgeInsets.only(right: 4),
                          decoration: BoxDecoration(
                            color: widget.product.colors[index],
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: kprimaryColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: Consumer<AddToCart>(
                  builder: (context, addToCart, child) {
                    return GestureDetector(
                      onTap: () {
                        // addToCart.addToFavorite(widget.product);
                        provider.togglFavorite(widget.product);
                      },
                      child: Icon(
                        provider.isExist(widget.product)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.white,
                        size: 25,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
