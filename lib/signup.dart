import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:flip_card/flip_card.dart';
import 'package:notes_app/auth.dart';
import 'note-page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  @override
  Auth ob = new Auth();
  String pass = "";
  String email = "";
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.teal, Colors.grey],
              )),
              child: SingleChildScrollView(
                  child: Column(children: [
                SizedBox(
                  height: 150,
                ),
                Lottie.network(
                    'https://assets7.lottiefiles.com/private_files/lf30_cldvedro.json',
                    width: 200,
                    height: 200),
                SizedBox(
                  height: 40,
                ),
                FlipCard(
                  front: Column(
                    children: [
                      GlassmorphicContainer(
                          width: 350,
                          height: 350,
                          borderRadius: 20,
                          blur: 20,
                          alignment: Alignment.bottomCenter,
                          border: 2,
                          linearGradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFFffffff).withOpacity(0.1),
                                Color(0xFFFFFFFF).withOpacity(0.05),
                              ],
                              stops: [
                                0.1,
                                1,
                              ]),
                          borderGradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFFffffff).withOpacity(0.5),
                              Color((0xFFFFFFFF)).withOpacity(0.5),
                            ],
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Sign up',
                                style: GoogleFonts.ubuntu(
                                  textStyle: TextStyle(
                                    color: Color.fromRGBO(0, 100, 100, 1),
                                    fontSize: 25,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              // Note: Same code is applied for the TextFormField as well
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  onChanged: (val) {
                                    setState(() {
                                      email = val;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(20),
                                    labelText: 'E-mail',
                                    labelStyle: TextStyle(color: Colors.white),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(100),
                                      //<-- SEE HERE
                                      borderSide: BorderSide(
                                        color: Colors.teal,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  obscureText: true,
                                  onChanged: (val) {
                                    setState(() {
                                      pass = val;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(20),
                                    labelText: 'Password',
                                    labelStyle: TextStyle(color: Colors.white),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(100),
                                      //<-- SEE HERE
                                      borderSide: BorderSide(
                                        color: Colors.teal,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 90,
                                child: ElevatedButton(
                                  child: Icon(
                                    Icons.login,
                                  ),
                                  onPressed: () async {
                                    bool res = await ob.register(email, pass);

                                    if (res == true) {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Note_page()),
                                      );
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: StadiumBorder(),

                                    backgroundColor: Color.fromRGBO(68, 68, 68,
                                        1), // background (button) color
                                    foregroundColor:
                                        Colors.white, // foreground (text) color
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Already a user ? ",
                                    style: TextStyle(
                                        color: Colors.brown, fontSize: 15),
                                  ),
                                  Text(
                                    "Sign in",
                                    style: TextStyle(
                                        color: Colors.brown,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w900),
                                  )
                                ],
                              ),
                            ],
                          )),
                    ],
                  ),
                  back: Column(
                    children: [
                      GlassmorphicContainer(
                          width: 350,
                          height: 350,
                          borderRadius: 20,
                          blur: 20,
                          alignment: Alignment.bottomCenter,
                          border: 2,
                          linearGradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFFffffff).withOpacity(0.1),
                                Color(0xFFFFFFFF).withOpacity(0.05),
                              ],
                              stops: [
                                0.1,
                                1,
                              ]),
                          borderGradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFFffffff).withOpacity(0.5),
                              Color((0xFFFFFFFF)).withOpacity(0.5),
                            ],
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Sign in',
                                style: GoogleFonts.ubuntu(
                                  textStyle: TextStyle(
                                    color: Color.fromRGBO(0, 100, 100, 1),
                                    fontSize: 25,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              // Note: Same code is applied for the TextFormField as well
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  obscureText: false,
                                  onChanged: (val) {
                                    setState(() {
                                      email = val;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(20),
                                    labelText: 'E-mail',
                                    labelStyle: TextStyle(color: Colors.white),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(100),
                                      //<-- SEE HERE
                                      borderSide: BorderSide(
                                        color: Colors.teal,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  obscureText: true,
                                  onChanged: (val) {
                                    setState(() {
                                      pass = val;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(20),
                                    labelText: 'Password',
                                    labelStyle: TextStyle(color: Colors.white),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(100),
                                      //<-- SEE HERE
                                      borderSide: BorderSide(
                                        color: Colors.teal,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 90,
                                child: ElevatedButton(
                                  child: Icon(
                                    Icons.login,
                                  ),
                                  onPressed: () async {
                                    bool res = await ob.login(email, pass);

                                    if (res == true)
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Note_page()),
                                      );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: StadiumBorder(),

                                    backgroundColor: Color.fromRGBO(68, 68, 68,
                                        1), // background (button) color
                                    foregroundColor:
                                        Colors.white, // foreground (text) color
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don't have an account ? ",
                                    style: TextStyle(
                                        color: Colors.brown, fontSize: 15),
                                  ),
                                  Text(
                                    "Sign up",
                                    style: TextStyle(
                                        color: Colors.brown,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w900),
                                  )
                                ],
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ])))),
    );
  }
}
