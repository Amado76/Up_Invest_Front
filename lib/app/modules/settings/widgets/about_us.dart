import 'package:flutter/material.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';
import 'package:up_invest_front/app/modules/settings/widgets/settings_options_row.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final intlStrings = IntlStrings.of(context);

    return SettingsOptionsRow(
        icon: Icons.info_outline,
        text: intlStrings.settingsAboutUs,
        button: IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => const AlertDialog(
                      title: Text('UpInvest - Quem somos nós!'),
                      content: AboutMeText()));
            },
            icon: ImageIcon(
              color: colorScheme.onBackground,
              const AssetImage('assets/icons/short_right.png'),
            )));
  }
}

class AboutMeText extends StatefulWidget {
  const AboutMeText({super.key});

  @override
  State<AboutMeText> createState() => _AboutMeTextState();
}

class _AboutMeTextState extends State<AboutMeText> {
  String linkedinUrl = 'https://www.linkedin.com/in/bruno-amado-1b4b1610a/';
  String githubUrl = 'https://github.com/Amado76';
  String email = 'amado.bruno@gmail.com';

  @override
  Widget build(BuildContext context) {
    final intlStrings = IntlStrings.of(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(intlStrings.aboutUsTextOne),
          const SizedBox(
            height: 18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () async {
                  Uri uriParams = Uri(scheme: 'mailto', path: email);
                  if (await canLaunchUrl(uriParams)) {
                    await launchUrl(uriParams);
                  } else {
                    throw 'Não foi possível abrir o link! :(';
                  }
                },
                child: SizedBox(
                    height: 50, child: Image.asset('assets/images/email.png')),
              ),
              GestureDetector(
                onTap: () async {
                  Uri uri = Uri.parse(linkedinUrl);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri);
                  } else {
                    throw 'Não foi possível abrir o link! :(';
                  }
                },
                child: SizedBox(
                    height: 50,
                    child: Image.asset('assets/images/linkedin.png')),
              ),
              GestureDetector(
                onTap: () async {
                  Uri uri = Uri.parse(githubUrl);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri);
                  } else {
                    throw 'Não foi possível abrir o link! :(';
                  }
                },
                child: SizedBox(
                    height: 50, child: Image.asset('assets/images/github.png')),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Text(intlStrings.aboutUsTextTwo),
        ],
      ),
    );
  }
}
