import 'package:flutter/material.dart';
import 'package:whatsapp_clone/widgets/colours.dart';

class WebSearchBar extends StatelessWidget {
  const WebSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: dividerColor),
        ),
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: searchBarColor,
          prefixIcon: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
          ),
          icon: const Icon(Icons.search),
          hintStyle: const TextStyle(fontSize: 14),
          hintText: 'Search or Start a Chat',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(width: 1, style: BorderStyle.none),
          ),
        ),
      ),
    );
  }
}
