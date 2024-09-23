import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late SearchController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = SearchController();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SearchBar(
        controller: _controller,
        focusNode: _focusNode,
        padding: MaterialStateProperty.all(
          const EdgeInsets.all(12.0),
        ),
        onTap: () {
          if (_controller.isAttached) {
            _controller.openView(); 
          }
        },
        onChanged: (_) {
          if (_controller.isAttached) {
            _controller.openView();
          }
        },
        onTapOutside: (_) {
          FocusScope.of(context).unfocus();
        },
        leading: const Icon(
          Icons.search_outlined,
        ),
      ),
    );
  }
}
