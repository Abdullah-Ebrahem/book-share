import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemTopic extends StatefulWidget {
  final bool isSelected;
  final String topicLogo;
  final String topic;
  final Function() onTap;
  const ItemTopic(
      {super.key,
      required this.isSelected,
      required this.topicLogo,
      required this.topic,
      required this.onTap});

  @override
  State<ItemTopic> createState() => _ItemTopicState();
}

class _ItemTopicState extends State<ItemTopic> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 50.5.r,
            backgroundImage: AssetImage(widget.topicLogo),
            child: widget.isSelected
                ? CircleAvatar(
                    radius: 50.5.r,
                    backgroundColor:
                        Theme.of(context).primaryColor.withOpacity(0.4),
                    child: Icon(
                      Icons.done,
                      color: Colors.white,
                      size: 39.w,
                    ),
                  )
                : null,
          ),
          SizedBox(
            height: 6.2.h,
          ),
          Text(
            widget.topic,
            style: TextStyle(
                fontSize: 16.sp,
                color: widget.isSelected
                    ? Theme.of(context).primaryColor
                    : Colors.black),
          )
        ],
      ),
    );
  }
}
