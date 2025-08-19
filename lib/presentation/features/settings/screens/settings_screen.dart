import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rohid_boilerplate/core/constants/app_values.dart';
import 'package:rohid_boilerplate/presentation/theme/appThemeMode/app_theme_mode.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings', style: Theme.of(context).textTheme.titleMedium),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(AppValues.p12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildUserInfoTile(),
            SizedBox(height: AppValues.p12),
            _buildSectionHeader('General'),
            _buildGeneralSection(),

          ],
        ),
      ),
    );
  }

  Widget _buildUserInfoTile() {
    return Card(
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.zero,
      elevation: AppValues.elevation_2,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.onSurface,
          width: AppValues.dimen_1,
        ),
        borderRadius: BorderRadius.circular(AppValues.dimen_8),
      ),
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        padding: EdgeInsets.all(AppValues.p12),
        child: Row(
          children: [
            CircleAvatar(),
            SizedBox(width: AppValues.dimen_10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Username'),
                SizedBox(height: AppValues.dimen_4),
                Text(
                  'Email',
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGeneralSection() {
    // Watch the theme provider to get the current theme state
    final themeMode = ref.watch(appThemeModeProvider).value ?? ThemeMode.system;
    final isDarkMode = themeMode == ThemeMode.dark;

    return Card(
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.zero,
      elevation: AppValues.elevation_2,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.onSurface,
          width: AppValues.dimen_1,
        ),
        borderRadius: BorderRadius.circular(AppValues.dimen_8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Call the dedicated theme switch tile
          _buildSectionItem('Hero'),
          SizedBox(
            height: AppValues.dimen_1,
            child: Container(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          _buildThemeSwitchTile(isDarkMode),


          // You can add more items here like _buildSectionItem(...)
        ],
      ),
    );
  }

  Widget _buildThemeSwitchTile(bool isDarkMode) {
    return ListTile(
      onTap: (){},
      title: Text(
        'Dark Mode',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: Switch(
        value: isDarkMode,
        onChanged: (value) {
          final newMode = value ? ThemeMode.dark : ThemeMode.light;
          ref.read(appThemeModeProvider.notifier).updateMode(newMode);
        },
      ),
    );
  }

  // Refactored to use ListTile
  Widget _buildSectionItem(String title) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      // Adding a trailing icon is a common UI pattern for tappable list items
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        debugPrint('Item tapped: $title');
      },
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(title, style: Theme.of(context).textTheme.titleMedium);
  }
  


}
