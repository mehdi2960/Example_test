import 'dart:developer';

import 'package:example_test/src/featurs/post_list_screen/post_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController otpController = TextEditingController();

  final FocusNode otpFocusNode = FocusNode();

  String? code = '';

  bool _errorMessage = false;
  bool get errorMessage => _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        
          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: PinFieldAutoFill(
              codeLength: 4,
              controller: otpController,
              focusNode: otpFocusNode,
              autoFocus: true,
              onCodeChanged: (String? value) {
                code = value;
                setState(() {
                  _errorMessage = false;
                });
              },
              decoration: BoxLooseDecoration(
                radius: const Radius.circular(8),
                strokeColorBuilder: PinListenColorBuilder(
                  errorMessage == true ? Colors.red : Colors.white,
                  errorMessage == false ? Colors.white : Colors.red,
                ),
                bgColorBuilder: PinListenColorBuilder(
                  Colors.white, Colors.grey.shade200,
                
                ),
              ),
              currentCode: code,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          if (errorMessage)
            const Text('لطفا کد 4 رقمی را وارد نمایید',
                style: TextStyle(color: Colors.red))
          else
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 5),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade400,
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                elevation: 5,
              ),
              onPressed: () {
                if (code != null && code!.length == 4) {
                  log(code.toString());
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PostListScreen(),
                    ),
                  );
                } else {
                  setState(() {
                    _errorMessage = true;
                  });
                }
              },
              child: const Text(
                'ادامه',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
