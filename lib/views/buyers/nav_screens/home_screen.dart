import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multi_vendor/views/buyers/nav_screens/widgets/banner_widget.dart';
import 'package:multi_vendor/views/buyers/nav_screens/widgets/category_text.dart';
import 'package:multi_vendor/views/buyers/nav_screens/widgets/search_input.dart';
import 'package:multi_vendor/views/buyers/nav_screens/widgets/welcome_text.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        WelcomeText(),

        SizedBox(height: 20,),

        SearchInput(),
        SizedBox(height: 20,),
        BannerWidget(),
        SizedBox(height: 20,),
        CategoryText(),
      ],
    );
  }
}

