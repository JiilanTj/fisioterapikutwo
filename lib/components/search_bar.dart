import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MySearchBar extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<bool> onFocusChange;

  MySearchBar({
    required this.controller,
    required this.onFocusChange,
  });

  @override
  _MySearchBarState createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        setState(() {
          _isFocused = hasFocus;
        });
        widget.onFocusChange(hasFocus);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: _isFocused ? Colors.white : Colors.grey[200],
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: _isFocused
              ? [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      spreadRadius: 1)
                ]
              : [],
        ),
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: TextField(
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: GoogleFonts.poppins(color: Colors.grey[600]),
            prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
            border: InputBorder.none,
          ),
          style: GoogleFonts.poppins(color: Colors.black),
        ),
      ),
    );
  }
}
