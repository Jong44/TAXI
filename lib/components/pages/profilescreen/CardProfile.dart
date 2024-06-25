import 'package:flutter/material.dart';
import 'package:taxi_app/models/ProfileModel.dart';
import 'package:taxi_app/pages/profiles/SettingProfileScreen.dart';

class CardProfile extends StatelessWidget {
  const CardProfile({
    super.key,
    required this.profile,
  });

  final ProfileModel profile;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SettingProfileScreen()));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[200],
              radius: 30,
              backgroundImage: NetworkImage(profile.image_url),
            ),
            SizedBox(
              width: 20,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                profile.fullName,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                profile.no_hp,
                style: TextStyle(fontSize: 12, color: Colors.grey[500]),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
