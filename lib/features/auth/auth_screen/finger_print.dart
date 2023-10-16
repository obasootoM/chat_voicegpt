import 'package:chat_voicegpt/constant/const_color.dart';
import 'package:chat_voicegpt/features/auth/auth_service/auth_service.dart';
import 'package:chat_voicegpt/features/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class FingerPrint extends StatelessWidget {
  const FingerPrint({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColor.backgroundColor,
      body: Center(
        child: TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.white),
              elevation: MaterialStatePropertyAll(2)
          ),
            onPressed: () async {
              final auth = await AuthService.authenticate();
              if (auth) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              }
            },
            child: Text(
              'Login with a touch',
              style: TextStyle(color: Theme.of(context).colorScheme.primary, 
              fontSize: 20,
              fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}
