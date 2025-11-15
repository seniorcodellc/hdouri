import 'package:flutter/material.dart';

void showLoading(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return const SizedBox(
          width: 100,
          height: 100,
          child: PopScope(
            canPop: false,
            child: Center(
              child: SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(
                  strokeWidth: 10,
                ),
              ),
            ),
          ),
        );
      });
}

void hideLoading(BuildContext context) {
  Navigator.pop(context);
}
