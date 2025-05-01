import 'package:darlink/modules/setting/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
          isDarkMode ? theme.colorScheme.background : Colors.grey[50],
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primary,
        elevation: 0,
        title: Text(
          'Settings',
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20), // Added more margin below app bar
            _buildSettingItem(
              context: context,
              icon: CircleAvatar(
                radius: 20,
                backgroundColor: theme.colorScheme.primary.withOpacity(0.2),
                child: Icon(
                  Icons.person,
                  color: theme.colorScheme.primary,
                  size: 20,
                ),
              ),
              title: "Personal Profile",
            ),
            _buildSettingItem(
              context: context,
              icon: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.red.withOpacity(0.2),
                child: FaIcon(
                  FontAwesomeIcons.lock,
                  color: Colors.red,
                  size: 20,
                ),
              ),
              title: "Change Password",
            ),
            _buildSettingItem(
              context: context,
              icon: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blue.withOpacity(0.2),
                child: FaIcon(
                  FontAwesomeIcons.shieldHalved,
                  color: Colors.blue,
                  size: 20,
                ),
              ),
              title: "Theme",
            ),
            _buildSettingItem(
              context: context,
              icon: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.yellow.withOpacity(0.2),
                child: FaIcon(
                  FontAwesomeIcons.mobileAlt,
                  color: Colors.yellow[700],
                  size: 20,
                ),
              ),
              title: "Data Saver",
            ),
            _buildSettingItem(
              context: context,
              icon: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.purple.withOpacity(0.2),
                child: Icon(
                  Icons.notifications,
                  color: Colors.purple,
                  size: 20,
                ),
              ),
              title: "Notification",
            ),
            const SizedBox(height: 24), // Increased spacing before logout
            Card(
              color: isDarkMode
                  ? Colors.red
                      .withOpacity(0.2) // Dark red background in dark mode
                  : Colors.red[50], // Light red background in light mode
              margin: const EdgeInsets.symmetric(horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  // Handle logout
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.red.withOpacity(0.3),
                        child: FaIcon(
                          FontAwesomeIcons.rightFromBracket,
                          color: Colors.red,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        "Log Out",
                        style: theme.textTheme.titleLarge?.copyWith(
                          color: Colors.red, // Red text for logout
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20), // Added bottom margin
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required BuildContext context,
    required Widget icon,
    required String title,
  }) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Card(
      color: isDarkMode ? theme.cardTheme.color : Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          if (title == "Theme") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ThemeScreen(),
              ),
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              icon,
              const SizedBox(width: 16),
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: isDarkMode ? Colors.white : Colors.black87,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                color:
                    isDarkMode ? Colors.white.withOpacity(0.6) : Colors.black54,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
