import 'package:flutter/material.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';
import 'package:up_invest_front/app/core/widgets/snackbar/custom_snack_bar.dart';
import 'package:up_invest_front/app/modules/settings/util/settings_error.dart';
import 'package:up_invest_front/app/core/widgets/custom_alert_dialog.dart';
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
              showCustomDialog(
                  context: context,
                  title: Center(child: Text(intlStrings.settingsAboutUs)),
                  content: const AboutMeText(),
                  barrierDismissible: true);
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
  String linkedinUrl = 'https://www.linkedin.com/in/brunoamado76';
  String githubUrl = 'https://github.com/Amado76';
  String email = 'amado.bruno@gmail.com';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final intlStrings = IntlStrings.of(context);
    final customBar = CustomSnackBar();
    return SingleChildScrollView(
      child: Column(
        children: [
          Divider(
            height: 1,
            color: colorScheme.outline,
          ),
          const SizedBox(
            height: 18,
          ),
          Text(
            intlStrings.aboutUsTextOne,
            style: TextStyle(color: colorScheme.onBackground),
          ),
          const SizedBox(
            height: 18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () async {
                  Uri uriParams = Uri(scheme: 'mailto', path: email);

                  try {
                    await launchUrl(uriParams);
                  } on Exception {
                    SettingsError settignsError = SettingsError.from(
                        Exception('error-opening-external-link'));
                    customBar.showBottomErrorSnackBar(settignsError.dialogTitle,
                        settignsError.dialogText, context);
                  }
                  await launchUrl(uriParams);
                },
                child: SizedBox(
                    height: 50, child: Image.asset('assets/images/email.png')),
              ),
              GestureDetector(
                onTap: () async {
                  Uri uri = Uri.parse(linkedinUrl);
                  try {
                    await launchUrl(uri);
                  } on Exception {
                    SettingsError settignsError = SettingsError.from(
                        Exception('error-opening-external-link'));
                    customBar.showBottomErrorSnackBar(settignsError.dialogTitle,
                        settignsError.dialogText, context);
                  }
                },
                child: SizedBox(
                    height: 50,
                    child: Image.asset('assets/images/linkedin.png')),
              ),
              GestureDetector(
                onTap: () async {
                  Uri uri = Uri.parse(githubUrl);
                  try {
                    await launchUrl(uri);
                  } on Exception {
                    SettingsError settignsError = SettingsError.from(
                        Exception('error-opening-external-link'));
                    customBar.showBottomErrorSnackBar(settignsError.dialogTitle,
                        settignsError.dialogText, context);
                  }
                },
                child: SizedBox(
                    height: 50, child: Image.asset('assets/images/github.png')),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Text(
            intlStrings.aboutUsTextTwo,
            style: TextStyle(color: colorScheme.onBackground),
          ),
        ],
      ),
    );
  }
}
