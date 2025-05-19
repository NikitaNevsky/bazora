import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:iconly/iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'new_image_pages/add_file_modal_right.dart';
import 'new_image_pages/bonus_payment_empty_right.dart';
import 'new_image_pages/bonus_payment_filled_right.dart';
import 'new_image_pages/cancel_order_dialog_right.dart';
import 'new_image_pages/cart_delete_dialog_right.dart';
import 'new_image_pages/confirm_receive_dialog_right.dart';
import 'new_image_pages/delivery_courier_disabled_right.dart';
import 'new_image_pages/delivery_courier_right.dart';
import 'new_image_pages/delivery_pickup_right.dart';
import 'new_image_pages/edit_order_modal_right.dart';
import 'new_image_pages/empty_chats_right.dart';
import 'new_image_pages/empty_notifications_right.dart';
import 'new_image_pages/empty_wholesale_right.dart';
import 'new_image_pages/notifications_list_right.dart';
import 'new_image_pages/order_details_right.dart';
import 'new_image_pages/order_success_right.dart';
import 'new_image_pages/orders_list_right.dart';
import 'new_image_pages/payment_method_disabled_right.dart';
import 'new_image_pages/payment_method_right.dart';
import 'new_image_pages/review_modal_right.dart';
import 'new_image_pages/wholesale_page_right.dart';
import 'new_image_pages/ProfileCreated.dart';
import 'chatpage.dart';
import 'neweditprofilepage.dart';
import 'profilepage.dart';
import 'Productdetails.dart';
import 'componentcamera.dart';
import 'listofchats.dart';
import 'filters.dart';
import 'favouritepage.dart';
import 'seeyourstores.dart';
import 'selectnearestdelivery.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  final List<Map<String, dynamic>> _products = [
    {
      'name': 'Macbook Air M1 (A2337)',
      'price': '\$999.99',
      'brand': 'Apple',
      'image': 'assets/images/top.jpg',
      'isFavorite': false,
    },
    {
      'name': 'iPhone 14 Pro',
      'price': '\$1199.99',
      'brand': 'Apple',
      'image': 'assets/images/top.jpg',
      'isFavorite': false,
    },
    {
      'name': 'Samsung Galaxy S23',
      'price': '\$899.99',
      'brand': 'Samsung',
      'image': 'assets/images/top.jpg',
      'isFavorite': false,
    },
    {
      'name': 'Sony WH-1000XM5',
      'price': '\$399.99',
      'brand': 'Sony',
      'image': 'assets/images/top.jpg',
      'isFavorite': false,
    },
    {
      'name': 'GoPro Hero 11',
      'price': '\$499.99',
      'brand': 'GoPro',
      'image': 'assets/images/top.jpg',
      'isFavorite': false,
    },
    {
      'name': 'Xiaomi Mi Band 7',
      'price': '\$49.99',
      'brand': 'Xiaomi',
      'image': 'assets/images/top.jpg',
      'isFavorite': false,
    },
  ];

  final List<String> _pagesList = [
    'OrderSuccess',
    'ReviewSentDialog',
    'AddFileModal',
    'BonusPaymentEmpty',
    'BonusPaymentFilled',
    'CancelOrderDialog',
    'CartDeleteDialog',
    'ConfirmReceiveDialog',
    'DeliveryCourierDisabled',
    'DeliveryCourier',
    'DeliveryPickup',
    'EditOrderModal',
    'EmptyChats',
    'EmptyNotifications',
    'EmptyWholesale',
    'NotificationsList',
    'OrderChat',
    'OrderDetails',
    'OrdersList',
    'PaymentMethodDisabled',
    'PaymentMethod',
    'ReviewModal',
    'WholesalePage',
    'ChatPage',
    'ProfilePage',
    'ProductDetails',
    'ComponentCamera',
    'SeeYourStores',
    'SelectNearestDelivery',
  ];
  String _selectedPage = 'OrderSuccess'; 

  void _toggleFavorite(int index) {
    setState(() {
      _products[index]['isFavorite'] = !_products[index]['isFavorite'];
    });
  }

  void _navigateToPage(String value) {
    Widget page;
    switch (value) {
      case 'ReviewSentDialog':
        page = const ReviewSentDialogRight();
        break;
      case 'AddFileModal':
        page = const AddFileModalRight();
        break;
      case 'BonusPaymentEmpty':
        page = const BonusPaymentEmptyRight();
        break;
      case 'BonusPaymentFilled':
        page = const BonusPaymentFilledRight();
        break;
      case 'CancelOrderDialog':
        page = const CancelOrderDialogRight();
        break;
      case 'CartDeleteDialog':
        page = const CartDeleteDialogRight();
        break;
      case 'ConfirmReceiveDialog':
        page = const ConfirmReceiveDialogRight();
        break;
      case 'DeliveryCourierDisabled':
        page = const DeliveryCourierDisabledRight();
        break;
      case 'DeliveryCourier':
        page = const DeliveryCourierRight();
        break;
      case 'DeliveryPickup':
        page = const DeliveryPickupRight();
        break;
      case 'EditOrderModal':
        page = const EditOrderModalRight();
        break;
      case 'EmptyChats':
        page = const EmptyChatsRight();
        break;
      case 'EmptyNotifications':
        page = const EmptyNotificationsRight();
        break;
      case 'EmptyWholesale':
        page = const EmptyWholesaleRight();
        break;
      case 'NotificationsList':
        page = const NotificationsListRight();
        break;

      case 'OrderDetails':
        page = const OrderDetailsRight();
        break;
      case 'OrderSuccess':
        page = const OrderSuccessRight();
        break;
      case 'OrdersList':
        page = const OrdersListRight();
        break;
      case 'PaymentMethodDisabled':
        page = const PaymentMethodDisabledRight();
        break;
      case 'PaymentMethod':
        page = const PaymentMethodRight();
        break;
      case 'ReviewModal':
        page = const ReviewModalRight();
        break;
      case 'WholesalePage':
        page = const WholesalePageRight();
        break;
      case 'ChatPage':
        page = const ChatPage();
        break;
      case 'ProfilePage':
        page = const ProfilePage();
        break;
      case 'ProductDetails':
        page = const ProductDetails();
        break;
      case 'ComponentCamera':
        page = const ComponentCamera();
        break;
      case 'SeeYourStores':
        page = const SeeYourStores();
        break;
      case 'SelectNearestDelivery':
        page = const SelectNearestDelivery();
        break;
      default:
        return;
    }
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => page));
  }

  int _selectedIndex = 0;
  String selectedValue = 'OrderSuccess';

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        // Already on catalog page
      } else if (index == 1) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const OrdersListRight()),
        );
      } else if (index == 2) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const WholesalePageRight()),
        );
      } else if (index == 3) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const ListOfChatsPage()),
        );
      } else if (index == 4) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const NewEditProfilePage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 197,
              constraints: BoxConstraints(
                minWidth: 360,
                maxWidth: 500,
              ),
              decoration: const BoxDecoration(
                color: Color(0xFF1D293A),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(23),
                  bottomRight: Radius.circular(23),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 55),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 3),
                              child: Icon(IconlyLight.location,
                                  color: Colors.white, size: 22),
                            ),
                            const SizedBox(width: 8),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.35 + 20,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  dropdownColor: const Color(0xFF1D293A),
                                  value: _selectedPage,
                                  icon: Icon(IconlyLight.arrow_down_2,
                                      color: Colors.white, size: 20),
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  isExpanded: true,
                                  items: _pagesList.map((page) {
                                    return DropdownMenuItem<String>(
                                      value: page,
                                      child: Text(
                                        page,
                                        style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? value) {
                                    setState(() {
                                      _selectedPage = value!;
                                    });
                                    _navigateToPage(value!);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                          icon: Icon(IconlyLight.notification,
                              color: Colors.white),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 32, left: 14, right: 14),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 44,
                            decoration: BoxDecoration(
                              color: const Color(0xFFEFF2F6),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.search,
                                    color: Color(0xFFA4ACB6)),
                                hintText: 'Хочу купить…',
                                hintStyle: TextStyle(color: Color(0xFFA4ACB6)),
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 11),
                              ),
                              onChanged: (value) {
                                // Search functionality can be added here later
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Container(
                          width: 46,
                          height: 44,
                          decoration: BoxDecoration(
                            color: const Color(0xFFEFF2F6),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            icon: Icon(IconlyLight.filter,
                                color: Color(0xFFA4ACB6)),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FilterPage()),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 1),
                child: Column(
                  children: [
                    Container(
                      height: 190,
                      margin: const EdgeInsets.only(
                          left: 0, right: 0, top: 0, bottom: 0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(28),
                          bottomRight: Radius.circular(28),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.03),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 9),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: _buildPromoCard(index),
                          ),
                        ),
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.only(top: 5, bottom: 2),
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 12, bottom: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 4, right: 4, bottom: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Категории',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Container(
                                  width: 36,
                                  height: 17,
                                  padding: const EdgeInsets.only(right: 4),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFD6E6FC),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, bottom: 2),
                                        child: Text(
                                          'Все',
                                          style: TextStyle(
                                            color: Color(0xFF1D293A),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 4),
                                      Icon(IconlyLight.arrow_right_2,
                                          size: 12, color: Color(0xFF1D293A)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 120,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.only(left: 4, right: 4),
                              itemCount: 6,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 6),
                                  child: SizedBox(
                                    width: 108,
                                    height: 108,
                                    child: _buildCategoryCard(index),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
  padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
  child: Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: _buildProductCard(
              _products[0]['name']!,
              _products[0]['price']!,
              _products[0]['brand']!,
              'assets/images/Paint.png',
              0,
            ),
          ),
          Expanded( 
            child: _buildProductCard(
              _products[1]['name']!,
              _products[1]['price']!,
              _products[1]['brand']!,
              'assets/images/Brush (1).png',
              1,
            ),
          ),
        ],
      ),
      SizedBox(height: 5), // Vertical spacing between rows (unchanged)
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: _buildProductCard(
              _products[0]['name']!,
              _products[0]['price']!,
              _products[0]['brand']!,
              'assets/images/Paint.png',
              0,
            ),
          ),
          Expanded(
            child: _buildProductCard(
              _products[1]['name']!,
              _products[1]['price']!,
              _products[1]['brand']!,
              'assets/images/Brush (1).png',
              1,
            ),
          ),
        ],
      ),
      SizedBox(height: 5),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: _buildProductCard(
              _products[0]['name']!,
              _products[0]['price']!,
              _products[0]['brand']!,
              'assets/images/Paint.png',
              0,
            ),
          ),
          Expanded(
            child: _buildProductCard(
              _products[1]['name']!,
              _products[1]['price']!,
              _products[1]['brand']!,
              'assets/images/Brush (1).png',
              1,
            ),
          ),
        ],
      ),
    ],
  ),
)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex, 
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF1D293A),
        unselectedItemColor: const Color(0xFFA4ACB6),
        selectedFontSize: 12,
        unselectedFontSize: 10,
        iconSize: 24,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(IconlyBold.category),
            label: 'Каталог',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.document),
            label: 'Заказы',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.buy),
            label: 'Корзина',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.chat),
            label: 'Чаты',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.profile),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }

  Widget _buildPromoCard(int index) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    return Container(
      width: isMobile ? screenWidth * 0.85 : screenWidth * 0.7,
      height: isMobile ? 150 : 200,
      margin: EdgeInsets.symmetric(
        horizontal: isMobile ? 8 : 16,
        vertical: isMobile ? 4 : 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(23),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(23),
              child: Transform(
                alignment: Alignment.centerLeft,
                transform: Matrix4.diagonal3Values(1.4, 1.0, 1.0),
                child: Image.asset(
                  'assets/images/banner1.jpeg',
                  fit: BoxFit.fill,
                  alignment: Alignment.centerLeft,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(23),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0x331D1DB5), 
                      Color(0x0C1D1DB5), 
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Акция месяца',
                  style: TextStyle(
                    color: Color(0xFF1D293A),
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Товары для рисования',
                  style: TextStyle(
                    color: Color(0xFF1D293A),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
              ],
            ),
          ),
          Positioned(
            bottom: -4, 
            left: -5.6, 
            child: _buildDiscountCircle('-15%', 80, const Color(0xFF1D293A)),
          ),
          Positioned(
            bottom: 23,
            left: 90,
            child: _buildDiscountCircle('-10%', 52, Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildDiscountCircle(String text, double size, Color bgColor) {
    return Container(
      width: size,
      height: size,
      margin: const EdgeInsets.only(right: 7),
      decoration: BoxDecoration(
        color: bgColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Transform.rotate(
          angle: text == '-15%' ? 350 * (math.pi / 180) : 15 * (math.pi / 180),
          child: Text(
            text,
            style: TextStyle(
              color: bgColor == Colors.white
                  ? const Color(0xFF1D293A)
                  : Colors.white,
              fontSize: text == '-15%' ? 24 : 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(int index) {
    final categories = [
      {'name': 'Гаджеты', 'image': 'assets/images/category1.jpeg.png'},
      {'name': 'Экшн-камеры', 'image': 'assets/images/category2.jpeg.png'},
      {'name': 'Гейминг', 'image': 'assets/images/category3.jpeg.png'},
      {'name': 'Гаджеты', 'image': 'assets/images/category1.jpeg.png'},
      {'name': 'Экшн-камеры', 'image': 'assets/images/category2.jpeg.png'},
      {'name': 'Гейминг', 'image': 'assets/images/category3.jpeg.png'}
    ];
    final item = categories[index % 6];
    return Container(
      width: 108,
      height: 108,
      decoration: BoxDecoration(
        color: const Color(0xFFF1F1F1),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              item['image']!,
              width: 70,
              height: 70,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            item['name']!,
            style: const TextStyle(
              color: Color(0xFF1D293A),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(
      String name, String price, String brand, String imageUrl, int index) {
    bool isFavorite = _products[index]['isFavorite'];
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => ProductDetails()),
        );
      },
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          minHeight: (isMobile ? 205 : 235),
        ),
        margin: EdgeInsets.symmetric(
          vertical: 2,
          horizontal: isMobile ? 2.5 : 0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: isMobile ? 170 : 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4, left: 4, right: 4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      child: Image.asset(
                        imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 5,
                  child: IconButton(
                    onPressed: () => _toggleFavorite(index),
                    icon: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isFavorite ? IconlyBold.heart : IconlyLight.heart,
                        color: isFavorite ? Colors.red : Colors.grey,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(isMobile ? 6.0 : 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: isMobile ? 13 : 15,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(IconlyLight.star,
                              color: Colors.amber, size: isMobile ? 13 : 16),
                          SizedBox(width: isMobile ? 2 : 4),
                          Text('4.5',
                              style: TextStyle(fontSize: isMobile ? 10 : 12)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: isMobile ? 2 : 4),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(isMobile ? 2 : 4),
                        decoration: BoxDecoration(
                          color: Color(0xFFB1F0F7),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(IconlyLight.bag_2,
                            size: isMobile ? 13 : 16, color: Color(0xFF1D293A)),
                      ),
                      SizedBox(width: isMobile ? 4 : 8),
                      Expanded(
                        child: Text(
                          brand,
                          style: TextStyle(fontSize: isMobile ? 10 : 12),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: isMobile ? 2 : 4),
                  Text(
                    name,
                    style: TextStyle(fontSize: isMobile ? 10 : 12),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 6.0 : 8.0,
                vertical: isMobile ? 2.0 : 4.0,
              ),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1D293A),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: isMobile ? 10 : 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ProductDetails()),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(IconlyLight.buy,
                          color: Colors.white, size: isMobile ? 16 : 20),
                      SizedBox(width: isMobile ? 4 : 8),
                      Flexible(
                        child: Text(
                          'В корзину',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700,
                            fontSize: isMobile ? 12 : 14,
                            color: Colors.white,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
