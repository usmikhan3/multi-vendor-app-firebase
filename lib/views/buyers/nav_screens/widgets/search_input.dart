import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: TextField(
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: "Search for products",
              hintStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(14.0),
                child: SvgPicture.asset("assets/icons/search.svg",width: 10,),
              ),
              border:const  OutlineInputBorder(
                borderSide: BorderSide.none,

              )
          ),
        ),
      ),
    );
  }
}

