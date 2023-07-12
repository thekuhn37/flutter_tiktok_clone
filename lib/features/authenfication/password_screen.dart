import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authenfication/birthday_screen.dart';
import 'package:tiktok_clone/features/authenfication/widgets/form_button.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});
// 변경하고 싶은 단어에 커서를 위치시켜 놓은 상태에서 cmd+D를 누르면 해당 단어가
//블록 형태로 선택되고 cmd+D를 계속해서 연타하면 작업창의 동일 단어들이 하나씩
//모두 선택된다.
  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  String _password = "";
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();

    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  bool _isPasswordValid() {
    return _password.isNotEmpty && _password.length > 8;
    // && : also
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
    // focus된 것을 unfocus로 바꿔주는 api 존재.
  }

  void _onSubmit() {
    if (!_isPasswordValid()) return;
    // _isPasswordValid가 valid하지 않다면(false라면) 아무것도 return 않는다.
    // 이 문장 아래에 나오는 내용은 위의 조건문 내용에 대하여 else인 경우.
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BirthdayScreen(),
      ),
    );
  }

  void _onClearTap() {
    _passwordController.clear();
  }
  // controller을 사용하면, 특정 메서드 위젯을 멀리서도 제어할 수 있다.

  void _toggleObscureText() {
    // 고수
    _obscureText = !_obscureText;
    setState(() {});
    // _obscureText는 _obscureText의 반대이다.

// 중수
    //   _obscureText = false;
    // } else {
    //   _obscureText = true;
    // }
    // setState(() {});

// 초보
    // if (_obscureText == true) {
    //   setState(
    //     () {
    //       _obscureText = false;
    //     },
    //   );
    // } else {
    //   setState(() {
    //     _obscureText = true;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Sign Up",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 36,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v40,
              const Text(
                "Password?",
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v16,
              TextField(
                // focus : text 입력을 위해 텍스트 필드 창에 커서가 위치한 상태
                controller: _passwordController,
                autocorrect: false,
                obscureText: _obscureText,
                onEditingComplete: _onSubmit,
                decoration: InputDecoration(
                  suffix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: _onClearTap,
                        child: FaIcon(
                          FontAwesomeIcons.solidCircleXmark,
                          color: Colors.grey.shade500,
                          size: Sizes.size20,
                        ),
                      ),
                      Gaps.h16,
                      GestureDetector(
                        onTap: _toggleObscureText,
                        child: FaIcon(
                          _obscureText
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash,
                          // ? -> _obscureText가 true면 ~
                          // : -> 그 외 다른 경우라면~
                          color: Colors.grey.shade500,
                          size: Sizes.size20,
                        ),
                      )
                    ],
                  ),
                  // prefixIcon: const Icon(Icons.account_box_rounded),
                  // suffixIcon: const Icon(Icons.ac_unit_sharp),
                  // 아이콘이 아닌 위젯을 넣고 싶으면 prefix or suffix 사용
                  hintText: "Make it Strong",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
                cursorColor: Theme.of(context).primaryColor,
              ),
              Gaps.v14,
              const Text(
                'Your passowrd must have:',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: Sizes.size16,
                ),
              ),
              Gaps.v14,
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.circleCheck,
                    color: _isPasswordValid()
                        ? Colors.green
                        : Colors.grey.shade400,
                    size: Sizes.size20,
                  ),
                  Gaps.h10,
                  const Text(
                    '8 to 20 characters',
                    style: TextStyle(fontSize: Sizes.size16),
                  )
                ],
              ),
              Gaps.v28,
              GestureDetector(
                onTap: _onSubmit,
                child: FormButton(
                  disabled: !_isPasswordValid(),
                ),
              ),
              //  || : or
            ],
          ),
        ),
      ),
    );
  }
}
