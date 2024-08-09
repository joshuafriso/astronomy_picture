import 'package:equatable/equatable.dart';

class Apod extends Equatable {
  final String? copyright;
  final DateTime? date;
  final String? explantion;
  final String? hdurl;
  final String? mediaType;
  final String? serviceVersion;
  final String? thumbnailUrl;
  final String? title;
  final String? url;

  const Apod(
      {this.copyright,
      this.date,
      this.explantion,
      this.hdurl,
      this.mediaType,
      this.serviceVersion,
      this.thumbnailUrl,
      this.title,
      this.url});

  @override
  List<Object?> get props => [
        copyright,
        date,
        explantion,
        hdurl,
        mediaType,
        serviceVersion,
        thumbnailUrl,
        title,
        url
      ];
}
