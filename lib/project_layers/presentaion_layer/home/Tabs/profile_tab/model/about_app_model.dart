import 'package:flutter/material.dart';

class AboutSectionStyle {
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? color;
  final Map<String, String>? textAlign;
  final String? backgroundColor;

  AboutSectionStyle({
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign,
    this.backgroundColor,
  });

  factory AboutSectionStyle.fromJson(
    Map<String, dynamic> json,
  ) {
    return AboutSectionStyle(
      fontSize: (json['fontSize'] as num?)?.toDouble(),
      fontWeight: json['fontWeight'] != null
          ? _getFontWeight(json['fontWeight'])
          : null,
      color: json['color'] as String?,
      textAlign:
          (json['textAlign'] as Map<String, dynamic>?)
              ?.cast<String, String>(),
      backgroundColor: json['backgroundColor'] as String?,
    );
  }

  static FontWeight? _getFontWeight(String value) {
    switch (value) {
      case 'bold':
        return FontWeight.bold;
      case 'normal':
        return FontWeight.normal;
      default:
        return FontWeight.normal;
    }
  }

  Color get colorValue => color != null
      ? Color(
          int.parse(color!.substring(1, 7), radix: 16) +
              0xFF000000,
        )
      : Colors.black;
  Color get backgroundColorValue =>
      backgroundColor != null
      ? Color(
          int.parse(
                backgroundColor!.substring(1, 7),
                radix: 16,
              ) +
              0xFF000000,
        )
      : Colors.white;
  TextAlign get textAlignValue =>
      textAlign?['ar'] == 'right'
      ? TextAlign.right
      : TextAlign.left;
}

class AboutSection {
  final String section;
  final Map<String, dynamic> content;
  final Map<String, dynamic>? title;
  final AboutSectionStyle? style;

  AboutSection({
    required this.section,
    required this.content,
    this.title,
    this.style,
  });

  factory AboutSection.fromJson(
    Map<String, dynamic> json,
  ) {
    return AboutSection(
      section: json['section'] as String,
      content: json['content'] as Map<String, dynamic>,
      title: json['title'] as Map<String, dynamic>?,
      style: json['style'] != null
          ? AboutSectionStyle.fromJson(json['style'])
          : null,
    );
  }
}

class AboutPageData {
  final List<AboutSection> sections;

  AboutPageData({required this.sections});

  factory AboutPageData.fromJson(
    Map<String, dynamic> json,
  ) {
    final List<dynamic> sectionsJson =
        json['about_app'] as List<dynamic>;
    final List<AboutSection> sections = sectionsJson
        .map(
          (sectionJson) => AboutSection.fromJson(
            sectionJson as Map<String, dynamic>,
          ),
        )
        .toList();

    return AboutPageData(sections: sections);
  }
}
