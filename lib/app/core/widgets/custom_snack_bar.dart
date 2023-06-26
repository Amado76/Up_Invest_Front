import 'package:flutter/material.dart';

class CustomSnackBar {
  showBottomErrorSnackBar(String title, String message, BuildContext context) {
    return _generateCustomSnackBar(
        textColor: Theme.of(context).colorScheme.onError,
        backgroundColor: Theme.of(context).colorScheme.error,
        imageColor: Theme.of(context).colorScheme.onError.withOpacity(0.1),
        image: 'assets/icons/et.png',
        title: title,
        message: message,
        context: context);
  }

  showBottomSuccessSnackBar(
      String title, String message, BuildContext context) {
    return _generateCustomSnackBar(
        textColor: Colors.white,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        imageColor: null,
        image: 'assets/images/flag.png',
        title: title,
        message: message,
        context: context);
  }

  _generateCustomSnackBar(
      {required BuildContext context,
      required Color textColor,
      required Color backgroundColor,
      required Color? imageColor,
      required String image,
      required String title,
      required String message}) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Stack(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(25, 16, 16, 0),
            height: 90,
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Row(
              children: [
                const SizedBox(width: 48),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title,
                            style: TextStyle(
                                fontSize: 16,
                                color: textColor,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text(
                          message,
                          style: TextStyle(fontSize: 15, color: textColor),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ]),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: -11,
            child: Image.asset(
              image,
              height: 80,
              color: imageColor,
            ),
          ),
        ],
      ),
    ));
  }
}
