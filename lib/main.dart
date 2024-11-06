import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(const KranZApp());

class KranZApp extends StatelessWidget {
  const KranZApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoadingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Loading Screen
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double progress = 0;

  @override
  void initState() {
    super.initState();
    _startLoading();
  }

  void _startLoading() {
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        progress += 0.03;
      });
      if (progress < 1) {
        _startLoading();
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/kranz_logo.png',
              width: 80,
            ),
            Text(
              'Kran-Ž',
              style: GoogleFonts.dmSerifDisplay(
                color: Colors.blue,
                fontSize: 55,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LinearPercentIndicator(
                  width: 300,
                  lineHeight: 8.0,
                  percent: progress,
                  backgroundColor: Colors.grey[800],
                  progressColor: Colors.blue,
                  barRadius: const Radius.circular(8),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Home Page
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isConnected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kran-Z Home",
          style: GoogleFonts.poppins(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.account_circle,
              color: Colors.white,
              size: 45,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.white),
              child: Text(
                'Menu',
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.health_and_safety, color: Colors.black),
              title: Text('Helmet Health', style: GoogleFonts.poppins()),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.timeline, color: Colors.black),
              title: Text('Helmet Timeline', style: GoogleFonts.poppins()),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.location_on, color: Colors.black),
              title: Text('Location Tracking', style: GoogleFonts.poppins()),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.color_lens, color: Colors.black),
              title: Text('Change Turn Signal Colors', style: GoogleFonts.poppins()),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.info, color: Colors.black),
              title: Text('About Kran-Z', style: GoogleFonts.poppins()),
              onTap: () {},
            ),
            // Add more menu items as required
          ],
        ),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                'assets/helmet.svg',
                color: Colors.deepOrange,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Helmet",
              style: GoogleFonts.poppins(
                  color: Colors.blue,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "Battery: 75%",
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              "Status: ${isConnected ? "Connected" : "Disconnected"}",
              style: GoogleFonts.poppins(
                  color: isConnected ? Colors.green : Colors.red, fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isConnected = !isConnected;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isConnected ? Colors.red : Colors.blue,
              ),
              child: Text(isConnected ? "Disconnect" : "Connect",
                style: GoogleFonts.poppins(color: Colors.white,),
              ),),
          ],
        ),
      ),
    );
  }
}

// Profile Screen
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: GoogleFonts.poppins(fontSize: 24, color: Colors.white),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.account_circle,
              color: Colors.white,
              size: 60,
            ),
            const SizedBox(height: 20),
            Text('Name: John Doe',
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 18)),
            const SizedBox(height: 10),
            Text('Email: john@example.com',
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 18)),
            const SizedBox(height: 10),
            Text('Emergency Contact: +123456789',
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add edit profile functionality
              },
              child: const Text('Edit Profile'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Add logout functionality
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}