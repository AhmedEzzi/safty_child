import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safty_children/core/helpers/navigation_helper.dart';
import 'package:safty_children/core/routing/Routes.dart';
import 'package:safty_children/core/themeing/app_assets.dart';
import 'package:safty_children/core/themeing/app_colors.dart';
import 'package:safty_children/core/themeing/app_strings.dart';
import 'package:safty_children/core/themeing/app_styles.dart';
import 'package:safty_children/features/home/presentation/views/widgets/home_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String url = 'https://copilot.microsoft.com/chats/';

  int selectedIndex = 0;
  Key navBarKey = UniqueKey();

  bool isLoading = true;

  late List<Map<String, dynamic>> homeBoxesData;

  @override
  void initState() {
    super.initState();
    _loadResources();
  }

  Future<void> _loadResources() async {
    await Future.delayed(const Duration(seconds: 2));

    homeBoxesData = [
      {
        'color': AppColors.yellow,
        'bgColor': Colors.white,
        'icon': Icons.warning_amber_rounded,
        'title': AppStrings.poisoning,
        'routeArg': AppStrings.poisoning,
      },
      {
        'color': AppColors.red,
        'bgColor': Colors.white,
        'icon': Icons.air,
        'title': AppStrings.choking,
        'routeArg': AppStrings.choking,
      },
    ];

    setState(() {
      isLoading = false;
    });
  }

  changeIndxex({required BuildContext context, required int index}) async {
    if (index == 1) {
      await context.pushNamed(Routes.media);
    } else if (index == 2) {
      await context.pushNamed(Routes.test);
    } else if (index == 3) {
      await context.pushNamed(Routes.webView, arguments: url);
    }
    setState(() {
      selectedIndex = 0;
      navBarKey = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
          leading: Image.asset('assets/img/image_2025-08-03_01-37-21-removebg-preview.png'),

        title: Text(
          AppStrings.main,
          style: AppStyles.appBarStyle.copyWith(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
         Image.asset('assets/img/image_2025-08-03_01-37-30-removebg-preview.png'),

        ],
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.appBarColor,
        elevation: 11,
      ),
      body: HomeBody(homeBoxesData: homeBoxesData),
      bottomNavigationBar: ConvexAppBar(
        color: Colors.white,
        key: navBarKey,
        height: 70.h,
        backgroundColor: AppColors.appBarColor,
        initialActiveIndex: selectedIndex,
        items: [
          TabItem(icon: Icons.home, title: 'الرئيسية'),
          TabItem(icon: Icons.video_collection, title: 'محتوى مرئى'),
          TabItem(icon: Icons.quiz_outlined, title: AppStrings.test),
          TabItem(
            icon: SvgPicture.asset(AppAssets.copoiltIcon),
            title: 'Copilot',
          ),
        ],
        onTap: (int index) {
          changeIndxex(context: context, index: index);
        },
      ),
    );
  }
}
