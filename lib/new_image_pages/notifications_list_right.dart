import 'package:flutter/material.dart';

class NotificationsListRight extends StatefulWidget {
  const NotificationsListRight({Key? key}) : super(key: key);

  @override
  State<NotificationsListRight> createState() => _NotificationsListRightState();
}

class _NotificationsListRightState extends State<NotificationsListRight> {
  bool showNew = true; // true = "Новые", false = "Прочитано"

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
            title: const Text(
              'Уведомления',
              style: TextStyle(
                color: Color(0xFFEFF2F6),
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Stack(
                      children: [
                        // Background container with border
                        Container(
                          width: double.infinity,
                          height: 35,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFFDFE5ED)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        // Overlay dark container
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 250),
                          left: showNew ? 0 : constraints.maxWidth / 2,
                          child: Container(
                            width: constraints.maxWidth / 2,
                            height: 35,
                            decoration: BoxDecoration(
                              color: const Color(0xFF1D293A),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        // Text and Gesture Detectors (on top of everything)
                        SizedBox(
                          width: double.infinity,
                          height: 35,
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () => setState(() => showNew = true),
                                  child: Center(
                                    child: Text(
                                      'Новые (4)',
                                      style: TextStyle(
                                        color: showNew ? Colors.white : const Color(0xFF1D293A),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () => setState(() => showNew = false),
                                  child: Center(
                                    child: Text(
                                      'Прочитано (5)',
                                      style: TextStyle(
                                        color: !showNew ? Colors.white : const Color(0xFF1D293A),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(bottom: 50),
                children: showNew
                    ? [
                        _notificationTile('Заказ доставлен', 'Заказ Macbook Air M1 доставлен в пункт выдачи, подтвердите получение заказа и оцените товар после его получения', 'Вчера', true),
                        _notificationTile('Новое сообщение', 'Вы получили новое сообщение по заказу AirPods Max', '3 дня назад', true),
                        _notificationTile('Заказ собирается', 'Ваш заказ iPad Pro на 3 товара собирается и будет отправлен в течение 24 часов', '3 дня назад', true),
                        _notificationTile('Новый заказ оформлен', 'Заказ Apple Watch Ultra 2 успешно оформлен. Ожидайте сообщения от администратора', '23.02.2024', true),
                      ]
                    : [
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
        color: const Color(0xFFEFF2F6),
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
