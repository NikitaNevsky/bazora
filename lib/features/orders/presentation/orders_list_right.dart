import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import '../../catalog/presentation/catalogpage.dart';
import '../../../listofchats.dart';
import '../../profile/presentation/my_profile_page.dart';
import '../../cart/presentation/wholesale_page_right.dart';
import '../../../new_image_pages/order_details_right.dart';
import '../../../new_image_pages/confirm_receive_dialog_right.dart';

class OrdersListRight extends StatefulWidget {
  const OrdersListRight({Key? key}) : super(key: key);

  @override
  State<OrdersListRight> createState() => _OrdersListRightState();
}

class _OrdersListRightState extends State<OrdersListRight> {

  final List<OrderData> orders = const [
    OrderData(
      storeName: 'App Store',
      orderNumber: '№ 238706',
      priceDetails: '1 товар - 220 000 ₽',
      cashback: '250 ₽ кэшбэк',
      status: 'доставлен',
      statusColor: Color(0xFF51CBCD),
      showConfirm: true,
    ),
    OrderData(
      storeName: 'App Store',
      orderNumber: '№ 238705',
      priceDetails: '2 товара - 220 000 ₽',
      cashback: '250 ₽ кэшбэк',
      status: 'нет оплаты',
      statusColor: Color(0xFFE9D32C),
      showConfirm: false,
    ),
    OrderData(
      storeName: 'App Store',
      orderNumber: '№ 238704',
      priceDetails: '2 товара - 220 000 ₽',
      cashback: '250 ₽ кэшбэк',
      status: 'отменен',
      statusColor: Color(0xFFBE364E),
      showConfirm: false,
    ),
    OrderData(
      storeName: 'App Store',
      orderNumber: '№ 238703',
      priceDetails: '2 товара - 220 000 ₽',
      cashback: '250 ₽ кэшбэк',
      status: 'доставлен',
      statusColor: Color(0xFF41B6E9),
      showConfirm: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        toolbarHeight: 145,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(23),
            bottomRight: Radius.circular(23),
          ),
        ),
        backgroundColor: const Color(0xFF1D293A),
        title: const Text(
          'Заказы',
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.only(left: 2, right: 2, top: 10, bottom: 100),
        itemCount: orders.length,
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          return OrderCard(order: orders[index]);
        },
      ),
    );
  }
}

class OrderData {
  final String storeName;
  final String orderNumber;
  final String priceDetails;
  final String cashback;
  final String status;
  final Color statusColor;
  final bool showConfirm;
  final String image;

  const OrderData({
    required this.storeName,
    required this.orderNumber,
    required this.priceDetails,
    required this.cashback,
    required this.status,
    required this.statusColor,
    required this.showConfirm,
    this.image = 'assets/imagess/random1.png',
  });
}

class OrderCard extends StatelessWidget {
  final OrderData order;

  const OrderCard({required this.order});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const OrderDetailsRight(),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 7.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(23)),
        color: Color(0xFFFFFFFF),
        child: Padding(
          padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      order.storeName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 6),
                    Row(
                      children: [
                        Text(
                          order.orderNumber,
                          style: TextStyle(
                            color: Color(0xFFA4ACB6), 
                            fontSize: 11,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.content_copy_outlined,
                          size: 16,
                        ),
                      ],
                    ),
                  ],
                ),
                // Status Row
                Row(
                  children: [
                    if (order.status == 'доставлен') ...[
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF51CBCD), width: 1),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              IconlyLight.tick_square,
                              color: Color(0xFF51CBCD),
                              size: 20,
                            ),
                            SizedBox(width: 8),
                            Text(
                              order.status,
                              style: TextStyle(
                                color: Color(0xFF51CBCD),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    if (order.status == 'нет оплаты') ...[
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFE9D32C), width: 1),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              IconlyLight.time_square,
                              color: Color(0xFFE9D32C),
                              size: 20,
                            ),
                            SizedBox(width: 8),
                            Text(
                              order.status,
                              style: TextStyle(
                                color: Color(0xFFE9D32C),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ] else if (order.status == 'отменен') ...[
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFBE364E), width: 1),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              IconlyLight.close_square,
                              color: Color(0xFFBE364E),
                              size: 20,
                            ),
                            SizedBox(width: 8),
                            Text(
                              order.status,
                              style: TextStyle(
                                color: Color(0xFFBE364E),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Divider(color: Color(0xFFA4ACB6), thickness: 1),
            const SizedBox(height: 10),
            // Order Details Row
            Row(
              children: [
                // Overlapping containers using Stack
                SizedBox(
                  width: 80, // Enough to contain both overlapping containers
                  height: 60,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.asset(order.image),
                        ),
                      ),
                      if (!order.showConfirm)
                        Positioned(
                          left: 20, // Overlap amount
                          child: Stack(
                            alignment: Alignment.center, // Center the child elements
                            children: [
                              // Image Container
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Image.asset('assets/imagess/random1.png'),
                              ),

                              // Centered Text with Border
                              Positioned(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Colors.white.withOpacity(0.8),
                                  ),
                                  child: Text(
                                    '+1',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        order.priceDetails,
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF1D293A),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        order.cashback,
                        style: TextStyle(
                          color: Color(0XFF00526A),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Divider(color: Color(0xFFA4ACB6), thickness: 1),
            // Action Buttons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(
                      IconlyLight.chat,
                      color: Color(0xFF1D293A),
                      size: 20,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Перейти в чат',
                      style: TextStyle(
                        color: Color(0xFF1D293A),
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                if (order.showConfirm) ...[
                  Container(
                    height: 30,
                    width: 1,
                    color: Color(0xFFA4ACB6),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const ConfirmReceiveDialogRight();
                        },
                      );
                    },
                    behavior: HitTestBehavior.opaque,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      child: Row(
                        children: [
                          Icon(
                            IconlyLight.tick_square,
                            color: Color(0xFF1D293A),
                            size: 20,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Подтвердить',
                            style: TextStyle(
                              color: Color(0xFF1D293A),
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ],
          ),
        ),
      ),
    );
  }
}
