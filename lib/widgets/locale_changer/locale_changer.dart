import 'package:dash_flags/dash_flags.dart';
import 'package:flutter/material.dart';
import 'package:frontend/configs/locale_provider.dart';
import 'package:provider/provider.dart';

class LocaleChanger extends StatelessWidget {
  const LocaleChanger({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleProvider provider = Provider.of<LocaleProvider>(context, listen: true);
    return SizedBox(
      width: 75,
      child: DropdownButtonFormField<Language>(
        value: getCurrentLanguage(provider.locale),
        items: [Language.pt_br, Language.en_us, Language.pt].map((e) {
          return DropdownMenuItem<Language>(
            value: e,
            child: LanguageFlag(language: e),
          );
        }).toList(),
        onChanged: (Language? language) {
          switch (language) {
            case Language.pt_br:
              provider.setLocale(Locale('pt', 'BR'));
              break;
            case Language.en_us:
              provider.setLocale(Locale('en', 'US'));
              break;
            case Language.pt:
              provider.setLocale(Locale('pt', 'PT'));
              break;
            default:
              provider.setLocale(Locale('pt', 'PT'));
          }
        },
      ),
    );
  }

  Language getCurrentLanguage(Locale locale) {
    switch (locale) {
      case const Locale('pt', 'BR'):
        return Language.pt_br;
      case const Locale('pt', 'PT'):
        return Language.pt;
      case const Locale('en', 'US'):
        return Language.en_us;
      default:
        return Language.pt;
    }
  }

}
