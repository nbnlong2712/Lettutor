import 'package:flutter/material.dart';
import 'package:flutter_lettutor/provider/language/language_provider.dart';
import 'package:flutter_lettutor/provider/theme/theme_model.dart';
import 'package:flutter_lettutor/screens/profile/profile_dropdown.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AdvancedSettingScreen extends StatefulWidget {
  static const String router = "/advanced-setting-screen";

  const AdvancedSettingScreen({Key? key}) : super(key: key);

  @override
  State<AdvancedSettingScreen> createState() => _AdvancedSettingScreenState();
}

class _AdvancedSettingScreenState extends State<AdvancedSettingScreen> {
  String language = "English";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Advanced Setting",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back, color: Colors.black),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    "Language",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ),
                ProfileDropDown(
                  listItem: const ["Vietnamese", "English"],
                  value: language,
                  onChanged: (value) {
                    setState(() {
                      language = value!;
                      final provider = Provider.of<LanguageProvider>(context, listen: false);
                      if (value == "English") {
                        provider.setLocale(const Locale('en'));
                      }
                      provider.setLocale(const Locale('vi'));
                    });

                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    "Theme",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("Light"),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Transform.scale(
                          scale: 1.5,
                          child: Switch(
                            inactiveTrackColor: Colors.black12,
                            activeTrackColor: Colors.black12,
                            activeColor: Colors.black87,
                            inactiveThumbColor: Colors.white,
                            activeThumbImage: const AssetImage("assets/images/dark.png"),
                            inactiveThumbImage: const AssetImage("assets/images/light.png"),
                            value: themeProvider.isDark,
                            onChanged: (value) {
                              if (themeProvider.isDark) {
                                themeProvider.isDark = false;
                              } else {
                                themeProvider.isDark = true;
                              }
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("Dark"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
