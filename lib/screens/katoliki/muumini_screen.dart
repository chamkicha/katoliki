import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/extensions/extensions.dart';
import 'package:flutkit/theme/app_theme.dart';

import 'package:flutkit/screens/katoliki/address_form.dart';
import 'package:flutkit/screens/katoliki/date_timer_picker_screen.dart';
import 'package:flutkit/screens/katoliki/feedback_form.dart';
import 'package:flutkit/screens/katoliki/Kikanisa_screen.dart';
import 'package:flutkit/screens/katoliki/personal_information_form.dart';

class MuuminiScreen extends StatefulWidget {
  @override
  _MuuminiScreenState createState() => _MuuminiScreenState();
}

class _MuuminiScreenState extends State<MuuminiScreen> {
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            FeatherIcons.chevronLeft,
            size: 20,
          ).autoDirection(),
        ),
        title: FxText.titleMedium(
          'Your Details',
          fontWeight: 600,
        ),
      ),
      body: Stack(
          children: [
              KikanisaScreen(),

          ],
      )
    );
  }

  List<Tab> getTabs() {
    List<String> tabNames = [
      'Sample',
      'Date-Time',
      'Address',
      'Feedback',
      'Personal Information',
      // 'Selectable',
    ];

    List<Tab> tabs = [];

    for (String tabName in tabNames) {
      tabs.add(Tab(
          child: FxText.labelMedium(
        tabName,
        fontWeight: 700,
      )));
    }

    return tabs;
  }

  List<Widget> getTabContents() {
    return [
      KikanisaScreen(),
      DateTimePickerScreen(),
      AddressForm(),
      FeedbackForm(),
      PersonalInformationForm(),
    ];
  }
}
