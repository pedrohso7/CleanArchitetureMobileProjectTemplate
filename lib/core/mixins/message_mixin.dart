import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin MessageMixin on GetxController {
  final message = Rxn<MessageModel>();

  @override
  void onInit() {
    super.onInit();
    ever<MessageModel?>(message, (model) async {
      if (model != null) {
        Get.snackbar(
          model.title,
          model.message,
          snackPosition: model.messagePosition,
          backgroundColor: model.type.color,
          colorText: model.type.textColor,
          margin: const EdgeInsets.all(15),
          icon: model.type.icon,
        );
      }
    });
  }
}

class MessageModel {
  final String title;
  final String message;
  final MessageType type;
  final SnackPosition? messagePosition;

  MessageModel({
    required this.title,
    required this.message,
    required this.type,
    this.messagePosition,
  });
}

enum MessageType { success, error, warning, info }

extension MessageTypeColorExtension on MessageType {
  Color get color {
    switch (this) {
      case MessageType.success:
        return const Color(0xFFC5F2C7);
      case MessageType.error:
        return const Color(0xFFFCD0CF);
      case MessageType.warning:
        return const Color(0xFFFBE5C9);
      case MessageType.info:
        return const Color(0xFFC5DCFA);
    }
  }

  Color get textColor {
    switch (this) {
      case MessageType.success:
        return const Color(0xFF1F8B24);
      case MessageType.warning:
        return const Color(0xFFBF710F);
      case MessageType.info:
        return Colors.black;
      case MessageType.error:
        return const Color(0xFFDA100B);
    }
  }

  Icon get icon {
    switch (this) {
      case MessageType.success:
        return const Icon(Icons.check, color: Color(0xFF1F8B24));
      case MessageType.warning:
        return const Icon(Icons.warning, color: Color(0xFFBF710F));
      case MessageType.info:
        return const Icon(Icons.info, color: Colors.black);
      case MessageType.error:
        return const Icon(Icons.error, color: Color(0xFFDA100B));
    }
  }
}
