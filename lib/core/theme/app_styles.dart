import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract class AppStyles{
    static TextStyle bold20black = GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.black);
    static TextStyle medium16black = GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.black);
    static TextStyle regular13grey = GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w400, color: AppColors.grey);
    static TextStyle regular14black = GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.black);
}