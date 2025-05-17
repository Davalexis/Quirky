import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:quirky/core/constants/theme.dart';

class SettingScreenModal extends StatelessWidget {
  const SettingScreenModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: double.infinity,
      decoration: BoxDecoration(
        color: quirkyTheme.scaffoldBackgroundColor,
        border: Border.all(color: Colors.white.withOpacity(0.2), width: 3),
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20),

            Text('Setting', style: quirkyTheme.textTheme.titleLarge),

            SizedBox(height: 50),

            Row(
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.white,
                  // backgroundImage: AssetImage('assets/images/profile.png'),
                ),

                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.black.withOpacity(0.6),
                    elevation: 0,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  ),
                  child: Center(
                    child: Text(
                      'Edit Profile',
                      style: quirkyTheme.textTheme.titleLarge,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  spacing: 15,
                  children: [
                    HugeIcon(
                      icon: HugeIcons.strokeRoundedGoogle,
                      color: Colors.black,
                    ),
                    Text(
                      'Sync with Google',
                      style: quirkyTheme.textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  spacing: 2,
                  children: [
                    HugeIcon(
                      icon: HugeIcons.strokeRoundedApple,
                      color: Colors.black,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Sync with Apple',
                      style: quirkyTheme.textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48),
                child: Row(
                  spacing: 10,
                  children: [
                    HugeIcon(
                      icon: HugeIcons.strokeRoundedMicrosoft,
                      color: Colors.black,
                    ),
                   
                    Text(
                      'Sync with Microsoft',
                      style: quirkyTheme.textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
            ),

            Spacer(),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              ),
              child: Center(
                child: Text('Log Out', style: quirkyTheme.textTheme.titleLarge),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
