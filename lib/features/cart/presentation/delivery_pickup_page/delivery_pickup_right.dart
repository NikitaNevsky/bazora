import 'package:bazora/core/utils/app_colors.dart';
import 'package:bazora/core/widgets/buttons/custom_button.dart';
import 'package:bazora/core/widgets/inputs/custom_text_field.dart';
import 'package:bazora/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DeliveryPickupRight extends StatefulWidget {
  const DeliveryPickupRight({Key? key}) : super(key: key);

  @override
  _DeliveryPickupRightState createState() => _DeliveryPickupRightState();
}

class _DeliveryPickupRightState extends State<DeliveryPickupRight> {
  bool _isWarehousePickup = true;
  bool _isCourierDelivery = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 600;
    
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(110),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF1D293A),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(23),
              bottomRight: Radius.circular(23),
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            leading: const BackButton(color: AppColors.white),
            centerTitle: true,
            toolbarHeight: 100,
            title: const Text(
              'Способ доставки',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
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
            _isWarehousePickup ? _warehouseTile('Склад № 3', 'Москва, Лесная 12', '09:00-20:00') : SizedBox(),
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
            _isCourierDelivery ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Text('Введите адрес доставки', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF232A36))),
                const SizedBox(height: 8),
                SizedBox(
                  height: 50,
                  child: CustomTextField(
                    hintText: 'Адрес',
                    fillColor: AppColors.white,
                    cursorColor: AppColors.black,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text('ИЛИ', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xFF232A36))),
                const SizedBox(height: 16),
                Text('Выбеите адрес магазина', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF232A36))),
                const SizedBox(height: 8),
                _warehouseTile('Магазин №1', 'Оптовик, Москва, Лесная 45', '')

              ],
            ) : SizedBox(),
            const Spacer(),
            _confirmButton(true),
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
        SizedBox(
          width: 44,
          height: 21.6,
          child: Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.white,
            activeTrackColor: const Color(0xFF1D293A),
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: const Color(0xFFA4ACB6),
            materialTapTargetSize: MaterialTapTargetSize.padded,
            trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
          ),
        ),
      ],
    );
  }

  Widget _warehouseTile(String title, String address, String time) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF232A36))),
                const SizedBox(height: 4),
                Text(address, style: const TextStyle(color: Color(0xFF232A36), fontSize: 16, fontWeight: FontWeight.w400)),
              ],
            ),
          ),
          Text(time, style: const TextStyle(color: Color(0xFFA4ACB6), fontSize: 14, fontWeight: FontWeight.w400)),
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
            onPressed: enabled ? () {
              context.pushNamed(Routes.paymentMethodRight);
            } : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: enabled ? AppColors.baseColor : const Color(0xFFA4ACB6),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              padding: const EdgeInsets.symmetric(vertical: 10),
            ),
            child: const Text('Подтвердить', style: TextStyle(fontSize: 18)),
          ),
        ),
      ),
    );
  }
}
