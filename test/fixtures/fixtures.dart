import 'dart:io';

String fixture(String name) =>
    File("test/fixtures/image_response.json").readAsStringSync();
