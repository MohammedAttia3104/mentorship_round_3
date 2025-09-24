import 'package:flutter/material.dart';

class SmallProductImage extends StatefulWidget {
  const SmallProductImage({
    super.key,
    required this.isSelected,
    required this.press,
    required this.image,
    required this.description,
  });

  final bool isSelected;
  final VoidCallback press;
  final String image;
  final String description;

  @override
  State<SmallProductImage> createState() => _SmallProductImageState();
}

class _SmallProductImageState extends State<SmallProductImage> {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.description,
      selected: widget.isSelected,
      button: true,
      child: InkWell(
        onTap: widget.press,
        borderRadius: BorderRadius.circular(10),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.only(right: 16),
          padding: const EdgeInsets.all(8),
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color(0xFFFF7643).withAlpha(widget.isSelected ? 255 : 0),
            ),
          ),
          child: Image.network(widget.image),
        ),
      ),
    );
  }
}
