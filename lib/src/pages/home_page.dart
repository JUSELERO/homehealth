// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homehealth/src/pages/login_page.dart';
import 'package:homehealth/src/pages/register_page.dart';
import 'package:homehealth/src/utils/constants.dart';
import 'package:homehealth/src/utils/fondo.dart';
import 'package:homehealth/src/widgets/background.dart';

//import 'login_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Bienvenido a HomeHelp",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0
                )
              ),
              SizedBox(height: size.height * 0.05),
              SvgPicture.asset(
                "assets/icons/chat.svg",
                height: size.height * 0.45,
              ),
              SizedBox(height: size.height * 0.05),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: size.width * 0.8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => LoginPage()
                      )
                    ),
                    child: Text("Login"),
                    style: ElevatedButton.styleFrom(
                      primary: primaryColor,
                      padding: EdgeInsets.symmetric(horizontal: 40,vertical: 20),
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500
                      )
                    ),
                  ),
                ),
              ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: size.width * 0.8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => RegisterPage()
                      )
                    ),
                    child: Text("Registro"),
                    style: ElevatedButton.styleFrom(
                      primary: primaryLigthColor,
                      padding: EdgeInsets.symmetric(horizontal: 40,vertical: 20),
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500
                      )
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      // body: Stack(
      //   children: <Widget>[
      //     crearFondo(context),
      //     Center(
      //       child: Padding(
      //         padding: const EdgeInsets.all(50.0),
      //         child: Column(
      //           children: [
      //             Image(
      //               image: AssetImage('assets/images/help.png'),
      //             ),
      //             Text.rich(
      //               TextSpan(
      //                   text: 'Bienvenido,',
      //                   style: TextStyle(
      //                       fontWeight: FontWeight.bold, color: Colors.white),
      //                   children: [
      //                     TextSpan(
      //                       text: 'usuario',
      //                       style: TextStyle(fontWeight: FontWeight.normal),
      //                     ),
      //                   ]),
      //               style: TextStyle(fontSize: 55),
      //             ),
      //             ElevatedButton(
      //                 onPressed: () {
      //                   Navigator.pushNamed(context, 'login');
      //                 },
      //                 child: Text('Iniciar sesión'),
      //                 style: ElevatedButton.styleFrom(
      //                   shape: RoundedRectangleBorder(
      //                       borderRadius: BorderRadius.circular(20)),
      //                   primary: Color(0xFF55aaff),
      //                 )),
      //             Text.rich(TextSpan(
      //               text: "¿Aún no tienes una cuenta?",
      //               children: [
      //                 TextSpan(
      //                     text: "Regístrate",
      //                     style: TextStyle(color: Colors.blue[300]),
      //                     recognizer: new TapGestureRecognizer()
      //                       ..onTap = () {
      //                         Navigator.pushNamed(context, 'registro');
      //                       })
      //               ],
      //             ))
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }

}
