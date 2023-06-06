import 'dart:async';
import 'dart:developer';

import 'package:newwatt/export.dart';
import 'package:http/http.dart' as http;

import 'global.dart' as global;

class restCallController extends GetxController {
  var res = ''.obs;

  Future restCall(body, url) async {
    var headers = {'company': '006', 'Content-Type': 'application/json', 'Authorization': 'Basic b25saW5lOm9ubGluZTEyMw=='};

    var request = http.Request('POST', Uri.parse("https://www.devapi.anoudapps.com/qicservices/aggregator/${url}"));

    request.body = body;

    request.headers.addAll(headers);

    print("res two $request");
    // print("res two $body");
    log(json.encode(body));

    http.StreamedResponse response = await request.send().timeout(Duration(seconds: 240)).catchError((onError) {
      print("timeout error");
      global.snakbar(
        type: "ERROR",
        msg: "Request Timeout",
      );

      return null;
    });

    var k = await (response.stream.bytesToString());
    // print("this is res $k");

    if (k.contains("Downstream system not responding")) {
      snakbar(type: "ERROR", msg: "Api not working");
      return null;
    } else if (k.contains("404--Not Found")) {
      snakbar(type: "ERROR", msg: "404");
      return null;
    } else if (json.decode(k)['errMessage'] != "true" && json.decode(k)['errMessage'] != "Success" && json.decode(k)['errMessage'] != null) {
      if (json.decode(k)['errMessage'] != "No records found") {
        snakbar(type: "ERROR", msg: json.decode(k)['errMessage']);
      }

      return null;
    }
    return k;
  }

  Future getCall(url) async {
    var headers = {
      'company': '001',
      'userId': 'online',
      'agentId': '910836',
      'Authorization': 'Basic dGVzdC1lYmU5MmJjOS0yMGVmLTRkOWEtOWE1OC0wN2Q3Y2ZmZGZjMWE6dGVzdC0wYWI2Zjk0NC0zNmE4LTQ0ZTktYmM5Yi00ODRhMDZiOTQxOWQ=',
    };
    var request = http.Request('GET', Uri.parse('https://www.devapi.anoudapps.com/micapi/medical/individual/master-details'));

    request.headers.addAll(headers);

    print("res two $request");

    http.StreamedResponse response = await request.send().timeout(Duration(seconds: 240)).catchError((onError) {
      print("timeout error");
      global.snakbar(
        type: "ERROR",
        msg: "Request Timeout",
      );

      return null;
    });

    var k = await (response.stream.bytesToString());
    // print("this is res $k");

    if (k.contains("Downstream system not responding")) {
      snakbar(type: "ERROR", msg: "Api not working");
      return null;
    } else if (k.contains("404--Not Found")) {
      snakbar(type: "ERROR", msg: "404");
      return null;
    } else if (json.decode(k)['errMessage'] != "true" && json.decode(k)['errMessage'] != "Success" && json.decode(k)['errMessage'] != null) {
      if (json.decode(k)['errMessage'] != "No records found") {
        snakbar(type: "ERROR", msg: json.decode(k)['errMessage']);
      }

      return null;
    }
    return k;
  }

  Future getCall_full_url({required full_url, header}) async {
    var local_headers = {'company': '006', 'Content-Type': 'application/json', 'Authorization': 'Basic b25saW5lOm9ubGluZTEyMw=='};

    var request = http.Request('GET', Uri.parse(full_url));

    request.headers.addAll(header ?? local_headers);

    http.StreamedResponse response = await request.send().timeout(Duration(seconds: 240)).catchError((onError) {
      print("timeout error");
      global.snakbar(
        type: "ERROR",
        msg: "Request Timeout",
      );

      return null;
    });

    var k = await (response.stream.bytesToString());
    print("this is res $k");

    try {
      if (k.contains("Downstream system not responding")) {
        snakbar(type: "ERROR", msg: "Api not working");
        return null;
      } else if (k.contains("404--Not Found")) {
        snakbar(type: "ERROR", msg: "404");
        return null;
      } else if (json.decode(k)['errMessage'] != "true" && json.decode(k)['errMessage'] != "Success" && json.decode(k)['errMessage'] != null) {
        if (json.decode(k)['errMessage'] != "No records found") {
          snakbar(type: "ERROR", msg: json.decode(k)['errMessage']);
        }
        return null;
      } else if (json.decode(k)['errorMessage'] != "true" && json.decode(k)['errorMessage'] != "Success" && json.decode(k)['errorMessage'] != null) {
        if (json.decode(k)['errorMessage'] != "No records found") {
          snakbar(type: "ERROR", msg: json.decode(k)['errorMessage']);
        }
        return null;
      } else if (json.decode(k)['responseCode'] == "Failure") {
        snakbar(type: "ERROR", msg: json.decode(k)['errorMessage']);
        return null;
      }
    } catch (e) {
      return null;
    }
    return k;
  }

