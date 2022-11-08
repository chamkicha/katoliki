/*
* File : Personal Information Form
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class PersonalInformationForm extends StatefulWidget {
  @override
  _PersonalInformationFormState createState() =>
      _PersonalInformationFormState();
}

class _PersonalInformationFormState extends State<PersonalInformationForm> {
  int? _radioValue = 1;

  late ThemeData theme;
  late CustomTheme customTheme;
  late TimeOfDay selectedTime;
  DateTime? selectedDate;

    _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate!,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        showSnackBarWithFloating(picked.day.toString() +
            " - " +
            picked.month.toString() +
            " - " +
            picked.year.toString());
      });
  }

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: FxSpacing.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Container(
                  child: FxText.titleMedium("Komunyo ya kwanza", fontWeight: 600),
                ),
                
                Container(
                    padding: FxSpacing.xy(8, 16),
                    child: Row(
                      children: <Widget>[
                       
                        Expanded(
                          child:Padding(
                          padding: FxSpacing.top(1),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Parokia:",
                              border: theme.inputDecorationTheme.border,
                              enabledBorder: theme.inputDecorationTheme.border,
                              focusedBorder:
                                  theme.inputDecorationTheme.focusedBorder,
                              prefixIcon: Icon(Icons.phone),
                            ),
                            
                          ),
                        ),
                        ),
                        FxSpacing.width(16),
                        Expanded(
                          child: Container(
                            margin: FxSpacing.left(8),
                            child: FxButton(
                              padding: FxSpacing.y(8),
                              onPressed: () {
                                _pickDate(context);
                              },
                              elevation: 0,
                              borderRadiusAll: 4,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    FeatherIcons.calendar,
                                    size: 20,
                                    color: theme.colorScheme.onPrimary,
                                  ),
                                  FxSpacing.width(8),
                                  FxText.bodyMedium("Tarehe",
                                      fontWeight: 600,
                                      color: theme.colorScheme.onPrimary,
                                      letterSpacing: 0.3),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                Container(
                  margin: FxSpacing.top(8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Tarehe ya kuzaliwa",
                      hintText: "DD/MM/YYYY",
                      border: theme.inputDecorationTheme.border,
                      enabledBorder: theme.inputDecorationTheme.border,
                      focusedBorder: theme.inputDecorationTheme.focusedBorder,
                      prefixIcon: Icon(
                        Icons.calendar_today_outlined,
                        size: 24,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      FxText.bodyLarge("Jinsia", fontWeight: 600),
                      Container(
                        margin: FxSpacing.left(8),
                        child: Radio(
                          value: 1,
                          activeColor: theme.colorScheme.primary,
                          groupValue: _radioValue,
                          onChanged: (int? value) {
                            setState(() {
                              _radioValue = value;
                            });
                          },
                        ),
                      ),
                      FxText.titleSmall("Male",
                          color: theme.colorScheme.onBackground.withAlpha(240),
                          letterSpacing: 0.2,
                          fontWeight: 500),
                      Container(
                        margin: FxSpacing.left(8),
                        child: Radio(
                          value: 2,
                          activeColor: theme.colorScheme.primary,
                          groupValue: _radioValue,
                          onChanged: (int? value) {
                            setState(() {
                              _radioValue = value;
                            });
                          },
                        ),
                      ),
                      FxText.titleSmall("Female",
                          color: theme.colorScheme.onBackground.withAlpha(240),
                          letterSpacing: 0.2,
                          fontWeight: 500),
                    ],
                  ),
                ),
                Container(
                  padding: FxSpacing.top(20),
                  child: FxText.titleMedium("Contact", fontWeight: 600),
                ),
                Container(
                  margin: FxSpacing.top(8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Namba ya Simu",
                      border: theme.inputDecorationTheme.border,
                      enabledBorder: theme.inputDecorationTheme.border,
                      focusedBorder: theme.inputDecorationTheme.focusedBorder,
                      prefixIcon: Icon(
                        Icons.phone_outlined,
                        size: 24,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: FxSpacing.top(8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: theme.inputDecorationTheme.border,
                      enabledBorder: theme.inputDecorationTheme.border,
                      focusedBorder: theme.inputDecorationTheme.focusedBorder,
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        size: 24,
                      ),
                    ),
                  ),
                ),
                
               
              ],
            ),
          ),
        ],
      ),
    ));
  }
  void showSnackBarWithFloating(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: FxText.titleSmall(message, color: theme.colorScheme.onPrimary),
        backgroundColor: theme.colorScheme.primary,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
  
}
