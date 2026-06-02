import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_button.dart';

class MyCourseItem extends StatelessWidget {
  const MyCourseItem({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey[200]
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network('https://i.ytimg.com/vi/VPvVD8t02U8/maxresdefault.jpg',
                  fit: BoxFit.fill,
                  height: height*0.1,
                  width: width*0.35,),
              ),
              Column(
                children: [
                  Text('title'),
                  SizedBox(
                    width: width*0.45,
                    child: CustomButton(
                      text: 'complete course',
                      onPressed: (){},
                      isSmall: true,),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}