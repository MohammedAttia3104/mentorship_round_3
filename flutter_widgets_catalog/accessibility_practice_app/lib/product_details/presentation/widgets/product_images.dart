import 'package:accessibility_practice_app/core/widgets/small_product_image.dart';
import 'package:flutter/material.dart';

import '../../models/product.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({super.key, required this.product});

  final Product product;

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedImage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Semantics(
          label: 'Main product image',
          image: true,
          child: SizedBox(
            width: 238,
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.network(widget.product.images[selectedImage]),
            ),
          ),
        ),
        // SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              widget.product.images.length,
              (index) => SmallProductImage(
                isSelected: index == selectedImage,
                press: () {
                  setState(() {
                    selectedImage = index;
                  });
                },
                image: widget.product.images[index],
                description: '${widget.product.title} image ${index + 1}',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
