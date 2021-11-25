import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;

  const SearchTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 60,
      child: TextField(
        textInputAction: TextInputAction.search,
        controller: controller,
        cursorWidth: 1,
        decoration: InputDecoration(
          filled: true,
          isDense: true,
          hintText: 'City search',
          hintStyle: TextStyle(
            fontSize: 16,
            color: const Color(0xff7C7E92).withOpacity(0.54),
          ),
          suffixIcon: const Icon(Icons.search),
          fillColor: const Color(0x128e8e93),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
      ),
    );
  }
}
