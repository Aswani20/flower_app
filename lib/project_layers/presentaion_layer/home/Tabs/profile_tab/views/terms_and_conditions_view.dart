import 'dart:convert';
import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/core/theme/app_styles.dart';
import 'package:flower_app/project_layers/presentaion_layer/home/Tabs/profile_tab/model/terms_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class TermsAndConditionsView extends StatefulWidget {
  const TermsAndConditionsView({super.key});

  @override
  _TermsAndConditionsViewState createState() =>
      _TermsAndConditionsViewState();
}

class _TermsAndConditionsViewState
    extends State<TermsAndConditionsView> {
  TermsAndConditions? _termsData;
  final String _currentLang = 'en';

  @override
  void initState() {
    super.initState();
    _loadTermsData();
  }

  Future<void> _loadTermsData() async {
    final jsonString = await rootBundle.loadString(
      'assets/files/flowery_terms_and_conditions.json',
    );
    final Map<String, dynamic> jsonMap = json.decode(
      jsonString,
    );
    setState(() {
      _termsData = TermsAndConditions.fromJson(jsonMap);
    });
  }

  Widget _buildTextSection(
    String? text,
    CustomTextStyle? style,
  ) {
    if (text == null) {
      return const SizedBox.shrink();
    }
    return Text(
      text,
      textAlign: _getFlutterTextAlign(style?.textAlign),
      style: TextStyle(
        fontSize: style?.fontSize,
        fontWeight: style?.fontWeight,
        color: style?.color,
      ),
    );
  }

  Widget _buildListSection(
    List<dynamic>? content,
    CustomTextStyle? style,
  ) {
    if (content == null) {
      return const SizedBox.shrink();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: content.map<Widget>((item) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 4.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '• ',
                style: TextStyle(
                  fontSize: style?.fontSize,
                  color: style?.color,
                ),
              ),
              Expanded(
                child: Text(
                  item.toString(),
                  textAlign: _getFlutterTextAlign(
                    style?.textAlign,
                  ),
                  style: TextStyle(
                    fontSize: style?.fontSize,
                    fontWeight: style?.fontWeight,
                    color: style?.color,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  TextAlign _getFlutterTextAlign(
    TextAlignment? alignment,
  ) {
    switch (alignment) {
      case TextAlignment.left:
        return TextAlign.left;
      case TextAlignment.right:
        return TextAlign.right;
      case TextAlignment.center:
        return TextAlign.center;
      default:
        return TextAlign.left; // Default
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_termsData == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: Color(0xFFD21E6A),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.termsAndConditions,
          style: AppStyles.appBarTitleStyle,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _termsData!.sections.map<Widget>((
            section,
          ) {
            final String contentLang =
                section.content?[_currentLang]
                    ?.toString() ??
                '';
            final String titleLang =
                section.title?[_currentLang]
                    ?.toString() ??
                '';

            Widget currentWidget;
            if (section.section == 'title' ||
                section.section == 'last_updated' ||
                section.section == 'introduction' ||
                section.section == 'acknowledgment') {
              final style = CustomTextStyle.fromJson(
                section.style!,
                _currentLang,
              );
              currentWidget = _buildTextSection(
                contentLang,
                style,
              );
            } else {
              final titleStyle = CustomTextStyle.fromJson(
                section.style!['title'],
                _currentLang,
              );
              final contentStyle =
                  CustomTextStyle.fromJson(
                    section.style!['content'],
                    _currentLang,
                  );

              final content =
                  section.content?[_currentLang];

              if (content is List) {
                currentWidget = Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    _buildTextSection(
                      titleLang,
                      titleStyle,
                    ),
                    const SizedBox(height: 8),
                    _buildListSection(
                      content,
                      contentStyle,
                    ),
                  ],
                );
              } else {
                currentWidget = Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    _buildTextSection(
                      titleLang,
                      titleStyle,
                    ),
                    const SizedBox(height: 8),
                    _buildTextSection(
                      content.toString(),
                      contentStyle,
                    ),
                  ],
                );
              }
            }

            return Padding(
              padding: const EdgeInsets.only(
                bottom: 20.0,
              ),
              child: currentWidget,
            );
          }).toList(),
        ),
      ),
    );
  }
}
