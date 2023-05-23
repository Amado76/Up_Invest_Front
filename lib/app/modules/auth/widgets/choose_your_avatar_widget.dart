import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_bloc.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_event.dart';

class ChooseYourAvatarWidget extends StatefulWidget {
  final String avatarImage;
  const ChooseYourAvatarWidget({
    Key? key,
    required this.avatarImage,
  }) : super(key: key);

  @override
  State<ChooseYourAvatarWidget> createState() => _ChooseYourAvatarWidgetState();
}

class _ChooseYourAvatarWidgetState extends State<ChooseYourAvatarWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final authBloc = Modular.get<AuthBloc>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
                backgroundColor: colorScheme.tertiary,
                radius: 90,
                backgroundImage: AssetImage(widget.avatarImage)),
            Positioned(
              top: 140,
              left: 10,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: colorScheme.tertiaryContainer.withOpacity(0.7)),
                child: IconButton(
                    onPressed: () {
                      authBloc.add(const AuthEventChangeAvatar(
                          avatarNavigation: 'BackButton'));
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: colorScheme.onBackground,
                    )),
              ),
            ),
            Positioned(
              top: 140,
              left: 130,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: colorScheme.tertiaryContainer.withOpacity(0.7)),
                child: IconButton(
                    onPressed: () {
                      authBloc.add(const AuthEventChangeAvatar(
                          avatarNavigation: 'FowardButton'));
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: colorScheme.onBackground,
                    )),
              ),
            )
          ],
        ),
      ],
    );
  }
}
