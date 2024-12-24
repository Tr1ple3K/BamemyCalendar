import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:gestures/gestures.dart';

const brown_color = const Color(0xFF664731);
const background_color = const Color(0xFFF4F4F4);
const textField_color = const Color(0xFFFCFCFD);
const hintTextField_color = const Color(0x801A203D);

bool _isObscured = true;

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paperless',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();

    /// whenever your initialization is completed, remove the splash screen:
    Future.delayed(Duration(seconds: 5)).then((value) => {
      FlutterNativeSplash.remove()
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background_color,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                    ClipRRect(
                      child: Container(
                        width: double.infinity, 
                        height: 50, 
                        color: brown_color,   
                       ),
                    ),
      
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        alignment: Alignment.topLeft, 
                        width: double.infinity, 
                        height: 285, 
                        color: brown_color, 
                        
                        child: Center(
                          child: Image.asset('assets/paperless_icon.png',
                            height: 206,
                            width: 191,
                            alignment: Alignment.center
                          ),
                       )
                       ),
                    ),
      
                    Container(
                      width: double.infinity,
                      height: 285,
                      
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/Illustration.png'),alignment: Alignment.bottomCenter,
                         
                        ),
                      ),
                    ),
                
              
                
              ],
            ),
      
            
            Column(
              
      
              children: [
                SizedBox(height: 30),
      
                Container(
                  child: Text('Login',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),alignment: Alignment.center,
                ),
      
                SizedBox(height: 29),
      
                Padding(
                   padding: EdgeInsets.fromLTRB(35,0,35,0),
                  child: Container(
                    child: Text('Username',style: TextStyle(fontSize: 16)),alignment: Alignment.centerLeft,
                  ),
                ), 
                
                SizedBox(height: 22),
      
                //Username input 
                Padding(
                    padding: EdgeInsets.fromLTRB(35,0,35,0),
                    child: SizedBox(
                      height: 40,
                      child: TextField(
                        autocorrect: false,
                        enableSuggestions: false,
                        style: TextStyle(fontSize: 16, decoration: TextDecoration.none), // <-- Set the font size here
                        decoration: InputDecoration(
                          
                          filled: true, //<-- SEE HERE
                          fillColor: textField_color, //<-- S
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                          hintText: 'Enter your username',
                          hintStyle: TextStyle(color: hintTextField_color),
                          contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        ),
                      ),
                    ),
                ),
      
                SizedBox(height: 22),
      
                Padding(
                  padding: EdgeInsets.fromLTRB(35,0,35,0),
                  child: Container(
                    child: Text('Password',style: TextStyle(fontSize: 16)),alignment: Alignment.centerLeft,
                  ),
                ), 
      
                SizedBox(height: 22),
      
                //Password input 
               

                Padding(
                  padding: EdgeInsets.fromLTRB(35,0,35,0),
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      autocorrect: false,
                      enableSuggestions: false,
                      obscureText: _isObscured,
                      style: TextStyle(fontSize: 16, decoration: TextDecoration.none),
                      decoration: InputDecoration(
                        filled: true, //<-- SEE HERE
                        fillColor: textField_color, //<-- SEE HERE
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        
                        hintText: 'Enter your password',
                        
                        hintStyle: TextStyle(color: hintTextField_color),
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isObscured = !_isObscured;
                            });
                          },
                          child: Icon(
                            _isObscured ? Icons.visibility_off : Icons.visibility,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

      
                SizedBox(height: 10),
      
                Padding(
                  padding: EdgeInsets.fromLTRB(35,0,35,0),
                  child: Container(
                    child: RichText(
                            text: TextSpan(children: [
                                TextSpan(
                                    text: 'Forgot your password?',
                                    style: TextStyle(decoration: TextDecoration.underline,color: Colors.blue,),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () { //ใส่ได้เลยว่ากด forgot your password แล้วไปไหนต่อ
                                        print('Forgot your password has been Clicked');
                                      }
                                    ),
                                    
                              ]),
                            ),
                            alignment: Alignment.centerRight, 
      
                  ),
                ), 



                //  child: Text('Forgot your password?',
                //       style: TextStyle(decoration: TextDecoration.underline,color: Colors.blue,),),
                //       alignment: Alignment.centerRight, 
      
                SizedBox(height: 29),

                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: SizedBox(
                    width: 200, // <-- Your width
                    height: 50, // <-- Your height
                    child: ElevatedButton(
                      child: Text("Login"),
                      style: ElevatedButton.styleFrom(
                        primary: brown_color,
                        elevation: 0,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
        
            ],),
          ],
      
          
      
        ),
      ),
    );
  }
}
