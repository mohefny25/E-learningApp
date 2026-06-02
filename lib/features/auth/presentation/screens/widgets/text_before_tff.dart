import 'package:flutter/cupertino.dart';

import '../../../../../core/theme/text_styles.dart';

class TextBeforeTextFormField extends StatelessWidget {
  const TextBeforeTextFormField({
    super.key,
    required this.text
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,style: AppTextStyles.s14w600(context),);
  }
}
