import 'package:flutter/material.dart';
import 'package:flutter_ui_app/global/responsive.dart';

class DescriptionText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Container(
      width: double.infinity,
      child: Text(
        "Duis id consectetur non cupidatat irure ipsum culpa exercitation veniam quis fugiat magna. Non cillum anim duis et aliqua dolore aliquip aliqua anim irure. Ullamco excepteur magna labore excepteur ullamco sint non aliquip labore elit est aliqua anim eu. Qui esse minim ullamco excepteur ea sint. Aliquip culpa do anim ullamco ut fugiat nostrud. Non culpa consectetur officia occaecat incididunt adipisicing irure aute ut exercitation.",
        maxLines: 4,
        style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontWeight: FontWeight.w400,
            fontSize: responsive.heightR(1.6)),
      ),
    );
  }
}
