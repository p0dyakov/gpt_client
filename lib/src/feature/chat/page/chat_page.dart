import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart' as ui;
import 'package:gpt_client/src/feature/chat/bloc/chat_bloc.dart';
import 'package:gpt_client/src/feature/chat/widget/chat_app_bar.dart';
import 'package:gpt_client/src/feature/chat/widget/scope/chat_scope.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage(name: 'ChatRoute')
class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  var _isDialogShowing = false;

  @override
  Widget build(BuildContext context) => ChatScope(
        child: BlocListener<ChatBloc, ChatState>(
          listener: _blocListener,
          child: BlocBuilder<ChatBloc, ChatState>(
            builder: (context, state) {
              return Scaffold(
                appBar: ChatAppBar(
                  isTyping: state is ChatStateLoading,
                ),
                extendBodyBehindAppBar: true,
                body: SafeArea(
                  child: ui.Chat(
                    messages: state.data.messages,
                    inputOptions: ui.InputOptions(
                      sendButtonVisibilityMode: state is ChatStateLoading
                          ? ui.SendButtonVisibilityMode.hidden
                          : ui.SendButtonVisibilityMode.editing,
                    ),
                    onSendPressed: (partialText) => ChatScope.sendMessage(
                      context,
                      partialText.text,
                    ),
                    emptyState: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: const AssetImage('asset/image/ai_logo.png'),
                          width: 150,
                          height: 150,
                          color: Theme.of(context).primaryColor,
                        ),
                        const Text(
                          'Ask your assistant something',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 3),
                        InkWell(
                          onTap: () => launchUrl(
                            Uri.parse('https://openai.com/blog/chatgpt'),
                          ),
                          child: Text(
                            'More about Chat GPT',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    user: state.data.user,
                    scrollPhysics: const BouncingScrollPhysics(),
                    dateHeaderBuilder: (header) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Center(
                        child: Text(
                          DateFormat('MMMM d, y').format(header.dateTime),
                          style: const TextStyle(
                            color: Color.fromARGB(255, 138, 138, 138),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    theme: ui.DefaultChatTheme(
                      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

                      /// MESSAGES
                      messageInsetsHorizontal: 10,
                      messageInsetsVertical: 8,
                      messageBorderRadius: 14,
                      primaryColor: Theme.of(context).primaryColor,
                      secondaryColor: const Color.fromARGB(255, 239, 239, 239),
                      receivedMessageBodyTextStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                      ),
                      sentMessageBodyTextStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                      ),

                      /// INPUT
                      inputBorderRadius: BorderRadius.zero,
                      inputBackgroundColor: Colors.white,
                      inputTextColor: Colors.black,
                      inputTextCursorColor: Theme.of(context).primaryColor,
                      inputPadding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 7,
                        // bottom: MediaQuery.of(context).viewInsets.bottom != 0
                        //     ? 7
                        //     : 30,
                      ),
                      inputTextStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                      ),
                      inputContainerDecoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Color.fromARGB(255, 204, 204, 204),
                            width: 0.5,
                          ),
                        ),
                      ),
                      inputTextDecoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 204, 204, 204),
                            width: 0.5,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 204, 204, 204),
                            width: 0.5,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 13,
                          vertical: 8,
                        ),
                        isCollapsed: true,
                      ),

                      /// SEND BUTTON
                      sendButtonMargin: EdgeInsets.zero,
                      sendButtonIcon: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(14)),
                          color: Theme.of(context).primaryColor,
                        ),
                        padding: const EdgeInsets.all(2),
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: const Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.white,
                            size: 19,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );

  void _blocListener(BuildContext context, ChatState state) {
    if (!_isDialogShowing && state is ChatStateError) {
      Future.delayed(
        Duration.zero,
        () => _showErrorDialog(context, state.error),
      );
    }
  }

  Future<void> _showErrorDialog(BuildContext context, String error) async {
    _isDialogShowing = true;
    await showCupertinoModalPopup<void>(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('An error has occurred'),
        content: Text(error),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Okay',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 17,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
    _isDialogShowing = false;
  }
}
