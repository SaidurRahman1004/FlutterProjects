//Phase 1 → Project 1: Digital Business Card App
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class profile_app extends StatelessWidget {
  const profile_app({super.key});
  void CustomSnackBar(String msg, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        duration: Duration(seconds: 2),
      ),
    );

  }
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          title: const Text(
            'My Profile',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.lightBlueAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        body: Builder(
          builder: (BuildContext scaffoldContext) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blue.shade200, Colors.blue.shade50],
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        "https://i.postimg.cc/jjKRZgRq/profile-pic-1.png",
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Saidur Rahman",
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Flutter Developer||DevOps Engineer ",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        // ইংরেজী ফন্টের জন্য একটি আধুনিক ফন্ট
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                        // Medium weight
                        color: Colors.black.withOpacity(0.75),
                        height: 1.4,
                        letterSpacing: 0.3,
                      ),
                    ),
                    Divider(
                      thickness: 2,
                      indent: 50,
                      endIndent: 50,
                      color: Colors.indigo[300],
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      child: ListTile(
                        leading: Icon(
                          Icons.phone,
                          color: Colors.indigo[300],
                        ),
                        title: Text("+8801795664122"),
                        onTap: () => _launchURL('tel:+8801795664122'),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      child: ListTile(
                        leading: Icon(
                          Icons.email,
                          color: Colors.indigo[300],
                        ),
                        title: Text("saidurrahman1004@gmail.com"),
                        onTap: () => _launchURL('mailto:saidurrahman1004@gmail.com'),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(onPressed: (){ _launchURL("https://facebook.com/srs1313"); }, icon: FaIcon(FontAwesomeIcons.facebook, color: Colors.blue, size: 35)),
                          IconButton(onPressed: (){_launchURL("https://w.me/+8801795664122");}, icon: FaIcon(FontAwesomeIcons.whatsapp, color: Colors.blue, size: 35)),
                          IconButton(onPressed: (){_launchURL("https://t.me/@SiyamS1");}, icon: Icon(Icons.telegram,color: Colors.indigo[300],size: 40,)),
                          IconButton(onPressed: (){_launchURL("https://github.com/SaidurRahman1004");}, icon: FaIcon(FontAwesomeIcons.github, color: Colors.blue, size: 35)),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }


}
