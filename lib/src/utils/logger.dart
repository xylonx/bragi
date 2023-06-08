import 'dart:io';

import 'package:bragi/src/utils/platform.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

final _loggerFactory = BragiLogger();

BragiLogger getLogger<T>(T module) {
  _loggerFactory.module = module is String ? module : module.toString();
  return _loggerFactory;
}

class BragiLogger extends Logger {
  String? module;
  BragiLogger([this.module]) : super(filter: _BragiLogger());

  @override
  void log(Level level, message, [error, StackTrace? stackTrace]) async {
    if (!kIsWeb) {
      if (level == Level.error) {
        // create dir
        String dir = (await getApplicationDocumentsDirectory()).path;

        if (kIsAndroid) {
          dir = (await getExternalStorageDirectory())?.path ?? "";
        }

        if (kIsMacOS) {
          dir = path.join((await getLibraryDirectory()).path, "Logs");
        }

        await File(path.join(dir, "bragi_logs.log")).writeAsString(
            "[${DateTime.now()}]\n$message\n$stackTrace",
            mode: FileMode.writeOnlyAppend);
      }
    }
    super.log(level, "[$module] $message", error, stackTrace);
  }
}

class _BragiLogger extends DevelopmentFilter {
  @override
  bool shouldLog(LogEvent event) {
    final env = kIsWeb ? {} : Platform.environment;
    if ((env["DEBUG"] == "true" && event.level == Level.debug) ||
        (env["VERBOSE"] == "true" && event.level == Level.verbose) ||
        (env["ERROR"] == "true" && event.level == Level.error)) {
      return true;
    }
    return super.shouldLog(event);
  }
}
