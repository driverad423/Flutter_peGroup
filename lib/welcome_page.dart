import 'package:flutter/material.dart';
import 'package:login/auth_controller.dart';


class WelcomePage extends StatelessWidget {
  String email;

  WelcomePage({Key? key, required this.email}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    
        double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(

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
                  backgroundImage: AssetImage("img/profile.png"),
                )
              ],
            ),


        ),
          SizedBox(height: 70,),

          Container(
            width: w,
            margin: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
              "Welcome !",
              style: TextStyle(
                fontSize: 35,
                color: Colors.lightBlue.shade800,

              ),    
            ),
              Text(
                email, 
                style: TextStyle(
                fontSize: 17,
                color: Colors.lightBlue.shade700,

              ),    
            ),
            
              ],
            ),
          ),
          SizedBox(height: 70,),

          GestureDetector(
            onTap: (){
              AuthController.instance.logOut();
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
                      "Sign out",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
              ),
          
                  ),
          )
          ,
          
         
      ],
      ),

    );
  }
}