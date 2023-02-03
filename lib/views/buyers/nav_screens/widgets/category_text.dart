import 'package:flutter/material.dart';

class CategoryText extends StatelessWidget {
  final List<String> _cateogryLable = ['food', 'vegetable', 'egg', 'tea'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Categories",
            style: TextStyle(
              fontSize: 19,
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            height: 40,
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _cateogryLable.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: ActionChip(
                          backgroundColor: Colors.yellow.shade900,
                          label: Center(
                            child: Text(
                              _cateogryLable[index],
                              style:const TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
                            ),
                          ),
                          onPressed: () {},
                        ),
                      );
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
