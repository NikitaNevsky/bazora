import "dart:async";
import "package:bazora/services/remote_config_service.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:go_router/go_router.dart";
import "package:bazora/constants/constants.dart";
import "package:bazora/constants/image_constants.dart";
import "package:bazora/core/extension/build_context_extension.dart";
import "package:bazora/core/theme/themes.dart";
import "package:bazora/core/widgets/bottom_sheet/custom_bottom_sheet.dart";
import "package:bazora/core/widgets/bottom_sheet/update_app_sheet.dart";
import "package:bazora/router/app_routes.dart";
import "package:bazora/services/remote_config_service.dart";
import "package:url_launcher/url_launcher.dart";

part "mixins/splash_mixin.dart";

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}




class _SplashPageState extends State<SplashPage> with SplashMixin {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await checkLanguage(context);
    });
  }

  Future<void> checkLanguage(BuildContext context)async{
    if(localSource.language == null){
      context.setLocale(const Locale('uz'));
      await localSource.setLanguage('uz');
    }else{
      context.setLocale(Locale(localSource.language!));
    }
  }

  @override
  Widget build(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: systemUiOverlayStyle,
        child: Scaffold(
          backgroundColor: const Color(0xffEFF2F6),
          body: Center(
            child: SvgPicture.asset(SvgIcons.icLogo),
          ),
        ),
      );
}
