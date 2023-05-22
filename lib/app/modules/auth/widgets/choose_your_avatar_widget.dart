import 'package:flutter/material.dart';
import 'package:up_invest_front/app/modules/user/avatar_model.dart';

class ChooseYourAvatarWidget extends StatefulWidget {
  const ChooseYourAvatarWidget({Key? key}) : super(key: key);

  @override
  State<ChooseYourAvatarWidget> createState() => _ChooseYourAvatarWidgetState();
}

class _ChooseYourAvatarWidgetState extends State<ChooseYourAvatarWidget> {
  final avatarList = AvatarModel().avatarList;
  late var avatarImage = avatarList[1];
  int index = 1;

  void _changeAvatar(key) {
    setState(() {
      if (index < avatarList.length - 1 && key == 'FowardButton') {
        index++;
      }
      if (index > 1 && key == 'BackButton') {
        index--;
      }
      avatarImage = avatarList[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
                backgroundColor: colorScheme.tertiary,
                radius: 90,
                backgroundImage: AssetImage(avatarImage)),
            Positioned(
              top: 140,
              left: 10,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: colorScheme.tertiaryContainer.withOpacity(0.7)),
                child: IconButton(
                    onPressed: () => _changeAvatar('BackButton'),
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
                    onPressed: () => _changeAvatar('FowardButton'),
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
