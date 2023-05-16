import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as vector;
// import 'package:flutter/cupertino.dart';
import 'package:learning_input_image/learning_input_image.dart';
import 'pose.dart';
import 'dart:math';
// import 'package:logger/logger.dart';

class PosePainter extends CustomPainter {
  final Pose pose;
  final Size imageSize;
  final InputImageRotation rotation;
  late final String angle;

  PosePainter( {
    required this.pose,
    required this.imageSize,
    this.rotation = InputImageRotation.ROTATION_0,
  });



  @override
  void paint(Canvas canvas, Size size) {
    final dotPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    pose.landmarks.forEach((key, landmark) {
      canvas.drawCircle(transform(landmark.position, size), 1, dotPaint);
    });

    PoseLandmark? leftShoulder = pose.landmark(PoseLandmarkType.LEFT_SHOULDER);
    PoseLandmark? rightShoulder = pose.landmark(PoseLandmarkType.RIGHT_SHOULDER);
    PoseLandmark? leftElbow = pose.landmark(PoseLandmarkType.LEFT_ELBOW);
    PoseLandmark? rightElbow = pose.landmark(PoseLandmarkType.RIGHT_ELBOW);
    PoseLandmark? leftWrist = pose.landmark(PoseLandmarkType.LEFT_WRIST);
    PoseLandmark? rightWrist = pose.landmark(PoseLandmarkType.RIGHT_WRIST);
    PoseLandmark? leftHip = pose.landmark(PoseLandmarkType.LEFT_HIP);
    PoseLandmark? rightHip = pose.landmark(PoseLandmarkType.RIGHT_HIP);
    PoseLandmark? leftKnee = pose.landmark(PoseLandmarkType.LEFT_KNEE);
    PoseLandmark? rightKnee = pose.landmark(PoseLandmarkType.RIGHT_KNEE);
    PoseLandmark? leftAnkle = pose.landmark(PoseLandmarkType.LEFT_ANKLE);
    PoseLandmark? rightAnkle = pose.landmark(PoseLandmarkType.RIGHT_ANKLE);
    PoseLandmark? leftHeel = pose.landmark(PoseLandmarkType.LEFT_HEEL);
    PoseLandmark? rightHeel = pose.landmark(PoseLandmarkType.RIGHT_HEEL);
    PoseLandmark? leftFootIndex = pose.landmark(PoseLandmarkType.LEFT_FOOT_INDEX);
    PoseLandmark? rightFootIndex = pose.landmark(PoseLandmarkType.RIGHT_FOOT_INDEX);
    PoseLandmark? leftPinky = pose.landmark(PoseLandmarkType.LEFT_PINKY);
    PoseLandmark? rightPinky = pose.landmark(PoseLandmarkType.RIGHT_PINKY);
    PoseLandmark? leftIndex = pose.landmark(PoseLandmarkType.LEFT_INDEX);
    PoseLandmark? rightIndex = pose.landmark(PoseLandmarkType.RIGHT_INDEX);
    PoseLandmark? leftThumb = pose.landmark(PoseLandmarkType.LEFT_THUMB);
    PoseLandmark? rightThumb = pose.landmark(PoseLandmarkType.RIGHT_THUMB);

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = Colors.white.withOpacity(0.75);

    //Draw arms
    if (leftElbow != null && leftWrist != null) {
      canvas.drawLine(transform(leftElbow.position, size), transform(leftWrist.position, size), paint);
    }

    if (leftElbow != null && leftShoulder != null) {
      canvas.drawLine(transform(leftElbow.position, size), transform(leftShoulder.position, size), paint);
    }

    if (rightElbow != null && rightWrist != null) {
      canvas.drawLine(transform(rightElbow.position, size), transform(rightWrist.position, size), paint);
    }

    if (rightElbow != null && rightShoulder != null) {
      canvas.drawLine(transform(rightElbow.position, size), transform(rightShoulder.position, size), paint);
    }

    // Draw Hand
    if (leftWrist != null && leftThumb != null) {
      canvas.drawLine(transform(leftWrist.position, size), transform(leftThumb.position, size), paint);
    }

    if (leftWrist != null && leftIndex != null) {
      canvas.drawLine(transform(leftWrist.position, size), transform(leftIndex.position, size), paint);
    }

    if (leftWrist != null && leftPinky != null) {
      canvas.drawLine(transform(leftWrist.position, size), transform(leftPinky.position, size), paint);
    }

    if (rightWrist != null && rightThumb != null) {
      canvas.drawLine(transform(rightWrist.position, size), transform(rightThumb.position, size), paint);
    }

    if (rightWrist != null && rightIndex != null) {
      canvas.drawLine(transform(rightWrist.position, size), transform(rightIndex.position, size), paint);
    }

    if (rightWrist != null && rightPinky != null) {
      canvas.drawLine(transform(rightWrist.position, size), transform(rightPinky.position, size), paint);
    }

    //Draw legs
    if (leftHip != null && leftKnee != null) {
      canvas.drawLine(transform(leftHip.position, size), transform(leftKnee.position, size), paint);
    }
    if (leftKnee != null && leftAnkle != null) {
      canvas.drawLine(transform(leftKnee.position, size), transform(leftAnkle.position, size), paint);
    }
    if (leftAnkle != null && leftHeel != null) {
      canvas.drawLine(transform(leftAnkle.position, size), transform(leftHeel.position, size), paint);
    }
    if (leftHeel != null && leftFootIndex != null) {
      canvas.drawLine(transform(leftHeel.position, size), transform(leftFootIndex.position, size), paint);
    }
    if (leftAnkle != null && leftFootIndex != null) {
      canvas.drawLine(transform(leftAnkle.position, size), transform(leftFootIndex.position, size), paint);
    }

    if (rightHip != null && rightKnee != null) {
      canvas.drawLine(transform(rightHip.position, size), transform(rightKnee.position, size), paint);
    }
    if (rightKnee != null && rightAnkle != null) {
      canvas.drawLine(transform(rightKnee.position, size), transform(rightAnkle.position, size), paint);
    }
    if (rightAnkle != null && rightHeel != null) {
      canvas.drawLine(transform(rightAnkle.position, size), transform(rightHeel.position, size), paint);
    }
    if (rightHeel != null && rightFootIndex != null) {
      canvas.drawLine(transform(rightHeel.position, size), transform(rightFootIndex.position, size), paint);
    }
    if (rightAnkle != null && rightFootIndex != null) {
      canvas.drawLine(transform(rightAnkle.position, size), transform(rightFootIndex.position, size), paint);
    }

    //Draw body
    if (leftHip != null && leftShoulder != null) {
      canvas.drawLine(transform(leftHip.position, size), transform(leftShoulder.position, size), paint);
    }
    if (rightHip != null && rightShoulder != null) {
      canvas.drawLine(transform(rightHip.position, size), transform(rightShoulder.position, size), paint);
    }
    if(leftHip != null && rightHip != null){
      canvas.drawLine(transform(leftHip.position, size), transform(rightHip.position, size), paint);
    }
    if(leftShoulder != null && rightShoulder != null){
      canvas.drawLine(transform(leftShoulder.position, size), transform(rightShoulder.position, size), paint);
    }

    final textPainter = TextPainter(
        text: TextSpan(
          text: '${CalculateAngle(leftElbow!.position, leftWrist!.position, leftIndex!.position).toInt()}°(L_Wr)\n'
              + '${CalculateAngle(rightElbow!.position, rightWrist!.position, rightIndex!.position).toInt()}°(R_Wr)\n'
              + '${CalculateAngle(leftShoulder!.position, leftHip!.position, leftKnee!.position).toInt()}°(L_Hp L_Kn)\n'
              + '${CalculateAngle(rightShoulder!.position, rightHip!.position, rightKnee!.position).toInt()}°(R_Hp R_Kn)\n'
              + '${CalculateAngle(leftShoulder!.position, leftHip!.position, leftAnkle!.position).toInt()}°(L_Hp L_Ak)\n'
              + '${CalculateAngle(rightShoulder!.position, rightHip!.position, rightAnkle!.position).toInt()}°(R_Hp R_Ak)\n'
              + '${CalculateAngle(leftAnkle!.position, leftKnee!.position, leftHip!.position).toInt()}°(L_Kn)\n'
              + '${CalculateAngle(rightAnkle!.position, rightKnee!.position, rightHip!.position).toInt()}°(R_Kn)\n'
              + '${CalculateAngle(leftKnee!.position, leftAnkle!.position, leftFootIndex!.position).toInt()}°(L_Ft)\n'
              + '${CalculateAngle(rightKnee!.position, rightAnkle!.position, rightFootIndex!.position).toInt()}°(R_Ft)\n'
              + '${CalculateAngle(leftShoulder!.position, leftElbow!.position, leftWrist!.position).toInt()}°(L_Eb)\n'
              + '${CalculateAngle(rightShoulder!.position, rightElbow!.position, rightWrist!.position).toInt()}°(R_Eb)\n'
              + '${CalculateAngle(leftHip!.position, leftShoulder!.position, leftWrist!.position).toInt()}°(L_Sh L_Wr)\n'
              + '${CalculateAngle(rightHip!.position, rightShoulder!.position, rightWrist!.position).toInt()}°(R_Sh R_Wr)\n'
              + '${CalculateAngle(leftHip!.position, leftShoulder!.position, leftElbow!.position).toInt()}°(L_Sh L_Eb)\n'
              + '${CalculateAngle(rightHip!.position, rightShoulder!.position, rightElbow!.position).toInt()}°(R_Sh R_Eb)\n',

          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
        ),
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.right
    );
    textPainter.layout();

// Draw the text centered around the point (50, 100) for instance
    final offset = Offset(50 - (textPainter.width / 2), 100 - (textPainter.height / 2));
    textPainter.paint(canvas, offset);

  }

