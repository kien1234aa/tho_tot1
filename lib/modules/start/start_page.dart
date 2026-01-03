import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tho_tot/modules/auth/auth_state.dart';
import 'package:tho_tot/routes/app_routes.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int currentSlide = 0;
  final PageController _pageController = PageController();
  final List<SlideData> slides = [
    SlideData(
      icon: Icons.search,
      title: "Tìm kiếm dịch vụ dễ dàng",
      description:
          "Khám phá hàng ngàn dịch vụ chất lượng từ những thợ chuyên nghiệp gần bạn",
      features: [
        "Tìm kiếm thông minh",
        "Lọc theo vị trí & giá",
        "Xem portfolio thợ",
      ],
    ),
    SlideData(
      icon: Icons.message,
      title: "Kết nối trực tiếp",
      description:
          "Đăng yêu cầu và nhận báo giá từ nhiều thợ, trao đổi trực tiếp qua chat",
      features: ["Đăng bài miễn phí", "Nhận báo giá nhanh", "Chat riêng tư"],
    ),
    SlideData(
      icon: Icons.shield,
      title: "Thanh toán an toàn",
      description:
          "Nhiều phương thức thanh toán linh hoạt với bảo vệ người dùng",
      features: ["Đa dạng thanh toán", "Hoàn tiền đảm bảo", "Bảo mật cao"],
    ),
    SlideData(
      icon: Icons.star,
      title: "Đánh giá minh bạch",
      description: "Xem đánh giá thực từ khách hàng, giúp bạn chọn thợ uy tín",
      features: ["Đánh giá chi tiết", "Hình ảnh thực tế", "Xêp hạng công khai"],
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void nextSlide() {
    if (currentSlide < slides.length - 1) {
      _pageController.animateToPage(
        currentSlide + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Color(0xFF009688), // teal-600
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.flash_on,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'ServiceHub',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF004D40), // teal-900
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Bỏ qua',
                      style: TextStyle(
                        color: Color(0xFF00796B), // teal-700
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Main Slides
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentSlide = index;
                  });
                },
                itemCount: slides.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            slides[index].icon,
                            size: 64,
                            color: const Color(0xFF009688), // teal-600
                          ),
                          const SizedBox(height: 32),
                          Text(
                            slides[index].title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF004D40), // teal-900
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            slides[index].description,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xFF00796B), // teal-700
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 32),
                          ...slides[index].features.map((feature) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 8,
                                    height: 8,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF009688),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    feature,
                                    style: const TextStyle(
                                      color: Color(0xFF00695C), // teal-800
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Pagination Dots
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(slides.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      _pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 8,
                      width: currentSlide == index ? 32 : 8,
                      decoration: BoxDecoration(
                        color: currentSlide == index
                            ? const Color(0xFF009688) // teal-600
                            : const Color(0xFF80CBC4), // teal-300
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  );
                }),
              ),
            ),

            // Navigation Buttons
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  if (currentSlide == slides.length - 1) ...[
                    ElevatedButton(
                      onPressed: () {
                        Get.toNamed(Routes.AUTH, arguments: AuthMode.register);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF009688),
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 56),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Bắt đầu ngay',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    OutlinedButton(
                      onPressed: () {
                        Get.toNamed(Routes.AUTH, arguments: AuthMode.login);
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF00796B),
                        side: const BorderSide(
                          color: Color(0xFF009688),
                          width: 2,
                        ),
                        minimumSize: const Size(double.infinity, 56),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Đăng nhập',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: const Color(0xFFB2DFDB),
                                width: 2,
                              ),
                            ),
                            child: const Column(
                              children: [
                                Icon(
                                  Icons.people,
                                  color: Color(0xFF009688),
                                  size: 32,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Tôi cần dịch vụ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF00695C),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: const Color(0xFFB2DFDB),
                                width: 2,
                              ),
                            ),
                            child: const Column(
                              children: [
                                Icon(
                                  Icons.shield,
                                  color: Color(0xFF009688),
                                  size: 32,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Tôi là thợ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF00695C),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ] else ...[
                    ElevatedButton(
                      onPressed: nextSlide,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF009688),
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 56),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Tiếp tục',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),

            // Footer Info
            const Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Nền tảng kết nối tin cậy giữa khách hàng và thợ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF00897B), // teal-600
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SlideData {
  final IconData icon;
  final String title;
  final String description;
  final List<String> features;

  SlideData({
    required this.icon,
    required this.title,
    required this.description,
    required this.features,
  });
}
