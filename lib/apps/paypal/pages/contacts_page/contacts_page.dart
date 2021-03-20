import 'package:flutter/material.dart';
import 'package:flutter_ui_app/apps/paypal/pages/contacts_page/widgets/widgets.dart';
import 'package:flutter_ui_app/apps/paypal/widgets/actions_app_bar.dart';

class ContactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const ActionsAppBar(
            title: 'Contacts',
            actionIcon: 'ic_more.svg',
          ),
          Search(),
          ContactList()
        ],
      ),
    );
  }
}
