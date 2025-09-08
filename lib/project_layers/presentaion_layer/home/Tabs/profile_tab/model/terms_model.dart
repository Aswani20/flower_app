import 'package:flutter/material.dart';

Color colorFromHex(String hexColor) {
  hexColor = hexColor.replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF$hexColor";
  }
  return Color(int.parse(hexColor, radix: 16));
}

enum TextAlignment { left, right, center }

TextAlignment textAlignmentFromJson(
  Map<String, dynamic> json,
  String lang,
) {
  String? align = json[lang];
  switch (align) {
    case 'left':
      return TextAlignment.left;
    case 'right':
      return TextAlignment.right;
    case 'center':
      return TextAlignment.center;
    default:
      return TextAlignment.left;
  }
}

class CustomTextStyle {
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlignment? textAlign;

  CustomTextStyle({
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign,
  });

  factory CustomTextStyle.fromJson(
    Map<String, dynamic> json,
    String lang,
  ) {
    return CustomTextStyle(
      fontSize: (json['fontSize'] as num?)?.toDouble(),
      fontWeight: json['fontWeight'] == 'bold'
          ? FontWeight.bold
          : FontWeight.normal,
      color: json['color'] != null
          ? colorFromHex(json['color'] as String)
          : null,
      textAlign: json['textAlign'] != null
          ? textAlignmentFromJson(json['textAlign'], lang)
          : null,
    );
  }
}

class TermsSection {
  final String section;
  final Map<String, dynamic>? content;
  final Map<String, dynamic>? title;
  final Map<String, dynamic>? style;

  TermsSection({
    required this.section,
    this.content,
    this.title,
    this.style,
  });

  factory TermsSection.fromJson(
    Map<String, dynamic> json,
  ) {
    return TermsSection(
      section: json['section'] as String,
      content: json['content'] as Map<String, dynamic>?,
      title: json['title'] as Map<String, dynamic>?,
      style: json['style'] as Map<String, dynamic>?,
    );
  }
}

class TermsAndConditions {
  final List<TermsSection> sections;

  TermsAndConditions({required this.sections});

  factory TermsAndConditions.fromJson(
    Map<String, dynamic> json,
  ) {
    final List<dynamic>? sectionsJson =
        json['terms_and_conditions'];
    if (sectionsJson == null) {
      return TermsAndConditions(sections: []);
    }
    return TermsAndConditions(
      sections: sectionsJson
          .map((s) => TermsSection.fromJson(s))
          .toList(),
    );
  }
}
