import 'package:flutter/material.dart';
//import 'package:project_21/Pages/Specilaist_SignUp.dart';
import 'package:project_21/widgets/breatheFree_text.dart';
import 'package:project_21/widgets/button.dart';
import 'package:project_21/widgets/input_widget.dart';
import 'package:project_21/widgets/types.dart';

class SepcialistSignUpPage extends StatelessWidget {
  const SepcialistSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor:Color(0xffFEFEF2),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
                children: [
            const SizedBox(height: 65,),
            const Center(
              child:BreatheFreeText(),
            ),
            const SizedBox(
              height:30 ,
            ),
                Row(
                  children: [
                    TypeButtonWidget(text:'Specialist'),
                  ],
                ),
              
              InputFiled(hintText: 'Name'),
              const SizedBox(height: 11,),
              InputFiled(hintText: 'E_mail'),
              const SizedBox(height: 11,),
              InputFiled(hintText: 'Password'),
              const SizedBox(height: 11,),
              InputFiled(hintText: 'Link drive certification'),
              const SizedBox(height: 11,),
              InputFiled(hintText: 'Experince year'),
              const SizedBox(height: 11,),
              buttonWidget(text: 'Send request'),
              const SizedBox(height: 11,),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: const Center(
                    child: Text(
                      'SignUp as a User!',
                      style: TextStyle(
                        //decoration: TextDecoration.underline.,
                        color: Color(0xffE79DBF)
                      ),
                    ),
                  ),
              ),
            
          ],
          
          
        )
          ),
    );
  }
}