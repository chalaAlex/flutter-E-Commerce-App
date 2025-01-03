import 'package:e_appp/models/product_model.dart';
import 'package:e_appp/provider/Favorite_providers.dart';
import 'package:e_appp/provider/add_to_cart_provider.dart';
import 'package:flutter/material.dart';

class DetailAppBar extends StatefulWidget {
  final Product product;
  const DetailAppBar({super.key, required this.product});

  @override
  State<DetailAppBar> createState() => _DetailAppBarState();
}

class _DetailAppBarState extends State<DetailAppBar> {
  @override
  Widget build(BuildContext context) {
    final provider = AddToCart.of(context);

    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              padding: EdgeInsets.all(15),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
          Spacer(),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              padding: EdgeInsets.all(15),
            ),
            onPressed: () {},
            icon: const Icon(
              Icons.share_outlined,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              padding: EdgeInsets.all(15),
            ),
            onPressed: () {
              provider.togglFavorite(widget.product);
            },
            icon: Icon(
              provider.isExist(widget.product)
                  ? Icons.favorite
                  : Icons.favorite_border,
                  color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
