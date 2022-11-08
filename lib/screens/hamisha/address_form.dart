/*
* File : Forms
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

class AddressForm extends StatefulWidget {
  @override
  _AddressFormState createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  bool _passwordVisible = false;
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    selectedTime = TimeOfDay.now();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  late TimeOfDay selectedTime;
  DateTime? selectedDate;

  double _sliderValue1 = 30;
  double _sliderValue2 = 60;
  RangeValues rangeValues = RangeValues(20, 80);

  bool? _switch = true, _check1 = true, _check2 = false, _check3 = true;
  int? _radioValue = 1;

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

  _pickTime(BuildContext context) async {
    TimeOfDay? t =
        await showTimePicker(context: context, initialTime: selectedTime);
    if (t != null)
      setState(() {
        selectedTime = t;
        showSnackBarWithFloating(t.format(context));
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Container(
            color: theme.backgroundColor,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  
                  Container(
                    padding: FxSpacing.xy(16, 8),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "From",
                            border: theme.inputDecorationTheme.border,
                            enabledBorder: theme.inputDecorationTheme.border,
                            focusedBorder: theme.inputDecorationTheme.focusedBorder,
                            prefixIcon: Icon(Icons.location_on_outlined, size: 24),
                          ),
                        ),
                        Padding(
                          padding: FxSpacing.top(16),
                          child: 
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "To",
                            border: theme.inputDecorationTheme.border,
                            enabledBorder: theme.inputDecorationTheme.border,
                            focusedBorder: theme.inputDecorationTheme.focusedBorder,
                            prefixIcon: Icon(Icons.location_on_outlined, size: 24),
                          ),
                        ),
                        ),
                        
                      ],
                    ),
                  ),
                  Divider(
                    color: theme.dividerColor,
                    thickness: 1,
                  ),
                  Container(
                    padding: FxSpacing.fromLTRB(16, 16, 16, 8),
                    child: FxText.titleMedium("Date & Time Picker",
                        fontWeight: 600, letterSpacing: 0.2),
                  ),
                  Container(
                    padding: FxSpacing.xy(8, 16),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            margin: FxSpacing.right(8),
                            child: FxButton(
                              borderRadiusAll: 4,
                              elevation: 0,
                              onPressed: () {
                                _pickTime(context);
                              },
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    FeatherIcons.clock,
                                    color: theme.colorScheme.onPrimary,
                                    size: 20,
                                  ),
                                  FxSpacing.width(8),
                                  FxText.bodyMedium("Select Time",
                                      fontWeight: 600,
                                      color: theme.colorScheme.onPrimary,
                                      letterSpacing: 0.3),
                                ],
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
                                  FxText.bodyMedium("Select Date",
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
                  
                  Divider(
                    color: theme.dividerColor,
                    thickness: 1,
                  ),
                
                
                  Container(
                    padding: FxSpacing.nBottom(16),
                    child: FxText.titleMedium("Items",
                        fontWeight: 600, letterSpacing: 0.2),
                  ),
                  Container(
                    padding: FxSpacing.xy(16, 8),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Checkbox(
                              activeColor: theme.colorScheme.primary,
                              onChanged: (bool? value) {
                                setState(() {
                                  _check1 = value;
                                });
                              },
                              value: _check1,
                            ),
                            FxText.titleSmall("TV & Dish",
                                color: theme.colorScheme.onBackground)
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Checkbox(
                              value: _check2,
                              activeColor: theme.colorScheme.primary,
                              onChanged: (bool? value) {
                                setState(() {
                                  _check2 = value;
                                });
                              },
                            ),
                            FxText.titleSmall("BedRoom",
                                color: theme.colorScheme.onBackground)
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Checkbox(
                              value: _check3,
                              activeColor: theme.colorScheme.primary,
                              onChanged: (bool? value) {
                                setState(() {
                                  _check3 = value;
                                });
                              },
                            ),
                            FxText.titleSmall("Fridge",
                                color: theme.colorScheme.onBackground)
                          ],
                        ),
                      ],
                    ),
                  ),
                  
                  Container(
                    margin: FxSpacing.top(16),
                    alignment: Alignment.center,
                    child: FxButton(
                        elevation: 0,
                        borderRadiusAll: 4,
                        onPressed: () {},
                        padding: FxSpacing.xy(24, 8),
                        child: FxText.bodyMedium("SUBMIT",
                            fontWeight: 600,
                            letterSpacing: 0.2,
                            color: theme.colorScheme.onPrimary)),
                  )
                  
                ],
              ),
            )));
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
