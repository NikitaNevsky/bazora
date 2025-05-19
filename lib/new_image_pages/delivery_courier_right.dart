import 'package:flutter/material.dart';

class DeliveryCourierRight extends StatefulWidget {
  const DeliveryCourierRight({Key? key}) : super(key: key);

  @override
  _DeliveryCourierRightState createState() => _DeliveryCourierRightState();
}

class _DeliveryCourierRightState extends State<DeliveryCourierRight> {
  bool _isWarehousePickup = false;
  bool _isCourierDelivery = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 600;
    
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(110),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF232A36),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(23),
              bottomRight: Radius.circular(23),
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: const Icon(Icons.chevron_left, color: Colors.white, size: 24),
              onPressed: () => Navigator.of(context).pop(),
            ),
            centerTitle: true,
            toolbarHeight: 100,
            title: const Text(
              'Способ доставки',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: isLargeScreen ? 50 : 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: _switchTile('Самовывоз со склада', _isWarehousePickup, (value) {
                  setState(() {
                    _isWarehousePickup = value;
                    _isCourierDelivery = !value;
                  });
                }),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: isLargeScreen ? 50 : 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: _switchTile('Доставка курьером', _isCourierDelivery, (value) {
                  setState(() {
                    _isCourierDelivery = value;
                    _isWarehousePickup = !value;
                  });
                }),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Введите адрес доставки',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: 'Адрес',
                hintStyle: const TextStyle(color: Color(0xFFA4ACB6)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: Color(0xFFA4ACB6), width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: Color(0xFFA4ACB6), width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: Color(0xFFA4ACB6), width: 1.5),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'ИЛИ',
              style: TextStyle(
                color: Color(0xFF1D293A),
                fontWeight: FontWeight.w400,
                fontSize: 16
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              'Выберите адрес магазина',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            _storeTile('Магазин №1', 'Оптовик, Москва, Лесная 45', false),
            const SizedBox(height: 8),
            _storeTile('Магазин №2', 'Технолаб, Москва, Дружбы 37', true),
            const Spacer(),
            _confirmButton(false),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _switchTile(String title, bool value, ValueChanged<bool>? onChanged) {
    final isLargeScreen = MediaQuery.of(context).size.width > 600;
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: isLargeScreen ? 16 : 14,
            color: const Color(0xFF1D293A),
          ),
        ),
        Transform.scale(
          scale: isLargeScreen ? 1.0 : 0.8,
          child: Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.white,
            activeTrackColor: const Color(0xFF1D293A),
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: const Color(0xFFEFF2F6),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
      ],
    );
  }

  Widget _storeTile(String title, String address, bool enabled) {
    return Container(
      height: 76,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: enabled ? const Color(0xFF232A36) : const Color(0xFFA4ACB6))),
          const SizedBox(height: 4),
          Text(address, style: TextStyle(color: enabled ? const Color(0xFF232A36) : const Color(0xFFA4ACB6))),
        ],
      ),
    );
  }

  Widget _confirmButton(bool enabled) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Center(
        child: SizedBox(
          width: 196,
          child: ElevatedButton(
            onPressed: null,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFA4ACB6),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(vertical: 18),
            ),
            child: const Text(
              'Подтвердить',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
