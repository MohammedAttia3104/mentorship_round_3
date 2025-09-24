import 'package:accessibility_practice_app/core/widgets/top_rounded_container.dart';
import 'package:accessibility_practice_app/product_details/presentation/widgets/product_color_dots.dart';
import 'package:accessibility_practice_app/product_details/presentation/widgets/product_description.dart';
import 'package:accessibility_practice_app/product_details/presentation/widgets/product_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/consts/consts.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final product = demoProducts[0];
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Semantics(
            button: true,
            label: 'Back ',
            hint: 'Go back to previous screen',
            child: ElevatedButton(
              onPressed: () {
                // Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: EdgeInsets.zero,
                elevation: 0,
                backgroundColor: Colors.white,
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
                size: 20,
              ),
            ),
          ),
        ),
        actions: [
          Row(
            children: [
              Semantics(
                label: 'Product rating',
                value: '4.7 out of 5 stars',
                child: Container(
                  margin: const EdgeInsets.only(right: 20),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [
                      const Text(
                        "4.7",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 4),
                      SvgPicture.asset(starIcon),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        children: [
          ProductImages(product: product),

          TopRoundedContainer(
            color: Colors.white,
            child: Column(
              children: [
                ProductDescription(product: product, pressOnSeeMore: () {}),
                TopRoundedContainer(
                  color: const Color(0xFFF6F7F9),
                  child: Column(
                    children: [
                      ProductColorDots(product: product),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: TopRoundedContainer(
        color: Colors.white,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Semantics(
              button: true,
              label: 'Add to cart button',
              hint: 'Adds this product to your shopping cart',
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: const Color(0xFFFF7643),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 48),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
                onPressed: () {
                  final snackBar = SnackBar(
                    content: const Text('Added to cart'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        // Undo action
                      },
                    ),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: const Text("Add To Cart"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
