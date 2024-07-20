import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart'; // Import for FilteringTextInputFormatter

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _age = 44;

  final List<String> _imageAssets = [
    'assets/image1.jpg',
    'assets/image2.jpg',
    'assets/image3.jpg',
    'assets/image4.jpg',
    'assets/image5.jpg',
    'assets/image6.jpg',
    'assets/image7.jpg',
    'assets/image8.jpg',
    'assets/image9.jpg',
    'assets/image10.jpg',
    'assets/image11.jpg',
    'assets/image12.jpg',
    'assets/image13.jpg',
    'assets/image14.jpg',
    'assets/image15.jpg',
    'assets/image16.jpg',
    'assets/image17.jpg',
    'assets/image18.jpg',
    'assets/image19.jpg',
    'assets/image20.jpg',
    'assets/image21.jpg',
    'assets/image22.jpg',
    'assets/image23.jpg',
    'assets/image24.jpg',
    'assets/image25.jpg',
    'assets/image26.jpg',
    'assets/image27.jpg',
    'assets/image28.jpg',
    'assets/image29.jpg',
    'assets/image30.jpg',
    'assets/image31.jpg',
  ];

  void _showAgeDialog() {
    TextEditingController ageController = TextEditingController();
    ageController.text = _age.toString();
    bool _isEmpty = false;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Enter your age'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    maxLength: 2, // Limit input to 2 digits
                    inputFormatters: [
                      FilteringTextInputFormatter
                          .digitsOnly, 
                    ],
                    decoration: InputDecoration(
                      labelText: 'Age',
                      errorText: _isEmpty ? 'Please enter your age' : null,
                    ),
                    onChanged: (value) {
                      setState(() {
                        _isEmpty = value.isEmpty;
                        // Validate length and ensure it's numeric
                        if (value.isNotEmpty && value.length > 2) {
                          ageController.text = value.substring(0, 2);
                          ageController.selection = TextSelection.fromPosition(
                              TextPosition(offset: ageController.text.length));
                        }
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${ageController.text.length}/2',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  child: Text('Ok'),
                  onPressed: () {
                    if (ageController.text.isNotEmpty) {
                      setState(() {
                        _age = int.parse(ageController.text);
                      });
                      Navigator.of(context).pop(); // Close dialog
                    } else {
                      setState(() {
                        _isEmpty = true;
                      });
                    }
                  },
                ),
                TextButton(
                  child: Text('Save'),
                  onPressed: () {
                    if (ageController.text.isNotEmpty) {
                      setState(() {
                        _age = int.parse(ageController.text);
                      });
                      Navigator.of(context).pop(); // Close dialog
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Information Saved'),
                          backgroundColor:
                              Color.fromARGB(255, 28, 9, 156), // Snackbar color
                        ),
                      );
                    } else {
                      setState(() {
                        _isEmpty = true;
                      });
                    }
                  },
                ),
                TextButton(
                  child: Text('Back'),
                  onPressed: () {
                    Navigator.of(context).pop(); // Close dialog
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [
              const Color.fromARGB(255, 33, 54, 243),
              const Color.fromARGB(255, 15, 145, 132)
            ],
            tileMode: TileMode.mirror,
          ).createShader(bounds),
          child: Text(
            'Flutter',
            style: TextStyle(
                fontSize: 45, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            width: 50,
            height: 50,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(25)),
            child: InkWell(
              onTap: _showAgeDialog,
              child: Lottie.asset(
                'assets/button.json',
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Age and Overall Scores
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'HIS AGE',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '$_age ',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text("/100"),
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          'OVERALL',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildScoreCard(
                                    'Energy', '34', Icons.favorite, Colors.red),
                                _buildScoreCard('Smart', '24',
                                    FontAwesomeIcons.glasses, Colors.blue),
                                _buildScoreCard('Speed', '54', Icons.flash_on,
                                    Colors.yellow),
                              ],
                            ),
                            Expanded(
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 150, top: 60),
                                    child: Lottie.asset(
                                      'assets/circul1.json',
                                      height: MediaQuery.of(context).size.height * 0.5,
                                      width: MediaQuery.of(context).size.width * 0.5,
                                    ),
                                  ),
                                  Positioned(
                                    left: 170,
                                    bottom: 120, // Adjust as needed
                                    child: Image.asset(
                                      "assets/o'zim2.png",
                                      height: 250,
                                      width: 250,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Old Memory Section with Carousel Slider
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Old memory',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 10),
                        CarouselSlider(
                          options: CarouselOptions(
                            height: MediaQuery.of(context).size.height * 0.5,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            aspectRatio: 16 / 9,
                            scrollDirection: Axis.horizontal,
                          ),
                          items: _imageAssets.map((imagePath) {
                            return Builder(
                              builder: (BuildContext context) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => FullScreenImagePage(imagePath: imagePath),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                    ),
                                    child: Image.asset(
                                      imagePath,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScoreCard(
      String title, String score, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 30, color: color),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '$score ',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("/100",
                      style: TextStyle(fontSize: 16, color: Colors.grey))
                ],
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FullScreenImagePage extends StatelessWidget {
  final String imagePath;

  FullScreenImagePage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Full Screen Image'),
      ),
      body: Center(
        child: Image.asset(imagePath),
      ),
    );
  }
}
