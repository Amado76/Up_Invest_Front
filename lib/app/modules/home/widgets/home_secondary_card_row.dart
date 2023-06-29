import 'package:flutter/material.dart';

class HomeSecondaryCardRow extends StatelessWidget {
  const HomeSecondaryCardRow({
    super.key,
    required this.mainContainerSize,
    required this.currentBalanceValue,
    required this.investedAmountValue,
    required this.currentBalanceTitle,
    required this.investedAmountTitle,
  });

  final double mainContainerSize;
  final String investedAmountValue;
  final String investedAmountTitle;
  final String currentBalanceValue;
  final String currentBalanceTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _HomeSecondaryCardWidget(
            mainContainerSize: mainContainerSize,
            title: investedAmountTitle,
            value: investedAmountValue),
        _HomeSecondaryCardWidget(
          mainContainerSize: mainContainerSize,
          title: currentBalanceTitle,
          value: currentBalanceValue,
          valueColor: Colors.green,
        ),
      ],
    );
  }
}

class _HomeSecondaryCardWidget extends StatelessWidget {
  const _HomeSecondaryCardWidget(
      {required this.title,
      required this.value,
      required this.mainContainerSize,
      this.valueColor});

  final String title;
  final String value;
  final Color? valueColor;
  final double mainContainerSize;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        SizedBox(height: mainContainerSize - 95),
        Row(
          children: [
            Container(
                height: 80,
                width: 180,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(title,
                        style: TextStyle(
                            fontSize: 15, color: colorScheme.onBackground)),
                    Text(value,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: valueColor ?? colorScheme.onBackground)),
                  ],
                ))
          ],
        ),
      ],
    );
  }
}
