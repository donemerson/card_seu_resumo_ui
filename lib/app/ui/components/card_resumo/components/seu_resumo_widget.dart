// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../../resources/resources.dart';
import '../../../ui.dart';

class SeuResumoWidget extends StatelessWidget {
  final VoidCallback onMenuTap;
  const SeuResumoWidget({Key? key, required this.onMenuTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Text(
            R.string.seuResumo,
            style: MyTypography.proximaNovaExtraBold25.apply(
              color: MyColors.blue1,
            ),
            maxLines: 1,
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: MenuButtonWidget(
            onTap: onMenuTap,
          ),
        )
      ],
    );
  }
}
