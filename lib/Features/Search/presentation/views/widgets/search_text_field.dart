import 'package:bookly/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: TextField(
        decoration: InputDecoration(
          floatingLabelAlignment: FloatingLabelAlignment.center,
          labelText: "Search",
          floatingLabelStyle: Styles.textstyle18.copyWith(color: Colors.white),
          labelStyle: Styles.textstyle18,
          suffixIcon: IconButton(
            icon: const Icon(
              FontAwesomeIcons.magnifyingGlass,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          border: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(
        12,
      ),
    );
  }
}
