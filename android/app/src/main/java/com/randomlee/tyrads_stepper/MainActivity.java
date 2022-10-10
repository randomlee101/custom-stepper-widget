package com.randomlee.tyrads_stepper;

import androidx.annotation.NonNull;

import java.util.ArrayList;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "com.randomlee.tyrads_stepper/steps";
    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL).setMethodCallHandler(
                ((call, result) -> {
                    if(call.method.equals("getSteps"))
                    {
                        Step step1 = new Step(0, "Select Campaign Settings", "","For each ad campaign that you create, you can control how much you are willing to spend on clicks and conversions, which networks and geographical locations you want your ads to show on and more");
                        Step step2 = new Step(1, "Create An Ad Group", "","Lorem Ipsum");
                        Step step3 = new Step(2, "Create An Ad", "Last Step","Try out different ad text to see what brings in the most customers, and learn how to enhance your ads using features like ad extensions. If you run into any problems with your ads, find out how to tell if they are running and how to resolve approval issues");
                        ArrayList<Step> steps = new ArrayList<Step>();
                        steps.add(step1);
                        steps.add(step2);
                        steps.add(step3);
                        result.success(steps.toString());
                    }
                })
        );
    }
}
