import 'package:flutter/material.dart';
import 'payment_method_right.dart';

class NotificationsListRight extends StatelessWidget {
  const NotificationsListRight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(145),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(23),
            bottomRight: Radius.circular(23),
          ),
          child: AppBar(
            backgroundColor: const Color(0xFF19202C),
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.chevron_left, color: Color(0xFFEFF2F6), size: 32),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(
              'Уведомления',
              style: TextStyle(
                color: const Color(0xFFEFF2F6),
                fontSize: 20,
              ),
            ),
            centerTitle: true,
            toolbarHeight: 145,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF1D293A),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF7F7F7),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: const Color(0x1414140A),
                                ),
                              ),
                              child: const Text(
                                'Прочитано (5)',
                                style: TextStyle(color: Color(0xFF1D293A)),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: const Color(0xFF1D293A),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  bottomLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                ),
                              ),
                              child: const Text(
                                'Новые (4)',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(bottom: 50),
                children: [
                  _notificationTile('Заказ доставлен', 'Заказ Macbook Air M1 доставлен в пункт выдачи, подтвердите получение заказа и оцените товар после его получения', 'Вчера', true),
                  _notificationTile('Новое сообщение', 'Вы получили новое сообщение по заказу AirPods Max', '3 дня назад', false),
                  _notificationTile('Заказ собирается', 'Ваш заказ iPad Pro на 3 товара собирается и будет отправлен в течение 24 часов', '3 дня назад', false),
                  _notificationTile('Новый заказ оформлен', 'Заказ Apple Watch Ultra 2 успешно оформлен. Ожидайте сообщения от администратора', '23.02.2024', false),
                  _notificationTile('Оплата отклонена', 'Оплата заказа iPad Pro отклонена. Попробуйте еще раз или свяжитесь с администратором', '23.02.2024', false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _notificationTile(String title, String subtitle, String date, bool isNew) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Color(0xFFEFF2F6),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (isNew)
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              if (isNew) const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Text(
                date,
                style: const TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: const TextStyle(color: Color(0xFF232A36)),
          ),
        ],
      ),
    );
  }
}
