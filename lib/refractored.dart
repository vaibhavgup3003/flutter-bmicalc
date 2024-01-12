import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class iconData extends StatelessWidget {
  final IconData icon;
  final String label;
  iconData(this.icon, this.label);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 100,
        ),
        Text(label,
          style: klabelTextStyle
        ),
      ],
    );
  }
}


class NewWidget extends StatelessWidget {
  final Widget customChild;
  final Color colour;
  NewWidget(this.customChild, this.colour);

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: customChild,
      margin: EdgeInsets.all(15),
      height: 200,
      width: 170,
      decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10)),
    );
  }
}

class bottombutton extends StatelessWidget {
  final void Function() ontap;
  final String text;
  bottombutton(this.text, this.ontap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: Text(text,textAlign: TextAlign.center,style: TextStyle(
          fontSize: 25, fontWeight: FontWeight.w900, letterSpacing: 2, height: 3,
        ),),
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        color: kappbarColor,
        height: 80,
      ),
    );
  }
}
