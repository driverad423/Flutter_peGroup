import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/auth_controller.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    var emailController= TextEditingController();
    var passwordController= TextEditingController();
       
    List images = [
      "g.png",
      "t.png",
      "f.png"
    ];
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
            ),

            child: Column(
              children: [
                SizedBox(height: h*0.16,),
                CircleAvatar(
                  backgroundColor: Colors.lightBlue.shade100,
                  radius: 60,
                  backgroundImage: AssetImage("img/profile2.png"),
                )
              ],
            ),


        ),
          Container(

            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            width: w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

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
                /*Row(
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

                )
                ,
               */

              ],
            ),
          ),
          SizedBox(height: 70,),
          GestureDetector(
            onTap: (){
              AuthController.instance.register(emailController.text.trim(), passwordController.text.trim());
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
                      "Sign up",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
              ),
          
                  ),
          )
          ,
          SizedBox(height: 15,),
          RichText(
            text: TextSpan(
              recognizer: TapGestureRecognizer()..onTap=()=>Get.back(),
              text: "<< Have an account?",
              style: TextStyle(
                fontSize: 18,
                color: Colors.lightBlue.shade700,
                decoration: TextDecoration.underline,


              )
            ),
          ),
          SizedBox(height: w*0.2,),
          RichText(text: TextSpan(
            text: "Sign up using one os the following methods:",
            style: TextStyle(
              color: Colors.lightBlue.shade400,
              fontSize: 16, 

            ),

          )
          )   
          ,
          Wrap(
            children: List<Widget>.generate(
              3,
                (index){
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.cyan.shade400,
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(
                          "img/"+images[index]
                        ),
                      ),
                    ),
                  );
                }
            ),
          )
      ],
      ),

    );
  }
}