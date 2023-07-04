import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class AuthButton extends StatelessWidget {
  final String text;
  // text 변수를 선언해줌

  const AuthButton({
    super.key,
    required this.text,
  });
  // super.key 커서 이동 후 code action 열어서 final field parameter initialize 버튼 클릭

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      // FractionallySizedBox : 절대값을 갖지 않되 father 크기에 상대적인 fraction 비율 갖는 박스
      widthFactor: 1,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: Sizes.size14),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade300,
            width: Sizes.size1,
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: Sizes.size16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
