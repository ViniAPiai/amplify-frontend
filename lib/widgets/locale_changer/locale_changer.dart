import 'package:dash_flags/dash_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/locale/locale_bloc.dart';
import 'package:frontend/bloc/locale/locale_event.dart';
import 'package:frontend/bloc/locale/locale_state.dart';
import 'package:frontend/services/api_service.dart';

class LocaleChanger extends StatelessWidget {
  const LocaleChanger({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleBloc, LocaleState>(
      builder: (context, state) {
        return SizedBox(
            width: 75,
            child: DropdownButtonFormField<Language>(
                value: getCurrentLanguage(state.locale),
                items: [Language.pt_br, Language.en_us, Language.pt].map((e) {
                  return DropdownMenuItem<Language>(
                    value: e,
                    child: LanguageFlag(language: e),
                  );
                }).toList(),
                onChanged: (Language? language) async{
                  switch (language) {
                    case Language.pt_br:
                      context.read<LocaleBloc>().add(ChangeLocale(Locale('pt', 'BR')));
                      await (await ApiService.create()).client.updateLanguage(Language.pt_br.name);
                      break;
                    case Language.en_us:
                      context.read<LocaleBloc>().add(ChangeLocale(Locale('en', 'US')));
                      await (await ApiService.create()).client.updateLanguage(Language.en_us.name);
                      break;
                    case Language.pt:
                      context.read<LocaleBloc>().add(ChangeLocale(Locale('pt', 'PT')));
                      await (await ApiService.create()).client.updateLanguage(Language.pt.name);
                      break;
                    case Language.es:
                      context.read<LocaleBloc>().add(ChangeLocale(Locale('es', 'ES')));
                      await (await ApiService.create()).client.updateLanguage(Language.es.name);
                      break;
                    default:
                      context.read<LocaleBloc>().add(ChangeLocale(Locale('pt', 'BR')));
                      await (await ApiService.create()).client.updateLanguage(Language.pt_br.name);
                  }
                }));
      }
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
