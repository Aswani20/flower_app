import 'dart:convert';
import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/about_app_model.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  AboutPageData? _aboutData;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadAboutData();
  }

  Future<void> _loadAboutData() async {
    try {
      final String jsonString = await rootBundle
          .loadString(
            'assets/files/flowery_about_us.json',
          );
      final Map<String, dynamic> jsonData = json.decode(
        jsonString,
      );
      setState(() {
        _aboutData = AboutPageData.fromJson(jsonData);
        _isLoading = false;
      });
    } catch (e) {
      print('Error loading about data: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_aboutData == null) {
      return Scaffold(
        body: Center(child: Text('Failed to load data')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.aboutUs)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _aboutData!.sections.map((section) {
            return _buildSection(context, section);
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context,
    AboutSection section,
  ) {
    final isListContent = section.content['ar'] is List;
    final currentLang = Localizations.localeOf(
      context,
    ).languageCode;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (section.title != null)
            Text(
              section.title![currentLang] ?? 'ar',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: AppColors.pink,
              ),
            ),
          const SizedBox(height: 8.0),
          if (isListContent)
            ...(section.content[currentLang] ??
                    'ar' as List)
                .map((item) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      bottom: 4.0,
                    ),
                    child: Text(item),
                  );
                })
                .toList()
          else
            Text(section.content[currentLang] ?? 'ar'),
        ],
      ),
    );
  }
}
