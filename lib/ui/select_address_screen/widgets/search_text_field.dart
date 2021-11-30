import 'package:elementary_weather_flutter/theme/app_icons.dart';
import 'package:elementary_weather_flutter/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
          filled: true,
          isDense: true,
          hintText: 'City search',
          hintStyle: AppTypography.body.copyWith(
            color: const Color(0xff7C7E92).withOpacity(0.54),
          ),
          suffixIcon: SizedBox(
            width: 24,
            height: 24,
            child: SvgPicture.asset(
              AppIcons.search,
              fit: BoxFit.scaleDown,
            ),
          ),
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
