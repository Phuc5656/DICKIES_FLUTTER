import 'package:flutter/material.dart';

class OptionPage extends StatefulWidget {
  const OptionPage({super.key});

  @override
  _OptionPageState createState() => _OptionPageState();
}

class _OptionPageState extends State<OptionPage> {
  String selectedSize = 'M';
  Color selectedColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tùy chỉnh'),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context); // Close the page
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: const Icon(Icons.add_shopping_cart),
              title: const Text('Thêm vào giỏ hàng'),
              onTap: () {
                // Add to cart action
              },
            ),
            ListTile(
              leading: const Icon(Icons.straighten),
              title: const Text('Size'),
              trailing: Text(selectedSize),
              onTap: () {
                _showSizeSelection(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.color_lens),
              title: const Text('Chọn màu'),
              trailing: CircleAvatar(
                backgroundColor: selectedColor,
                radius: 10,
              ),
              onTap: () {
                _showColorSelection(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text('Xóa khỏi danh sách yêu thích'),
              onTap: () {
                // Remove from favorite action
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showSizeSelection(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.straighten),
                  _sizeOption(context, 'S'),
                  _sizeOption(context, 'M', isSelected: selectedSize == 'M'),
                  _sizeOption(context, 'L'),
                  _sizeOption(context, 'XL'),
                  IconButton(
                    icon: const Icon(Icons.check),
                    onPressed: () {
                      Navigator.pop(context);
                      // Save size selection
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _sizeOption(BuildContext context, String size, {bool isSelected = false}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSize = size;
        });
        Navigator.pop(context);
        _showSizeSelection(context);
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black),
          color: isSelected ? Colors.blue[100] : Colors.transparent,
        ),
        child: Text(size, style: const TextStyle(color: Colors.black)),
      ),
    );
  }

  void _showColorSelection(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _colorOption(context, Colors.black),
              _colorOption(context, Colors.brown),
              _colorOption(context, Colors.grey),
              _colorOption(context, Colors.pink),
              IconButton(
                icon: const Icon(Icons.check),
                onPressed: () {
                  Navigator.pop(context);
                  // Save color selection
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _colorOption(BuildContext context, Color color) {
    bool isSelected = selectedColor == color;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color;
        });
        Navigator.pop(context);
        _showColorSelection(context);
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black),
          color: isSelected ? color.withOpacity(0.5) : color,
        ),
        child: const SizedBox(width: 24, height: 24),
      ),
    );
  }
}