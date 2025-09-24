import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/color_dot.dart';
import '../../../core/widgets/rounded_color_btn.dart';
import '../../models/product.dart';

String getColorName(Color color) {
  if (color == const Color(0xFFF6625E)) return 'Red';
  if (color == const Color(0xFF836DB8)) return 'Purple';
  if (color == const Color(0xFFDECB9C)) return 'Beige';
  if (color == Colors.white) return 'White';
  return 'Unknown color';
}

class ProductColorDots extends StatefulWidget {
  const ProductColorDots({super.key, required this.product});

  final Product product;

  @override
  State<ProductColorDots> createState() => _ColorDotsState();
}

class _ColorDotsState extends State<ProductColorDots> {
  int selectedColor = 3;
  int itemCount = 1;

  void _incrementCount() {
    setState(() {
      itemCount++;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Item count increased one')),
    );
  }

  void _decrementCount() {
    setState(() {
      if (itemCount > 1) itemCount--;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Item count decreased one')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Semantics(
            label: 'Available colors',
            hint: 'Select a color option',
            child: Row(
              children: [
                ...List.generate(widget.product.colors.length, (index) {
                  final color = widget.product.colors[index];
                  final colorName = getColorName(color);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedColor = index;
                      });
                    },
                    child: ColorDot(
                      color: color,
                      isSelected: index == selectedColor,
                      description: '$colorName color option'
                          '${index == selectedColor ? ", selected" : ""}',
                    ),
                  );
                }),
              ],
            ),
          ),
          const Spacer(),
          RoundedIconBtn(icon: Icons.remove, press: _decrementCount),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              "$itemCount",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          RoundedIconBtn(
            icon: Icons.add,
            showShadow: true,
            press: _incrementCount,
          ),
        ],
      ),
    );
  }
}
