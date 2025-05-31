import 'package:dash_flags/dash_flags.dart';
import 'package:flutter/material.dart';
import 'package:frontend/configs/locale_provider.dart';
import 'package:frontend/services/api_service.dart';
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
            onChanged: (Language? language) async{
              switch (language) {
                case Language.pt_br:
                  provider.setLocale(Locale('pt', 'BR'));
                  await (await ApiService.create()).client.updateLanguage(Language.pt_br.name);
                  break;
                case Language.en_us:
                  provider.setLocale(Locale('en', 'US'));
                  await (await ApiService.create()).client.updateLanguage(Language.en_us.name);
                  break;
                case Language.pt:
                  provider.setLocale(Locale('pt', 'PT'));
                  await (await ApiService.create()).client.updateLanguage(Language.pt.name);
                  break;
                case Language.es:
                  provider.setLocale(Locale('es', 'ES'));
                  await (await ApiService.create()).client.updateLanguage(Language.es.name);
                  break;
                default:
                  provider.setLocale(Locale('pt', 'PT'));
                  await (await ApiService.create()).client.updateLanguage(Language.pt_br.name);
              }
            }));
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
