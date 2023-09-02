import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Midterm Exam 1/2566 CP SU',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.poppins().fontFamily,
        /*textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),*/
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

const colorGreen = Color(0xFF49B0AA);
const colorPink = Color(0xFFF98C8D);

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    const maxWidth = 600.0;
    const maxHeight = 800.0;

    var horizontalMargin = 20.0;
    if (screenWidth > maxWidth) {
      horizontalMargin = (screenWidth - maxWidth) / 2;
    }
    var verticalMargin = 20.0;
    if (screenHeight > maxHeight) {
      verticalMargin = (screenHeight - maxHeight) / 2;
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalMargin,
            vertical: verticalMargin,
          ),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg_colorful.jpg"),
              opacity: 0.6,
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Text('Good Morning', style: textTheme.headlineMedium),
              Text('Promlert',
                  style: textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.black87)),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(28.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 3.0, color: Colors.black),
                  borderRadius:
                      const BorderRadius.all(Radius.elliptical(40.0, 35.0)),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 5.0,
                      blurRadius: 8.0,
                      offset: Offset(2.0, 2.0),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Question 1 of 5',
                        textAlign: TextAlign.center,
                        style: textTheme.titleLarge),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20.0),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 20.0),
                      decoration: BoxDecoration(
                        color: colorGreen,
                        border: Border.all(width: 3.0, color: Colors.black87),
                        borderRadius: const BorderRadius.all(
                            Radius.elliptical(28.0, 26.0)),
                        /*boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 5.0,
                            blurRadius: 8.0,
                            offset: Offset(2.0, 2.0),
                          )
                        ],*/
                      ),
                      child: Text(
                        'He was too shy to ...... to strangers.',
                        textAlign: TextAlign.center,
                        style: textTheme.headlineSmall!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Choice(
                        choiceName: 'A', choiceText: 'talk', selected: true),
                    const Choice(choiceName: 'B', choiceText: 'talking'),
                    const Choice(choiceName: 'C', choiceText: 'talked'),
                    const Choice(choiceName: 'D', choiceText: 'be talked'),
                    const SizedBox(height: 8.0),
                  ],
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      backgroundColor: colorPink,
                      child: const Icon(
                        Icons.chevron_left,
                        size: 30.0,
                        color: Colors.black,
                      ),
                      onClick: () {},
                    ),
                  ),
                  Expanded(
                    child: AppButton(
                      backgroundColor: colorGreen,
                      child: const Icon(
                        Icons.chevron_right,
                        size: 30.0,
                        color: Colors.white,
                      ),
                      onClick: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.child,
    required this.backgroundColor,
    required this.onClick,
  });

  final Widget child;
  final Color backgroundColor;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(width: 3.0, color: Colors.black54),
        borderRadius: const BorderRadius.all(Radius.elliptical(32.0, 28.0)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 5.0,
            blurRadius: 8.0,
            offset: Offset(2.0, 2.0),
          )
        ],
      ),
      child: child,
    );
  }
}

class Choice extends StatelessWidget {
  const Choice({
    super.key,
    required this.choiceName,
    required this.choiceText,
    this.selected = false,
  });

  final String choiceName;
  final String choiceText;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFFECF7FF) : const Color(0xFFFBFBFB),
        border: Border.all(width: 2.0, color: Colors.black38),
        borderRadius: const BorderRadius.all(Radius.elliptical(16.0, 14.0)),
      ),
      child: Row(
        children: [
          Container(
            width: 32.0,
            height: 32.0,
            decoration: BoxDecoration(
              color: selected ? colorPink : Colors.white,
              border: Border.all(width: 2.0, color: Colors.black54),
              borderRadius:
                  const BorderRadius.all(Radius.elliptical(10.0, 8.0)),
            ),
            child: Center(
                child: Text(choiceName,
                    style: textTheme.titleLarge!
                        .copyWith(fontWeight: FontWeight.bold))),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Text(choiceText,
                style: textTheme.titleMedium!
                    .copyWith(fontWeight: FontWeight.bold)),
          ),
          if (selected)
            Container(
              width: 22.0,
              height: 22.0,
              decoration: BoxDecoration(
                color: const Color(0xFF65DC41),
                shape: BoxShape.circle,
                border: Border.all(width: 2.0, color: Colors.black54),
              ),
              child: const Center(child: Icon(Icons.check, size: 12.0)),
            )
        ],
      ),
    );
  }
}