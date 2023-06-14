import 'dart:io' show File;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';
import 'package:up_invest_front/app/core/widgets/loading/loading_screen.dart';
import 'package:up_invest_front/app/core/widgets/snackbar/custom_snack_bar.dart';
import 'package:up_invest_front/app/modules/auth/model/avatar_model.dart';

import 'package:up_invest_front/app/modules/settings/bloc/settings/edit_details_bloc.dart';

class ChangeAvatar extends StatelessWidget {
  const ChangeAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final editDetailsBloc = Modular.get<EditDetailsBloc>();
    final IntlStrings intlStrings = IntlStrings.current;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Positioned(
        right: 20,
        bottom: 0,
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: colorScheme.tertiaryContainer),
          child: IconButton(
              onPressed: () {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      editDetailsBloc.add(const EditDetailsCleanAvatarList());
                      return AlertDialog(
                        backgroundColor: colorScheme.background,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0)),
                        title: Center(
                            child: Text(
                          intlStrings.editDetailsChooseAvatar,
                          style: TextStyle(color: colorScheme.onBackground),
                        )),
                        content: const SizedBox(
                          height: 300,
                          width: 300,
                          child: Column(
                            children: [
                              Divider(
                                color: Colors.grey,
                                height: 4.0,
                              ),
                              _ChooseAvatarWidget(),
                            ],
                          ),
                        ),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              OutlinedButton.icon(
                                  onPressed: () {
                                    editDetailsBloc.add(
                                        const EditDetailsCancelAvatarEdit());
                                    Navigator.of(context).pop();
                                  },
                                  icon: const Icon(Icons.cancel_outlined),
                                  label: Text(intlStrings.cancelButton)),
                              OutlinedButton.icon(
                                  onPressed: () {
                                    editDetailsBloc
                                        .add(const EditDetailsUpdateAvatar());
                                    Navigator.of(context).pop();
                                  },
                                  icon: const Icon(Icons.save_alt_outlined),
                                  label: Text(intlStrings.saveButton)),
                            ],
                          )
                        ],
                      );
                    });
              },
              icon: const Icon(Icons.edit)),
        ));
  }
}

class _ChooseAvatarWidget extends StatefulWidget {
  const _ChooseAvatarWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<_ChooseAvatarWidget> createState() => _ChooseAvatarWidgetState();
}

class _ChooseAvatarWidgetState extends State<_ChooseAvatarWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final imagePicker = ImagePicker();
    final editDetailsBloc = Modular.get<EditDetailsBloc>();
    AvatarModel avatar = editDetailsBloc.state.avatar;
    final customBar = CustomSnackBar();
    final hideLoading = LoadingScreen.instance().hide();
    final intlString = IntlStrings.of(context);

    return BlocConsumer<EditDetailsBloc, EditDetailsState>(
        bloc: editDetailsBloc,
        listener: (context, state) {
          return switch (state) {
            EditDetailsIdle(avatar: final newAvatar) => {
                hideLoading,
                avatar = newAvatar,
              },
            EditDetailsError(
              authError: final authError,
              settingsError: final settingsError
            ) =>
              {
                hideLoading,
                if (authError != null)
                  {
                    customBar.showBottomErrorSnackBar(
                        authError.dialogTitle, authError.dialogText, context)
                  }
                else if (settingsError != null)
                  {
                    customBar.showBottomErrorSnackBar(settingsError.dialogTitle,
                        settingsError.dialogText, context)
                  }
              },
            EditDetailsLoading() => LoadingScreen.instance()
                .show(context: context, text: intlString.loading),
            EditDetailsSuccess(settingsSuccess: final settingsSuccesss) => {
                hideLoading,
                customBar.showBottomSuccessSnackBar(
                    settingsSuccesss.dialogTitle,
                    settingsSuccesss.dialogText,
                    context)
              }
          };
        },
        builder: (context, state) {
          return Expanded(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 300, maxHeight: 300),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  if (avatar is StandardAvatar)
                    Center(
                      child: CircleAvatar(
                        radius: 103,
                        backgroundColor: colorScheme.tertiary,
                        child: CircleAvatar(
                            backgroundColor: colorScheme.tertiary,
                            radius: 100,
                            backgroundImage: AssetImage(avatar.path)),
                      ),
                    ),
                  if (avatar is CustomAvatar)
                    Center(
                      child: CircleAvatar(
                        radius: 103,
                        backgroundColor: colorScheme.tertiary,
                        child: CircleAvatar(
                            backgroundColor: colorScheme.tertiary,
                            radius: 100,
                            backgroundImage: FileImage(File(avatar.path))),
                      ),
                    ),
                  if (avatar is NetworkAvatar)
                    Center(
                      child: CircleAvatar(
                        radius: 103,
                        backgroundColor: colorScheme.tertiary,
                        child: CircleAvatar(
                            backgroundColor: colorScheme.tertiary,
                            radius: 100,
                            backgroundImage: NetworkImage(avatar.url)),
                      ),
                    ),
                  Positioned(
                    right: 60,
                    top: 50,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color:
                              colorScheme.tertiaryContainer.withOpacity(0.9)),
                      child: IconButton(
                          onPressed: () async {
                            final image = await imagePicker.pickImage(
                                source: ImageSource.gallery);
                            if (image == null) {
                              return;
                            }
                            editDetailsBloc.add(EditDetailsAddAvatarFromGallery(
                                imagePath: image.path));
                          },
                          icon: Icon(
                            Icons.photo,
                            color: colorScheme.onBackground,
                          )),
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    left: 60,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color:
                              colorScheme.tertiaryContainer.withOpacity(0.9)),
                      child: IconButton(
                          onPressed: () {
                            editDetailsBloc.add(
                                const EditDetailsChangeDisplayAvatar(
                                    avatarNavigation: 'BackButton'));
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: colorScheme.onBackground,
                          )),
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    right: 60,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color:
                              colorScheme.tertiaryContainer.withOpacity(0.7)),
                      child: IconButton(
                          onPressed: () {
                            editDetailsBloc.add(
                                const EditDetailsChangeDisplayAvatar(
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
            ),
          );
        });
  }
}
