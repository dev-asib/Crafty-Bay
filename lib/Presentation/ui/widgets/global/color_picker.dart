import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({
    super.key,
    required this.colors,
    required this.onChangedColor,
  });

  final List<String> colors;
  final Function(String) onChangedColor;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  late String _selectedColor = widget.colors.first;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Color",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 16),
        _buildColorOptions()
      ],
    );
  }

  Widget _buildColorOptions() {
    return Wrap(
      spacing: 4,
      children: widget.colors.map(
        (color) {
          return _buildColorOption(color);
        },
      ).toList(),
    );
  }

  Widget _buildColorOption(String item) {
    return GestureDetector(
      onTap: () => _onColorSelected(item),
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: productColor(item),
          shape: BoxShape.circle,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 6,
              spreadRadius: 0.2,
              offset: Offset(0.5, 0.9),
            ),
          ],
        ),
        margin: const EdgeInsets.only(right: 3),
        child: _selectedColor == item
            ? Icon(
                Icons.check,
                color: item == "White" ? Colors.grey : Colors.white,
              )
            : null,
      ),
    );
  }

  void _onColorSelected(String selectedColor) {
    if (_selectedColor != selectedColor) {
      setState(() {
        _selectedColor = selectedColor;
        widget.onChangedColor(selectedColor);
      });
    }
  }

  Color productColor(String color) {
    if (color == 'Red') {
      return Colors.red;
    } else if (color == 'Green') {
      return Colors.green;
    } else {
      return Colors.white;
    }
  }
}
