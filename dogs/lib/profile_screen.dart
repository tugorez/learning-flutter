import 'package:flutter/material.dart';
import 'package:dogs/star_rating.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/beach.jpg'),
          Transform.translate(
            offset: const Offset(0, 150),
            child: const Column(
              children: [
                ProfileImage(),
                ProfileDetails(),
                ProfileActions(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(
        'dog.jpg',
        width: 200,
        height: 200,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          _title('Wolfram Barkovich'),
          const StarRating(value: 5),
          _buildDetailsRow('Age', '4'),
          _buildDetailsRow('Status', 'Good Boy'),
        ],
      ),
    );
  }

  Widget _title(String text) => Text(
        text,
        style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
      );

  Widget _buildDetailsRow(String heading, String value) => Row(
        children: [
          Text(
            '$heading: ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      );
}

class ProfileActions extends StatelessWidget {
  const ProfileActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildIcon(Icons.restaurant, 'Feed'),
        _buildIcon(Icons.favorite, 'Pet'),
        _buildIcon(Icons.directions_walk, 'Walk'),
      ],
    );
  }

  Widget _buildIcon(IconData icon, String text) => Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Icon(icon, size: 40),
            Text(text),
          ],
        ),
      );
}
