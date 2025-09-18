import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/consts/consts.dart';
import '../../models/product.dart';

class ProductDescription extends StatefulWidget {
  const ProductDescription({
    super.key,
    required this.product,
    this.pressOnSeeMore,
  });

  final Product product;
  final GestureTapCallback? pressOnSeeMore;

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  late bool isFavourite;

  @override
  void initState() {
    super.initState();
    isFavourite = widget.product.isFavourite;
  }

  void toggleFavourite() {
    setState(() {
      isFavourite = !isFavourite;
    });

    // Show a snack bar notification
    // accessible for screen readers
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isFavourite ? 'Added to favourites' : 'Removed from favourites',
        ),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            widget.product.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),

        // Favorite button with semantics for accessibility
        Semantics(
          button: true,
          label: isFavourite ? 'Remove from favourites' : 'Add to favourites',
          child: Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: toggleFavourite,
              child: Container(
                padding: const EdgeInsets.all(16),
                width: 48,
                decoration: BoxDecoration(
                  color: isFavourite
                      ? const Color(0xFFFFE6E6)
                      : const Color(0xFFF5F6F9),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: SvgPicture.asset(
                  heartIcon,
                  semanticsLabel: isFavourite ? 'Favourited' : 'Not favourited',
                  colorFilter: ColorFilter.mode(
                    isFavourite
                        ? const Color(0xFFFF4848)
                        : const Color(0xFFDBDEE4),
                    BlendMode.srcIn,
                  ),
                  height: 16,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 64),
          child: Text(widget.product.description, maxLines: 3),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: GestureDetector(
            onTap: widget.pressOnSeeMore,
            child: const Row(
              children: [
                Text(
                  "See More Detail",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFF7643),
                  ),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: Color(0xFFFF7643),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
