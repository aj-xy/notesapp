import 'package:flutter/material.dart';

class pfp extends StatelessWidget {
  const pfp(
      {super.key, required this.img, required this.label, required this.num, required this.email});
  final String img, label;
  final String num, email;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                  image: DecorationImage(image: NetworkImage(img))),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  num.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Text(email,
                style: TextStyle(fontSize: 15),)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
