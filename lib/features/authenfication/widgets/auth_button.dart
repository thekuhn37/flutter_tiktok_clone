import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final FaIcon icon;
  final void Function(BuildContext) ontapfunction;
  //변수를 선언해줌

  const AuthButton({
    super.key,
    required this.text,
    required this.icon,
    required this.ontapfunction,
  });
  // super.key 커서 이동 후 code action 열어서 final field parameter initialize 버튼 클릭

  // void _onEmailTap(BuildContext context) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (context) => const LoginFormScreen(),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => _onEmailTap(context),
      child: FractionallySizedBox(
        // FractionallySizedBox : 절대값을 갖지 않되 father 크기에 상대적인 fraction 비율 갖는 박스
        widthFactor: 1,
        child: Container(
          padding: const EdgeInsets.all(
            Sizes.size14,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade300,
              width: Sizes.size1,
            ),
          ),
          child: Stack(
            // Row 대신 Stack을 사용.
            //  A stack allows you to put items on top of each other. 레이어 겹치기
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: icon,
                // icon 을 align으로 감싸주면 하나의 class에 대해서만 배열 효과를 줄 수 있다.
              ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
