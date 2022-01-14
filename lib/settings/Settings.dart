import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy_app/providers/AppConfigProvider.dart';
import 'package:islamy_app/settings/ThemeButtomSheet.dart';
import 'package:provider/provider.dart';

import 'LanguageButtomSheet.dart';



class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.language),
          InkWell(
            onTap: show_lang_buttomsheet,
            child: Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(provider.applang),
                  Icon(Icons.arrow_drop_down_sharp)
                ],
              ),
            ),
          ),
          Text(AppLocalizations.of(context)!.theme),
          InkWell(
            onTap: show_theme_buttomsheet,
            child: Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(provider.apptheme == ThemeMode.light
                      ? AppLocalizations.of(context)!.light
                      : AppLocalizations.of(context)!.dark),
                  Icon(Icons.arrow_drop_down_sharp)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  show_lang_buttomsheet() {
    showModalBottomSheet(
        context: context,
        builder: (buildcontext) {
          return LanguageButtomSheet();
        });
  }

  show_theme_buttomsheet() {
    showModalBottomSheet(
        context: context,
        builder: (buildcontext) {
          return ThemeButtomSheet();
        });
  }
}
