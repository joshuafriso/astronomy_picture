import 'package:astronomy_picture/core/failure.dart';
import 'package:astronomy_picture/data/models/apod_model.dart';
import 'package:astronomy_picture/domain/entities/apod.dart';

Apod Function() tApod = () => Apod(
    copyright: "Stefan Seip",
    date: DateTime.parse("2004-09-27"),
    explantion: "The Great Nebula in orion is a colorful place.",
    mediaType: "image",
    serviceVersion: "v1",
    title: "The Great Nebula in Orion",
    url: "https://apod.nasa.gov/apod/image/0409/orion_seip.jpg",
    hdurl: "https://apod.nasa.gov/apod/image/0409/orion_seip_big.jpg");

Failure Function() tNoConnection = () => NoConnection();

ApodModel Function() tApodModel = () => ApodModel(
    copyright: "Stefan Seip",
    date: DateTime.parse("2004-09-27"),
    explantion: "The Great Nebula in orion is a colorful place.",
    mediaType: "image",
    serviceVersion: "v1",
    title: "The Great Nebula in Orion",
    url: "https://apod.nasa.gov/apod/image/0409/orion_seip.jpg",
    hdurl: "https://apod.nasa.gov/apod/image/0409/orion_seip_big.jpg");
