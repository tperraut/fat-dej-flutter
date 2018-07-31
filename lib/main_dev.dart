import 'package:fatdej/app_config.dart';
import 'package:flutter/material.dart';
import 'package:fatdej/src/fat_dej_app.dart';

void main() {
  var configuredApp = new AppConfig(
      appName: "FatDej_dev",
      flavorName: "dev",
      apiBaseUrl: "http://62.210.76.150/api/",
      child: new FatDejApp()
  );

  runApp(configuredApp);
}