import 'package:assignment/app/home/presentation/home-page/home_controller.dart';
import 'package:assignment/core/app_theme/app_theme.dart';
import 'package:assignment/core/app_theme/core_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchBarWidget extends StatelessWidget {
  final HomeController controller;
  const SearchBarWidget({
    Key? key,
    required TextEditingController textEditingController,
    required this.controller,
  })  : _textEditingController = textEditingController,
        super(key: key);

  final TextEditingController _textEditingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          vertical: CoreTheme.spaceSizeSmall,
          horizontal: CoreTheme.spaceSizeLarge),
      padding:
          const EdgeInsets.symmetric(horizontal: CoreTheme.spaceSizeMedium),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: CoreTheme.primaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(
            CoreTheme.spaceSizeSmall,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset('assets/images/Frame.svg'),
          const SizedBox(width: CoreTheme.spaceSizeMedium),
          SizedBox(
            width: 240,
            child: TextField(
              controller: _textEditingController,
              style: AppTheme.textStyleSmall,
              onSubmitted: (value) {
                controller.getMovies(name: value);
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search',
                hintStyle: AppTheme.textStyleSmall,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              _textEditingController.clear();
            },
            child: SvgPicture.asset('assets/images/Group 220.svg'),
          )
        ],
      ),
    );
  }
}
