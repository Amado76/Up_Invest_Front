import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_invest_front/app/core/util/l10n/generated/l10n.dart';

import 'package:up_invest_front/app/core/widgets/custom_scaffold/custom_scaffold.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_bloc.dart';
import 'package:up_invest_front/app/modules/home/widgets/asset_search_bar.dart';
import 'package:up_invest_front/app/modules/home/widgets/home_main_card.dart';
import 'package:up_invest_front/app/modules/home/widgets/home_secondary_card_row.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final double systemBarSize = MediaQuery.viewPaddingOf(context).top;
    final double bottomBarSize = MediaQuery.viewPaddingOf(context).bottom;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final IntlStrings intlStrings = IntlStrings.current;
    final AuthBloc authBloc = Modular.get<AuthBloc>();
    const double mainContainerSize = 250;
    const double homeMainCardSize = 200;
    final List<String>? nameParts =
        authBloc.state.authUser?.displayName.split(' ');
    String? firstName = nameParts?.first;
    return CustomScaffold(
      leftPadding: 0,
      rightPadding: 0,
      appBarTitle: '',
      appBarbackgroundColor: colorScheme.primary,
      scaffoldBackgroundColor: colorScheme.primary,
      textColor: colorScheme.onPrimary,
      widget: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    color: colorScheme.primary,
                    height: mainContainerSize,
                    width: size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              intlStrings.homeWelcomeTitle(firstName ?? ''),
                              style: TextStyle(
                                color: colorScheme.onPrimary,
                                fontSize: 38,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                            Text(
                              intlStrings.homeWelcomeMessage,
                              style: TextStyle(
                                  color: colorScheme.onPrimary, fontSize: 20),
                            ),
                            const SizedBox(height: 20),
                            const AssetsSearchBar(),
                          ]),
                    ),
                  ),
                  Container(
                    color: colorScheme.background,
                    height: size.height -
                        systemBarSize -
                        bottomBarSize -
                        mainContainerSize -
                        100,
                    width: size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Column(
                        children: [
                          HomeSecondaryCardRow(
                            mainContainerSize: mainContainerSize,
                            currentBalanceTitle: intlStrings.homeCurrentBalance,
                            currentBalanceValue:
                                intlStrings.homeValueInDollar(49250.00),
                            investedAmountTitle: intlStrings.homeInvestedAmount,
                            investedAmountValue:
                                intlStrings.homeValueInReais(44250.00),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            height: 150,
                            width: size.width,
                            decoration: BoxDecoration(
                                color: colorScheme.background,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: colorScheme.onBackground
                                        .withOpacity(0.2),
                                    blurRadius: 10,
                                    offset: const Offset(0, 5),
                                  ),
                                ]),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const SizedBox(width: 30),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 10),
                                      Text(
                                        intlStrings.homeGoalCardTitle,
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: colorScheme.onBackground,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        intlStrings.homeMonthDividendsGoal,
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: colorScheme.onBackground,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        intlStrings.homeValueInDollar(4000),
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: colorScheme.outline,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        intlStrings.homeLastMonthDividendsValue,
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: colorScheme.onBackground,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        intlStrings.homeValueInDollar(1500),
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: colorScheme.outline,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                      child: Image.asset(
                                          'assets/images/flag.png')),
                                  const SizedBox(width: 10),
                                ]),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const HomeMainCard(
                height: homeMainCardSize,
                mainContainerSize: mainContainerSize,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