  Future postCall({required body, required full_url, header}) async {
    var local_headers = {'company': '006', 'Content-Type': 'application/json', 'Authorization': 'Basic b25saW5lOm9ubGluZTEyMw=='};

    var request = http.Request('POST', Uri.parse(full_url));

    request.body = body;
    request.headers.addAll(header ?? local_headers);

    log(body);

    http.StreamedResponse response = await request.send().timeout(Duration(seconds: 240)).catchError((onError) {
      print("timeout error");
      global.snakbar(
        type: "ERROR",
        msg: "Request Timeout",
      );

      return null;
    });

    var k = await (response.stream.bytesToString());
    print("this is res ${response.statusCode}");
    try {
      if (response.statusCode != 200) {
        log("api trap 1");
        snakbar(type: "ERROR", msg: "Api issue");
        return null;
      } else if (k.contains("Downstream system not responding")) {
        log("api trap 3");
        snakbar(type: "ERROR", msg: "Api not working");
        return null;
      } else if (k.contains("404--Not Found")) {
        log("api trap 4");
        snakbar(type: "ERROR", msg: "404");
        return null;
      } else if (json.decode(k)['errMessage'] != "true" && json.decode(k)['errMessage'] != "Success" && json.decode(k)['errMessage'] != null) {
        log("api trap 5");
        if (json.decode(k)['errMessage'] != "No records found") {
          snakbar(type: "ERROR", msg: json.decode(k)['errMessage']);
        }
        return null;
      } else if (json.decode(k)['errorMessage'] != "true" && json.decode(k)['errorMessage'] != "Success" && json.decode(k)['errorMessage'] != null) {
        log("api trap 6");
        if (json.decode(k)['errorMessage'] != "No records found") {
          snakbar(type: "ERROR", msg: json.decode(k)['errorMessage']);
        }
        return null;
      } else if (json.decode(k)['responseCode'] == "Failure") {
        log("api trap 7");
        snakbar(type: "ERROR", msg: json.decode(k)['errorMessage']);
        return null;
      } else {
        log("api trap 8");
        return k;
      }
    } catch (e) {
      log("api trap 9");
      log("thiis api issue ${e}");
      return null;
    }
  }

  Future pupCall({required body, required full_url, header}) async {
    var local_headers = {'company': '006', 'Content-Type': 'application/json', 'Authorization': 'Basic b25saW5lOm9ubGluZTEyMw=='};

    var request = http.Request('PUT', Uri.parse(full_url));

    request.body = body;
    request.headers.addAll(header ?? local_headers);

    log(body);

    http.StreamedResponse response = await request.send().timeout(Duration(seconds: 240)).catchError((onError) {
      print("timeout error");
      global.snakbar(
        type: "ERROR",
        msg: "Request Timeout",
      );

      return null;
    });

    var k = await (response.stream.bytesToString());
    print("this is res ${response.statusCode}");
    try {
      if (response.statusCode != 200) {
        log("api trap 1");
        snakbar(type: "ERROR", msg: "Api issue");
        return null;
      } else if (k.contains("Downstream system not responding")) {
        log("api trap 3");
        snakbar(type: "ERROR", msg: "Api not working");
        return null;
      } else if (k.contains("404--Not Found")) {
        log("api trap 4");
        snakbar(type: "ERROR", msg: "404");
        return null;
      } else if (json.decode(k)['errMessage'] != "true" && json.decode(k)['errMessage'] != "Success" && json.decode(k)['errMessage'] != null) {
        log("api trap 5");
        if (json.decode(k)['errMessage'] != "No records found") {
          snakbar(type: "ERROR", msg: json.decode(k)['errMessage']);
        }
        return null;
      } else if (json.decode(k)['errorMessage'] != "true" && json.decode(k)['errorMessage'] != "Success" && json.decode(k)['errorMessage'] != null) {
        log("api trap 6");
        if (json.decode(k)['errorMessage'] != "No records found") {
          snakbar(type: "ERROR", msg: json.decode(k)['errorMessage']);
        }
        return null;
      } else if (json.decode(k)['responseCode'] == "Failure") {
        log("api trap 7");
        snakbar(type: "ERROR", msg: json.decode(k)['errorMessage']);
        return null;
      } else {
        log("api trap 8");
        return k;
      }
    } catch (e) {
      log("api trap 9");
      log("thiis api issue ${e}");
      return null;
    }
  }

