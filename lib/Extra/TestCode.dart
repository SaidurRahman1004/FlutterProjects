import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

/// Main Class - Proper Naming Convention
class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  /// Custom SnackBar for showing messages
  void showCustomSnackBar(String msg, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.info, color: Colors.white),
            const SizedBox(width: 10),
            Text(msg),
          ],
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.indigo,
      ),
    );
  }

  /// Method to launch URLs
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
                    /// Profile Picture
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        "https://i.postimg.cc/jjKRZgRq/profile-pic-1.png",
                      ),
                    ),
                    const SizedBox(height: 20),

                    /// Name Text
                    Text(
                      "Saidur Rahman",
                      style: GoogleFonts.poppins(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),

                    /// Profession Text
                    Text(
                      "Flutter Developer | DevOps Engineer",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(0.75),
                        height: 1.4,
                        letterSpacing: 0.3,
                      ),
                    ),

                    /// Divider
                    Divider(
                      thickness: 2,
                      indent: 50,
                      endIndent: 50,
                      color: Colors.indigo[300],
                    ),

                    /// Contact Card - Phone
                    Card(
                      margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      child: ListTile(
                        leading: Icon(Icons.phone, color: Colors.indigo[300]),
                        title: const Text("+8801795664122"),
                        onTap: () => _launchURL('tel:+8801795664122'),
                      ),
                    ),

                    /// Contact Card - Email
                    Card(
                      margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      child: ListTile(
                        leading: Icon(Icons.email, color: Colors.indigo[300]),
                        title: const Text("saidurrahman1004@gmail.com"),
                        onTap: () => _launchURL('mailto:saidurrahman1004@gmail.com'),
                      ),
                    ),

                    /// Social Media Icons Row
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            onPressed: () => _launchURL("https://facebook.com"),
                            icon: const Icon(FontAwesomeIcons.facebook, size: 30),
                            color: Colors.blueAccent,
                          ),
                          IconButton(
                            onPressed: () => _launchURL("https://github.com"),
                            icon: const Icon(FontAwesomeIcons.github, size: 30),
                            color: Colors.black,
                          ),
                          IconButton(
                            onPressed: () => _launchURL("https://t.me"),
                            icon: const Icon(FontAwesomeIcons.telegram, size: 30),
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(const ProfileApp());
}
