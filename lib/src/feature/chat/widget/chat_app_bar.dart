import 'dart:ui';

import 'package:ai_client/src/core/resources/sizes.dart';
import 'package:ai_client/src/feature/chat/widget/scope/chat_scope.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double _preferredHeight = 90;
  final bool isTyping;

  const ChatAppBar({super.key, required this.isTyping});

  @override
  Size get preferredSize => Size.fromHeight(_preferredHeight);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
            border: Border(
              bottom: BorderSide(
                color: Color.fromARGB(255, 204, 204, 204),
                width: 0.5,
              ),
            ),
          ),
          height: _preferredHeight,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 38,
              left: kDefaultPadding,
              right: kDefaultPadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  image: const AssetImage('asset/image/ai_logo.png'),
                  width: 45,
                  height: 45,
                  color: Theme.of(context).primaryColor,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Your AI assistant',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Visibility(
                          visible: isTyping,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: CupertinoActivityIndicator(
                              color: Theme.of(context).primaryColor,
                              radius: 7,
                            ),
                          ),
                        ),
                        Text(
                          isTyping ? 'typing' : 'oline',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 13.5,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () => _showCancelDialog(context),
                  padding: EdgeInsets.zero,
                  alignment: Alignment.centerRight,
                  icon: Icon(
                    Icons.delete_outline_outlined,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showCancelDialog(BuildContext pageContext) =>
      showCupertinoModalPopup<CupertinoActionSheet>(
        context: pageContext,
        builder: (context) => CupertinoActionSheet(
          message: const Text('Are you want to clear history?'),
          cancelButton: CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          actions: [
            CupertinoActionSheetAction(
              isDestructiveAction: true,
              onPressed: () {
                Navigator.pop(context);
                ChatScope.clearMessage(pageContext);
              },
              child: const Text('Clear'),
            )
          ],
        ),
      );
}
