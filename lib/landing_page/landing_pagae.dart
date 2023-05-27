import 'package:flutter/material.dart';
import 'package:portfolio_web/landing_page/about.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0;

  void _navigateToPage(int pageIndex) {
    setState(() {
      _currentPageIndex = pageIndex;
    });
    _pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: 1000,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            // Buttons Section
            SizedBox(height: 5),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 600,
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () => _navigateToPage(0),
                      child: const Text(
                        'Home',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                    TextButton(
                      onPressed: () => _navigateToPage(1),
                      child: const Text(
                        'About',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                    TextButton(
                      onPressed: () => _navigateToPage(2),
                      child: const Text(
                        'Projects',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Buttons Section Ends

            // Content Section
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPageIndex = index;
                  });
                },
                children: const [
                  // Home Section
                  Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 100,
                          backgroundImage: NetworkImage(
                              'https://avatars.githubusercontent.com/u/69915641?s=400&u=59123f27392584910e0796e19c4f6afea63a66c1&v=4'),
                        ),
                        Text(
                          'Ata Ul Munim',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 70,
                          ),
                        ),
                        Text(
                          'Flutter Developer',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 50,
                          ),
                        ),
                        Text(
                          'Site Under Development',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.yellowAccent,
                            fontSize: 80,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // About Section
                 About(),
                  Center(
                    child: Text(
                      'Projects ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 50,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Content Section Ends
          ],
        ),
      ),
    );
  }
}
