import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    super.key,
    required this.disabled,
  });
  // const FormButton({
  // super.key,
  // required String username,
  // }) : _username = username;

  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.size5),
          color:
              disabled ? Colors.grey.shade300 : Theme.of(context).primaryColor,
          // .isEmpty ? (if)  , : (if not)
        ),
        duration: const Duration(milliseconds: 200),
        // animatedcontainer은 자기 자신에 animation효과만 부여할뿐
        //그 children/child에 효과를 주진 않는다.
        child: AnimatedDefaultTextStyle(
          // text에 애니메이션을 주기 위해서는 animateddefaulttextstyle 위젯을 쓴다.
          duration: const Duration(milliseconds: 200),
          style: TextStyle(
            color: disabled ? Colors.grey.shade400 : Colors.white,
            fontWeight: FontWeight.w600,
          ),
          child: const Text(
            'Next',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
