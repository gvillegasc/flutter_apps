import 'package:flutter/material.dart';
import 'package:flutter_ui_app/apps/canvas/pages/to_do_page/widgets/widgets.dart';
import 'package:flutter_ui_app/apps/canvas/providers/to_do_navigation_provider.dart';
import 'package:flutter_ui_app/global/responsive.dart';
import 'package:provider/provider.dart';

class ToDoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return ChangeNotifierProvider(
      create: (_) => ToDoNavigationProvider(),
      child: Scaffold(
        body: SizedBox(
          height: responsive.height,
          width: responsive.width,
          child: Row(
            children: <Widget>[
              Container(
                color: const Color(0xff223E6D),
                width: responsive.widthR(18),
                height: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: responsive.heightR(5),
                    ),
                    ButtonBack(),
                    UserActions(),
                    SizedBox(
                      height: responsive.heightR(20),
                    ),
                    MoreActions()
                  ],
                ),
              ),
              PageNavigator()
            ],
          ),
        ),
      ),
    );
  }
}
