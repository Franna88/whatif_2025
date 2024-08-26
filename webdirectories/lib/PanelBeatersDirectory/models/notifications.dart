import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationsModel {
  final int? notificationsId;
  final int notificationTypeId;
  final String notificationTitle;
  final Timestamp notificationDate;
  final String notification;
  final int listingsId;
  final int? publish;
  final int? send;
  final int? showAddressBlock;

  NotificationsModel({
    this.notificationsId,
    required this.notificationTypeId,
    required this.notificationTitle,
    required this.notificationDate,
    required this.notification,
    required this.listingsId,
    this.publish,
    this.send,
    this.showAddressBlock,
  });
}