  Future form_data({required body, required full_url, header}) async {
    var request = http.MultipartRequest('POST', Uri.parse(full_url));

    request.fields.addAll(body);
    request.headers.addAll(header);

    http.StreamedResponse response = await request.send().timeout(Duration(seconds: 240)).catchError((onError) {
      print("timeout error");
      global.snakbar(
        type: "ERROR",
        msg: "Request Timeout",
      );

      return null;
    });

    var k = await (response.stream.bytesToString());
    print("this is res ${response.statusCode}");
    try {
      if (response.statusCode != 200) {
        log("api trap 1");
        snakbar(type: "ERROR", msg: "Api issue");
        return null;
      } else if (k.contains("Downstream system not responding")) {
        log("api trap 3");
        snakbar(type: "ERROR", msg: "Api not working");
        return null;
      } else if (k.contains("404--Not Found")) {
        log("api trap 4");
        snakbar(type: "ERROR", msg: "404");
        return null;
      } else if (json.decode(k)['errMessage'] != "true" && json.decode(k)['errMessage'] != "Success" && json.decode(k)['errMessage'] != null) {
        log("api trap 5");
        if (json.decode(k)['errMessage'] != "No records found") {
          snakbar(type: "ERROR", msg: json.decode(k)['errMessage']);
        }
        return null;
      } else if (json.decode(k)['errorMessage'] != "true" && json.decode(k)['errorMessage'] != "Success" && json.decode(k)['errorMessage'] != null) {
        log("api trap 6");
        if (json.decode(k)['errorMessage'] != "No records found") {
          snakbar(type: "ERROR", msg: json.decode(k)['errorMessage']);
        }
        return null;
      } else if (json.decode(k)['responseCode'] == "Failure") {
        log("api trap 7");
        snakbar(type: "ERROR", msg: json.decode(k)['errorMessage']);
        return null;
      } else {
        log("api trap 8");
        return k;
      }
    } catch (e) {
      log("api trap 9");
      log("thiis api issue ${e}");
      return null;
    }
  }

  Future uploadImage({file_name, file_type, quoteNo, base46_img, file_code}) async {
    var body = json.encode([
      {"quoteNo": quoteNo, "docCode": file_code, "userId": "mobile", "docType": "POL", "fileName": file_name, "filetype": file_type, "file64BaseString": "$base46_img"}
    ]);

    print("uploading quote ${body}");

    var res = await restCall(body, "upldmultiDoc?company=006");

    print("res quote ${res}");

    if (json.decode(res)["$file_code"] != null && json.decode(res)["$file_code"]["errMessage"] != "Success") {
      global.snakbar(
        type: "ERROR",
        msg: "${json.decode(res)["$file_code"]["errMessage"]}",
      );

      return false;
    } else {
      return true;
    }
  }

  Future uploadImageClaim({file_name, file_type, quoteNo, base46_img, file_code, required transid, required policyno}) async {
    var body = json.encode([
      {
        "transId": "$transid",
        "policyNo": "$policyno",
        "tranSrNo": "1",
        "lobCode": "01",
        "quoteNo": quoteNo,
        "docCode": file_code,
        "userId": "mobile",
        "docType": "INT_CLM",
        "fileName": file_name,
        "filetype": file_type,
        "file64BaseString": "$base46_img"
      }
    ]);

    print("uploading quote ${body}");

    var res = await restCall(body, "upldmultiDoc?company=006");

    print("res quote ${res}");

    if (json.decode(res)["$file_code"] != null && json.decode(res)["$file_code"]["errMessage"] != "Success") {
      global.snakbar(
        type: "ERROR",
        msg: "${json.decode(res)["$file_code"]["errMessage"]}",
      );

      return false;
    } else {
      return true;
    }
  }


}
