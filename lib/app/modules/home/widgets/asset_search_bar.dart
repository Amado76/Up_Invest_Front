import 'package:flutter/material.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';

class AssetsSearchBar extends StatelessWidget {
  const AssetsSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final IntlStrings intlStrings = IntlStrings.current;
    final colorScheme = Theme.of(context).colorScheme;
    return SearchBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Icon(Icons.search, color: colorScheme.primary),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      hintText: intlStrings.homeSearchBarHint,
      hintStyle: MaterialStateProperty.all(
        TextStyle(
          color: colorScheme.onBackground.withOpacity(0.5),
        ),
      ),
    );
  }
}