  Offset transform(Offset point, Size size) {
    return Offset(transformX(point.dx, size), transformY(point.dy, size));
  }

  double transformX(double x, Size size) {
    switch (rotation) {
      case InputImageRotation.ROTATION_90:
        return x * size.width / imageSize.height;
      case InputImageRotation.ROTATION_270:
        return size.width - x * size.width / imageSize.height;
      default:
        return x * size.width / imageSize.width;
    }
  }

  double transformY(double y, Size size) {
    switch (rotation) {
      case InputImageRotation.ROTATION_90:
      case InputImageRotation.ROTATION_270:
        return y * size.height / imageSize.width;
      default:
        return y * size.height / imageSize.height;
    }
  }

  double CalculateAngle(Offset p1, Offset p2, Offset p3) {
    final vector.Vector2 v1 = vector.Vector2(p1.dx - p2.dx, p1.dy - p2.dy);
    final vector.Vector2 v2 = vector.Vector2(p3.dx - p2.dx, p3.dy - p2.dy);
    final double dotProduct = v1.dot(v2);
    final double cosAngle = dotProduct / (v1.length * v2.length);
    final double angle = acos(cosAngle);
    double degrees = angle * 180 / pi; // Convert to degrees
    if(degrees > 180.0) degrees = 360 - degrees;
    return degrees;
  }


  @override
  bool shouldRepaint(covariant PosePainter oldDelegate) {
    return pose != oldDelegate.pose;
  }
}
