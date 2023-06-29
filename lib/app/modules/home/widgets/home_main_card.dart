import 'package:flutter/material.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';

class HomeMainCard extends StatelessWidget {
  const HomeMainCard({
    super.key,
    required this.mainContainerSize,
    required this.height,
  });

  final double mainContainerSize;
  final double height;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final IntlStrings intlStrings = IntlStrings.current;
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding:
          EdgeInsets.only(right: 30, left: 30, top: mainContainerSize - 75),
      child: Center(
        child: Container(
            height: height,
            width: size.width,
            decoration: BoxDecoration(
                color: colorScheme.background,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.onBackground.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ]),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _HomeMainCardButton(
                  onTap: () {},
                  imagePath: 'assets/images/dashboard.png',
                  title: intlStrings.homeDashboardTitle,
                ),
                _HomeMainCardButton(
                  onTap: () {},
                  imagePath: 'assets/images/portfolio.png',
                  title: intlStrings.homePortfolioTitle,
                ),
              ],
            )),
      ),
    );
  }
}

class _HomeMainCardButton extends StatelessWidget {
  const _HomeMainCardButton({
    required this.onTap,
    required this.imagePath,
    required this.title,
  });
  final Function()? onTap;
  final String imagePath;
  final String title;
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 150,
          width: 150,
          child: Column(children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: colorScheme.primaryContainer,
              ),
              child: Transform.scale(
                scale: 0.8,
                child: Image.asset(
                  imagePath,
                ),
              ),
            ),
            Text(title,
                style: TextStyle(color: colorScheme.onBackground, fontSize: 20))
          ]),
        ),
      ),
    );
  }
}
