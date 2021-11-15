import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/auth_controller.dart';
import 'package:login/signup_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController= TextEditingController();
    var passwordController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.lightBlue.shade50,
      body: Column(
        children: [
          Container(
            width: w,
            height: h*0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "img/bg_login2.jpg"
                ),
                fit: BoxFit.cover
              )
            )

        ),
          Container(

            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            width: w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                Text(
                  "Welcome,\nThis is your travel app !",
                  style: TextStyle(
                    color: Colors.lightBlue.shade600,
                    fontSize: 40,
                    fontWeight: FontWeight.normal
                  ),
                ),
                SizedBox(height: 10,),

                Text(
                  "Sign into your account",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.lightBlue.shade400
                  ),
                ),
                SizedBox(height: 50,),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      
                      BoxShadow(

                        blurRadius: 10,
                        spreadRadius: 7,
                        offset: Offset(1, 1),
                        color: Colors.lightBlue.withOpacity(0.2)
                      )
                    ]
                  ),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                       hintText: "Your email",
                      prefixIcon: Icon(Icons.email, color: Colors.blue),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2.0
                        )
                      ),
                
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),

                        borderSide: BorderSide(
                          color: Colors.lightBlue.shade600,
                          width: 1.0
                        )
                      ),
                
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                      )
                    )
                  ),
                ),
                SizedBox(height: 20,), 
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      
                      BoxShadow(

                        blurRadius: 10,
                        spreadRadius: 7,
                        offset: Offset(1, 1),
                        color: Colors.lightBlue.withOpacity(0.2)
                      )
                    ]
                  ),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                       hintText: "Your password",
                      prefixIcon: Icon(Icons.password_outlined, color: Colors.blue),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2.0
                        )
                      ),
                
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),

                        borderSide: BorderSide(
                          color: Colors.lightBlue.shade600,
                          width: 1.0
                        )
                      ),
                
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                      )
                    )
                  ),
                ),
                SizedBox(height: 20,), 
                Row(
                  children: [
                    Expanded(child: Container(),),
                     Text(
                  "Forgot your password?",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.lightBlue.shade400
                  ),
                ),
                  ],

                ),
               

              ],
            ),
          ),
          SizedBox(height: 40,),
          GestureDetector(
            onTap:(){
              AuthController.instance.login(emailController.text.trim(), passwordController.text.trim());
            },
            child: Container(
              width: w*0.5,
              height: h*0.08,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: AssetImage(
                    "img/loginbtn1.png"
                  ),
                  fit: BoxFit.cover
                )
              ),
              child: Center(
                child: Text(
                      "Sign in",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
              ),
          
                  ),
          )
          ,
          SizedBox(height: w*0.2,),
          RichText(text: TextSpan(
            text: "Don\´t have an account?  ",
            style: TextStyle(
              color: Colors.lightBlue.shade400,
              fontSize: 16, 

            ),

            children: [
              TextSpan(
              text: "Create",
              style: TextStyle(
              color: Colors.lightBlue.shade600,
              fontSize: 20, 
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,


            ),
            recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>SignUpPage())
            )
            ]

          )
          )   
      ],
      ),
    );
  }
}