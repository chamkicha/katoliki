/*
* File : Forms
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

class KikanisaScreen extends StatefulWidget {
  @override
  _KikanisaScreenState createState() => _KikanisaScreenState();
}

class _KikanisaScreenState extends State<KikanisaScreen> {
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
                    padding: FxSpacing.fromLTRB(16, 16, 16, 8),
                    child: FxText.titleMedium("Taarifa Muumini",
                        fontWeight: 600, letterSpacing: 0.2),
                  ),
                  Container(
                    padding: FxSpacing.xy(16, 8),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Jina",
                            border: theme.inputDecorationTheme.border,
                            enabledBorder: theme.inputDecorationTheme.border,
                            focusedBorder:
                                theme.inputDecorationTheme.focusedBorder,
                            prefixIcon: Icon(Icons.person),
                          ),
                          
                        ),
                        Container(
                          padding: FxSpacing.fromLTRB(16, 16, 16, 8),
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
                            padding: FxSpacing.xy(16, 8),
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
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Baba",
                            border: theme.inputDecorationTheme.border,
                            enabledBorder: theme.inputDecorationTheme.border,
                            focusedBorder:
                                theme.inputDecorationTheme.focusedBorder,
                            prefixIcon: Icon(Icons.person),
                          ),
                          
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Mama",
                            border: theme.inputDecorationTheme.border,
                            enabledBorder: theme.inputDecorationTheme.border,
                            focusedBorder:
                                theme.inputDecorationTheme.focusedBorder,
                            prefixIcon: Icon(Icons.person),
                          ),
                          
                        ),
                        
                        Padding(
                          padding: FxSpacing.top(16),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Mahali ulipozaliwa",
                              border: theme.inputDecorationTheme.border,
                              enabledBorder: theme.inputDecorationTheme.border,
                              focusedBorder:
                                  theme.inputDecorationTheme.focusedBorder,
                              prefixIcon: Icon(Icons.phone),
                            ),
                            
                          ),
                        ),
                        
                       
                    Container(
                    padding: FxSpacing.xy(8, 16),
                    child: Row(
                      children: <Widget>[
                       
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
                                  FxText.bodyMedium("Tarehe ya kuzaliwa",
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
                        
                        
                        Padding(
                          padding: FxSpacing.top(16),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Parokia ya sasa",
                              border: theme.inputDecorationTheme.border,
                              enabledBorder: theme.inputDecorationTheme.border,
                              focusedBorder:
                                  theme.inputDecorationTheme.focusedBorder,
                              prefixIcon: Icon(Icons.phone),
                            ),
                            
                          ),
                        ),
                      


                 
                        
                        

                        
                      ],
                    ),
                  ),

                    

                  Container(
                    padding: FxSpacing.fromLTRB(16, 16, 16, 8),
                    child: FxText.titleMedium("Taarifa za Ubatizo",
                        fontWeight: 600, letterSpacing: 0.2),
                  ),

                  
                  Container(
                    padding: FxSpacing.xy(8, 8),
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


                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Jina la msaidii",
                            border: theme.inputDecorationTheme.border,
                            enabledBorder: theme.inputDecorationTheme.border,
                            focusedBorder:
                                theme.inputDecorationTheme.focusedBorder,
                            prefixIcon: Icon(Icons.person),
                          ),
                          
                        ),


                Container(
                  padding: FxSpacing.top(50),
                ),

                 
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
