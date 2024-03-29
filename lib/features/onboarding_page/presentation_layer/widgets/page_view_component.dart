import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../utils/app_styles.dart';
import '../../domain_layer/onboarding_page_model.dart';


class PageViewComponent extends StatelessWidget {
  const PageViewComponent({super.key, required this.model});
  final OnboardingModel model;
  @override
  Widget build(BuildContext context) {
    if (MediaQuery.sizeOf(context).width < 600) {
      return Column(
        children: [
          Flexible(child: SizedBox(height: MediaQuery.of(context).size.height * 0.1,)),
          AspectRatio(
            aspectRatio: 1,
            child: Lottie.asset(model.imagePath, fit: BoxFit.fill,),
          ),
          //const Flexible(child: SizedBox(height: 0,)),
          ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[Colors.red, Colors.pink, Colors.purple, Colors.blue, Colors.green, Colors.yellow],
              ).createShader(bounds);
            },
            child: Text(
              model.title,
              textAlign: TextAlign.center,
              style: AppStyle.styleSemiBold32(context),
            ),
          ),
          const SizedBox(height: 20,),
          Text(
            model.description,
            textAlign: TextAlign.center,
            style: AppStyle.styleLight16(context),
          )
        ],
      );
    }  else {
      return Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Flexible(child: SizedBox(height: MediaQuery.of(context).size.height * 0.1,)),
                ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[Colors.red, Colors.pink, Colors.purple, Colors.blue, Colors.green, Colors.yellow],
                    ).createShader(bounds);
                  },
                  child: Text(
                    model.title,
                    textAlign: TextAlign.center,
                    style: AppStyle.styleSemiBold32(context),
                  ),
                ),
                const SizedBox(height: 20,),
                Text(
                  model.description,
                  style: AppStyle.styleLight16(context),
                ),
              ],
            ),
          ),
          const SizedBox(width: 30,),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: Lottie.asset(model.imagePath, fit: BoxFit.fill,),
            ),
          ),
        ],
      );
    }
  }
}
