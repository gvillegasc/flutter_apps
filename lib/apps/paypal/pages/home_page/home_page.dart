import 'package:flutter/material.dart';
import 'package:flutter_ui_app/apps/paypal/pages/home_page/widgets/widgets.dart';
import 'package:flutter_ui_app/apps/paypal/widgets/actions_app_bar.dart';
import 'package:provider/provider.dart';

class HomePagePaypal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeProvider(),
      child: Scaffold(
          body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.white, Color(0xffF5F7FA)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: _CreatePage(),
      )),
    );
  }
}

class _CreatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeProvider homeProvider = Provider.of<HomeProvider>(context);
    return homeProvider.firstPage ? _FirstPage() : _SecondPage();
  }
}

class _FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        HomeHeader(),
        UserActions(),
        ActivityTitle(),
        ActivityListPrincipal()
      ],
    );
  }
}

class _SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        ActionsAppBar(
          actionIcon: "ic_search.svg",
          onPressed: () {
            final HomeProvider homeProvider =
                Provider.of<HomeProvider>(context, listen: false);
            homeProvider.changePage();
          },
          title: "Activity",
        ),
        TopFilters(),
        ActivitiesList()
      ],
    );
  }
}

class HomeProvider extends ChangeNotifier {
  bool firstPage = true;

  void changePage() {
    this.firstPage = !this.firstPage;
    notifyListeners();
  }
}
