import 'package:codeland_task/image_screen/image_upload_screen.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,

      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(child: Column(
              children: <Widget>[
                Column(

                  children: <Widget>[
                    Image.asset(
                      'assets/codeland.png',
                      width: 200,
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                   const Text("Biomedical Kiosk",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                    Text("                                         for HCF's",
                      style: TextStyle(
                          fontSize: 14,
                          color:Colors.deepOrange[700]),)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: <Widget>[
                      inputFile(label: "Username",controller: _usernameController),
                      inputFile(label: "Password", obscureText: true,controller: _passwordController),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: TextButton(

                          onPressed: () {
                            String username = _usernameController.text.trim();
                            String password = _passwordController.text.trim();

                            if (username.isNotEmpty && password.isNotEmpty) {
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => ImageUploadScreen()));
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text("Error"),
                                    content: const Text("Please enter both username and password."),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text("OK"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrange[500]!),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Text("For Assistance & Login Details Contact:"),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "English, Kannada & Telugu: ",
                            style: TextStyle(color: Colors.black), // Change color as needed
                          ),
                          TextSpan(
                            text: "7406333800",
                            style: TextStyle(color: Colors.red), // Change color as needed
                          ),
                        ],
                      ),
                    ),

                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "English, Kannada & Telugu: ",
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: "9071386515",
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                     const SizedBox(height: 100,),
                    const Text('v17 ©2023, CodeLand Infosolutions Pvt Ltd.')
                  ],
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}


Widget inputFile({label, obscureText = false,controller})
{
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color:Colors.black87
        ),

      ),
      const SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obscureText,
        controller: controller,
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0,
                horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey
              ),
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)
            )
        ),
      ),
      const SizedBox(height: 10,)
    ],
  );
}