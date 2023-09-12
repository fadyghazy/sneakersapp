import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:sneakers_store/core/utils/user_preferences/user_preferences.dart';
import 'package:sneakers_store/screens/support/presentation/views/SupportScreen/components/custom_text.dart';
import 'package:sneakers_store/styles/colors.dart';
import 'package:sneakers_store/translate.dart';
import '../../../../../constants.dart';
class SupportScreen extends StatelessWidget {
  SupportScreen({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();
    Size size=MediaQuery.of(context).size;
    return ThemeSwitchingArea(
      child:Builder(builder: (context)=>
    Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(Translate.SupportText,
               style: TextStyle(
                   fontSize: 22,
                   fontWeight: FontWeight.w600,
                   ),
               ),

          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: primaryColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height:10),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    cursorColor: primaryColor,
                    decoration: InputDecoration(
                        prefixIconColor: primaryColor,
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                        hintText: Translate.NameHintText,
                        filled: true,
                        focusedBorder: customBorder(color: primaryColor),
                        border: customBorder(color: Colors.grey)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    cursorColor: primaryColor,
                    decoration: InputDecoration(
                        prefixIconColor: primaryColor,
                        prefixIcon: const Icon(
                          Icons.mail,
                          color: Colors.grey,
                        ),
                        hintText: Translate.EmailHintTextMessage,
                        filled: true,
                        focusedBorder: customBorder(color: primaryColor),
                        border: customBorder(color: Colors.grey)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    cursorColor: primaryColor,
                    minLines: 5,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                        hintText: Translate.StatusText,
                        filled: true,
                        focusedBorder: customBorder(color: primaryColor),
                        border: customBorder(color: Colors.grey)),
                  ),
                ),
                SizedBox(height:20),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(child: Text(Translate.SubmitText),onPressed: (){}),
                )
              ],
            ),
          )
      ),
    )
      )

    );
  }

  OutlineInputBorder customBorder({required Color color}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: color, width: 2));
  }
}
