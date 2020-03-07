import 'dart:convert' show json;
import 'package:flutter/foundation.dart';

dynamic convertValueByType(value, Type type, {String stack: ""}) {
  if (value == null) {debugPrint("$stack : value is null");
    if (type == String) {
      return "";
    } else if (type == int) {
      return 0;
    } else if (type == double) {
      return 0.0;
    } else if (type == bool) {
      return false;
    }
    return null;
  }

  if (value.runtimeType == type) {
    return value;
  }
var valueS = value.toString();
debugPrint("$stack : ${value.runtimeType} is not $type type");
  if (type == String) {
    return valueS;
  } else if (type == int) {
    return int.tryParse(valueS);
  } else if (type == double) {
    return double.tryParse(valueS);
  } else if (type == bool) {
    valueS = valueS.toLowerCase();
    var intValue = int.tryParse(valueS);
    if (intValue != null) {
      return intValue == 1;
    }
    return valueS == "true";
  }
}

void tryCatch(Function f) {
  try {
    f?.call();
  } catch (e, stack) {
    debugPrint("$e"); 
  debugPrint("$stack");
    }
}

class ListParams {
  String fileName;
  String type;

  ListParams({
    this.fileName,
    this.type,
  });

  factory ListParams.fromJson(jsonRes)=>jsonRes == null? null:ListParams(    fileName : convertValueByType(jsonRes['FileName'],String,stack:"Root-FileName"),
    type : convertValueByType(jsonRes['type'],String,stack:"Root-type"),
);
  Map<String, dynamic> toJson() => {
        'FileName': fileName,
        'type': type
};

  @override
String  toString() {
    return json.encode(this);
  }
}

