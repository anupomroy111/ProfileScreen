import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int followers = 0;

  void followUser() {
    setState(() {
      followers++;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('You are now following John Doe'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void showProfileDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Profile Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=500',
                ),
              ),
              SizedBox(height: 10),
              Text(
                'John Doe',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 5),
              Text('Flutter Developer'),
              SizedBox(height: 10),
              Text('john.doe@example.com'),
              Text('+123 456 7890'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  Widget interestCard({
    required String image,
    required String title,
    required String subtitle,
  }) {
    return Expanded(
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  image,
                  height: 110,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                subtitle,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
              ),
              SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Color(0xFFF3F3F4),
                    foregroundColor: Colors.blue,
                    side: BorderSide(width: 0.1),
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(2),
                    ),
                  ),
                  onPressed: showProfileDialog,
                  child: Text('View More'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=500',
                        ),
                      ),

                      SizedBox(height: 15),

                      Text(
                        'John Doe',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),

                      SizedBox(height: 5),

                      Text(
                        'Flutter Developer',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),

                      SizedBox(height: 20),

                      Text(
                        'Passionate about creating user-friendly and engaging digital experiences.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),

                      SizedBox(height: 20),

                      Divider(),

                      SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.email),
                          SizedBox(width: 10),
                          Text(
                            'john.doe@example.com',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),

                      SizedBox(height: 12),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.phone),
                          SizedBox(width: 10),
                          Text('+123 456 7890', style: TextStyle(fontSize: 16)),
                        ],
                      ),

                      SizedBox(height: 15),

                      Text(
                        'Followers : $followers',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),

                      SizedBox(height: 20),

                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: followUser,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                minimumSize: Size(0, 50),
                                shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    3,
                                  ),
                                ),
                              ),
                              child: Text(
                                'Follow',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),

                          SizedBox(width: 10),

                          Expanded(
                            child: OutlinedButton(
                              onPressed: showProfileDialog,
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                minimumSize: Size(0, 50),
                                side: BorderSide(
                                  color: Colors.black54,
                                  width: 0.25,
                                ),
                                shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    3,
                                  ),
                                ),
                              ),
                              child: Text(
                                'Message',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 25),

              Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Interests',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(child: Divider()),
                ],
              ),

              SizedBox(height: 15),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  interestCard(
                    image:
                        'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800',
                    title: 'Travel',
                    subtitle: 'Exploring new places around the world',
                  ),
                  SizedBox(width: 10),
                  interestCard(
                    image:
                        'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?w=800',
                    title: 'Photography',
                    subtitle: 'Capturing moments through the lens',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
