import 'package:flutter/material.dart';

class CustomDropdownWidget extends StatefulWidget {
  final List<String> options;
  final String initialOption;

  const CustomDropdownWidget({
    Key? key,
    required this.options,
    required this.initialOption,
  }) : super(key: key);

  @override
  State createState() => _CustomDropdownWidgetState();
}

class _CustomDropdownWidgetState extends State<CustomDropdownWidget> {
  late String selectedOption;

  @override
  void initState() {
    super.initState();
    selectedOption = widget.initialOption;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              selectedOption,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_drop_down_circle),
            onPressed: () {
              _showOptions(context);
            },
          ),
        ],
      ),
    );
  }

  Future<void> _showOptions(BuildContext context) async {
    final option = await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: widget.options.map((option) {
              return ListTile(
                title: Text(option),
                onTap: () {
                  Navigator.pop(context, option);
                },
              );
            }).toList(),
          ),
        );
      },
    );

    if (option != null) {
      setState(() {
        selectedOption = option;
      });
    }
  }
}
