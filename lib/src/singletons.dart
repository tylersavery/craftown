import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:sembast_web/sembast_web.dart';

class Singletons {
  static GetIt get instance => GetIt.instance;

  static Future initialize() async {
    await _initSembast();
  }

  static Future _initSembast() async {
    if (kIsWeb) {
      final database = await databaseFactoryWeb.openDatabase("sembast.db");
      instance.registerSingleton<Database>(database);
      return;
    }

    final appDir = await getApplicationDocumentsDirectory();
    await appDir.create(recursive: true);
    final databasePath = join(appDir.path, "sembast.db");
    final database = await databaseFactoryIo.openDatabase(databasePath);
    instance.registerSingleton<Database>(database);
  }
}
