import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppThemeProviderWrapper(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(
          title: 'Flutter Demo Home Page',
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _changeTheme() {
    setState(() {
      final AppThemeProviderWrapperState wrapper =
          AppThemeProviderWrapper.of(context);
      wrapper.updateTheme();
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;
    final FontPalette fonts = theme.fonts;

    return Scaffold(
      backgroundColor: colors.backgroundBasic.color(),
      appBar: AppBar(
        title: Text(
          widget.title,
          style: fonts.title1.toTextStyle(
            colors.textPrimary.color(),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.all(8),
              child: PrimaryButton(
                title: 'Primary Button',
                sizeType: ButtonSizeType.medium,
                direction: IconDirection.left,
                icon: Icon(
                  Icons.headphones,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: SecondaryButton(
                title: 'Secondary Button',
                sizeType: ButtonSizeType.medium,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: GhostButton(
                title: 'Ghost Button',
                sizeType: ButtonSizeType.medium,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeTheme,
        tooltip: 'Theme',
        child: const Icon(AdmiralIcons.admiral_ic_doc_attention_solid),
      ),
    );
  }
}
