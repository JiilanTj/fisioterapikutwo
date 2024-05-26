import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:fisioterapiku/constants.dart';

class SearchField extends StatelessWidget {
  final Function(String) onSubmitted;

  const SearchField({
    super.key,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kcontentColor,
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 5,
      ),
      child: Row(
        children: [
          const Icon(
            Ionicons.search,
            color: Colors.grey,
          ),
          const SizedBox(width: 10),
          Flexible(
            flex: 4,
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Search...",
                border: InputBorder.none,
              ),
              onSubmitted: onSubmitted,
            ),
          ),
          Container(
            height: 25,
            width: 1.5,
            color: Colors.grey,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Ionicons.options_outline,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
