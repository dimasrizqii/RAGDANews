import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:RAGDANews/ui/home/profile/profile_view_model.dart';
import 'package:RAGDANews/widgets/list_menu.dart';
import 'package:RAGDANews/widgets/logout_dialog.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => LogoutDialog(
        onLogout: () {
          Provider.of<ProfileViewModel>(context, listen: false).logout(context);
          Navigator.pushNamedAndRemoveUntil(context, '/login', (_) => false);
        },
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(211),
        child: SafeArea(
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            flexibleSpace: Image.asset(
              'assets/images/header_profile.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                const SizedBox(height: 8),
                sectionTitle("Account Settings"),
                ListMenu(
                  iconImage: 'assets/icons/email_user.png',
                  title: "Personal Information",
                  onTap: () {},
                ),
                ListMenu(
                  iconImage: 'assets/icons/password_user.png',
                  title: "Password & Security",
                  onTap: () {},
                ),
                ListMenu(
                  iconImage: 'assets/icons/dollar.png',
                  title: "Salary Slip Summary",
                  onTap: () {},
                ),
                ListMenu(
                  iconImage: 'assets/icons/calendar.png',
                  title: "Leave Summary",
                  onTap: () {},
                ),
                ListMenu(
                  iconImage: 'assets/icons/clock.png',
                  title: "Overtime Summary",
                  onTap: () {},
                ),
                ListMenu(
                  iconImage: 'assets/icons/file.png',
                  title: "Annual Tax Return PP21",
                  onTap: () {},
                ),
                sectionTitle("Other"),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text("Logout"),
                  onTap: () => _showLogoutDialog(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
