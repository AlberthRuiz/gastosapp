import 'package:flutter/material.dart';

class ItemTypeGastoWidget extends StatefulWidget {
  String title;
  String assetPath;
  bool isSelected;
  VoidCallback onTap;
  ItemTypeGastoWidget({
    required this.title,
    required this.assetPath,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<ItemTypeGastoWidget> createState() => _ItemTypeGastoWidgetState();
}

class _ItemTypeGastoWidgetState extends State<ItemTypeGastoWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff101321).withOpacity(0.05),
          borderRadius: BorderRadius.circular(14.0),
          border: widget.isSelected
              ? Border.all(
                  width: 1.0,
                  color: Color(0xff101321),
                )
              : null,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 6,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              widget.assetPath,
              height: 40,
              width: 40,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              widget.title,
            ),
          ],
        ),
      ),
    );
  }
}
