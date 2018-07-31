import 'package:fatdej/app_config.dart';
import 'package:fatdej/src/fat_dej_app.dart';
import 'package:flutter/material.dart';

void main() {
  var configuredApp = new AppConfig(
      appName: "FatDej",
      flavorName: "prod",
      apiBaseUrl: "http://62.210.76.150/",
      child: new FatDejApp()
  );

  runApp(configuredApp);
}