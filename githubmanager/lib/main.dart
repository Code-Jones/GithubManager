import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:githubmanager/github_auth.dart';
import 'package:url_launcher/url_launcher.dart';
import 'mainPage.dart';
import 'github_oauth_credentials.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

void main() {
  runApp(MyApp());
}

// Add your github Oauth ids to 'github_oauth_credentials_hidden.dart' and cut off the '_hidden
// instructions to add github Oauth app https://docs.github.com/en/developers/apps/creating-an-oauth-app

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GitHub Manager',
        theme: FlexColorScheme.light(
          colors: FlexColor.schemes[FlexScheme.money]!.light,
          // colors: customFlexScheme.light,
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          surfaceStyle: FlexSurface.strong,
        ).toTheme,
        darkTheme: FlexColorScheme.dark(
          // colors: customFlexScheme.dark,
          colors: FlexColor.schemes[FlexScheme.money]!.dark,
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          surfaceStyle: FlexSurface.strong,
        ).toTheme,
        themeMode: themeMode,
        home: HomePage(
          title: 'Github Manager',
          themeMode: themeMode,
          onThemeModeChanged: (ThemeMode mode) {
            setState(() {
              themeMode = mode;
            });
          },
          flexSchemeData: customFlexScheme,
        ));
  }
}


class HomePage extends StatefulWidget {
  HomePage(
      {Key? key,
      required this.title,
      required this.themeMode,
      required this.onThemeModeChanged,
      required this.flexSchemeData})
      : super(key: key);
  final String title;
  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;
  final FlexSchemeData flexSchemeData;

  @override
  _HomePageState createState() => _HomePageState(
        title: title,
        themeMode: themeMode,
        onThemeModeChanged: onThemeModeChanged,
        flexSchemeData: flexSchemeData,
      );
}

class _HomePageState extends State<HomePage> {
  _HomePageState(
      {required this.title,
      required this.themeMode,
      required this.onThemeModeChanged,
      required this.flexSchemeData});

  String title;
  var themeMode;
  var onThemeModeChanged;
  var flexSchemeData;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;


    return GithubLoginWidget(
      builder: (context, client) {
        return Scaffold(
          endDrawer: Drawer(
            child: ListView(shrinkWrap: true, children: <Widget>[
              DrawerHeader(
                  decoration: BoxDecoration(
                    color: theme.primaryColor,
                  ),
                  child: Text(
                    'Change Theme',
                    style:
                    // textTheme.headline1
                    TextStyle(color: Colors.white, fontSize: 25),
                  )),
              Card(
                borderOnForeground: true,
                elevation: 3,
                child: FlexThemeModeSwitch(
                  optionButtonMargin: EdgeInsets.all(10),
                  labelAbove: false,
                  height: 0,
                  width: 0,
                  themeMode: widget.themeMode,
                  onThemeModeChanged: widget.onThemeModeChanged,
                  flexSchemeData: widget.flexSchemeData,
                ),
              ),
            ]),
          ),
          appBar: AppBar(
            title: Text(title),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => launch('https://gist.github.com/'),
            child: Icon(Octicons.gist),
          ),
          body: MainPage(client: client),
        );
      },
      githubClientId: githubClientId,
      githubClientSecret: githubClientSecret,
      githubScopes: githubScopes,
    );
  }
}

const FlexSchemeData customFlexScheme = FlexSchemeData(
  name: 'Toledo purple',
  description: 'Purple theme created from custom defined colors.',
  light: FlexSchemeColor(
    primary: Color(0xFF4E0028),
    primaryVariant: Color(0xFF320019),
    secondary: Color(0xFF003419),
    secondaryVariant: Color(0xFF002411),
  ),
  dark: FlexSchemeColor(
    primary: Color(0xFF9E7389),
    primaryVariant: Color(0xFF775C69),
    secondary: Color(0xFF738F81),
    secondaryVariant: Color(0xFF5C7267),
  ),
);

ThemeData lightTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: Color(0xFFF49FB6),
    scaffoldBackgroundColor: Color(0xFFFAF8F0),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Color(0xFF24737c),
      backgroundColor: Color(0xFFA6E0DE),
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: Colors.black87,
      ),
    ));

ThemeData darkTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryColor: Color(0xFF1E1E2C),
  scaffoldBackgroundColor: Color(0xFF2D2D44),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      color: Color(0xFF33E1Ed),
    ),
  ),
);
