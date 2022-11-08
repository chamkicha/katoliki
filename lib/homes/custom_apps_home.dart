import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import '../full_apps/nft/views/splash_screen.dart' as nft;
import '../theme/app_theme.dart';
import 'single_grid_item.dart';
import 'package:flutkit/screens/katoliki/register_screen.dart';

class CustomAppsHome extends StatefulWidget {
  @override
  _CustomAppsHomeState createState() => _CustomAppsHomeState();
}

class _CustomAppsHomeState extends State<CustomAppsHome>
    with TickerProviderStateMixin {
  late ThemeData theme;
  late CustomTheme customTheme;

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
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),
                                                            bottomRight: Radius.circular(30)),
                color: Color.fromARGB(255, 55, 62, 240),
                gradient: LinearGradient(colors: [(Color.fromARGB(255, 31, 177, 245)), Color.fromARGB(255, 9, 111, 148)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // children: [
                    //   Container(
                    //     margin: EdgeInsets.only(top: 50),
                    //     child: Image.asset(
                    //       "images/app_logo.png",
                    //       height: 90,
                    //       width: 90,
                    //     ),
                    //   ),
                      
                    // ],
                  )
              ),
            ),


            Container(
            padding: FxSpacing.fromLTRB(20, 20, 20, 20),
            child: ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              
              
              children: <Widget>[


                FxSpacing.height(20),

                GridView.count(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    crossAxisCount: 2,
                    padding: FxSpacing.zero,
                    mainAxisSpacing: 20,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    children: <Widget>[
                      SinglePageItem(
                        icon: './assets/icons/auth-outline.png',

                        navigation: RegisterScreen(),
                        title: "Sajili Muumini",
                      ),


                      SinglePageItem(
                        icon: './assets/icons/profile-outline.png',
                        navigation: nft.SplashScreen(),
                        title: "Orodha ya Waumini",
                      ),
                    ]),
                FxSpacing.height(20),
              ],
          )
        )
      
              
            
          ],
        )
      )
    );
  }
}
