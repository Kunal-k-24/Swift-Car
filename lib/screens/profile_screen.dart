import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swiftride/theme/theme_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://ui-avatars.com/api/?name=Darshan+Chavan&background=1E88E5&color=fff',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Darshan Chavan',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'darshanchavan@swift.com',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 32),
            _buildSection(
              context,
              'Account Settings',
              [
                _buildListTile(
                  context,
                  Icons.person_outline,
                  'Edit Profile',
                  onTap: () {},
                ),
                _buildListTile(
                  context,
                  Icons.notifications_none,
                  'Notifications',
                  onTap: () {},
                ),
                _buildListTile(
                  context,
                  Icons.payment,
                  'Payment Methods',
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildSection(
              context,
              'App Settings',
              [
                _buildListTile(
                  context,
                  Icons.dark_mode_outlined,
                  'Dark Mode',
                  trailing: Consumer<ThemeProvider>(
                    builder: (context, themeProvider, child) {
                      return Switch(
                        value: themeProvider.themeMode == ThemeMode.dark,
                        onChanged: (value) {
                          themeProvider.toggleTheme();
                        },
                        activeColor: Theme.of(context).colorScheme.primary,
                      );
                    },
                  ),
                ),
                _buildListTile(
                  context,
                  Icons.language,
                  'Language',
                  subtitle: 'English',
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildSection(
              context,
              'Support',
              [
                _buildListTile(
                  context,
                  Icons.help_outline,
                  'Help Center',
                  onTap: () {},
                ),
                _buildListTile(
                  context,
                  Icons.info_outline,
                  'About',
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildListTile(
              context,
              Icons.logout,
              'Logout',
              textColor: Colors.red,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Card(
          margin: EdgeInsets.zero,
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }

  Widget _buildListTile(
    BuildContext context,
    IconData icon,
    String title, {
    String? subtitle,
    Widget? trailing,
    Color? textColor,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: textColor ?? Theme.of(context).colorScheme.primary,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: trailing ?? const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
} 