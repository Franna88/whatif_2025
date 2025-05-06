import 'package:flutter/material.dart';
import 'dart:async';

class WatifVoiceSearch extends StatefulWidget {
  const WatifVoiceSearch({Key? key}) : super(key: key);

  @override
  State<WatifVoiceSearch> createState() => _WatifVoiceSearchState();
}

class _WatifVoiceSearchState extends State<WatifVoiceSearch>
    with SingleTickerProviderStateMixin {
  bool _isListening = false;
  bool _isConversationStarted = false;

  // For conversation demo
  int _conversationStep = 0;
  final List<ChatMessage> _messages = [
    const ChatMessage(
      text: "Hello my name is watif,\nhow may I assist you\ntoday?",
      isUser: false,
    ),
  ];

  // Animation controller for microphone pulse effect
  late AnimationController _animationController;
  late Animation<double> _pulseAnimation;

  // Timer for simulating conversation
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    // Setup animation for microphone button
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  // Start the conversation flow with predefined messages
  void _startConversation() {
    setState(() {
      _isListening = false;
      _isConversationStarted = true;
    });

    // Add user's first message
    _timer = Timer(const Duration(milliseconds: 800), () {
      setState(() {
        _messages.add(
          const ChatMessage(
            text: "I need a panel beater\nspecializing in hail\ndamage.",
            isUser: true,
          ),
        );
        _conversationStep = 1;
      });

      // Add Watif's response
      _timer = Timer(const Duration(milliseconds: 1200), () {
        setState(() {
          _messages.add(
            const ChatMessage(
              text: "Where is the vehicle?",
              isUser: false,
            ),
          );
          _conversationStep = 2;
        });

        // Add user's second response
        _timer = Timer(const Duration(milliseconds: 1000), () {
          setState(() {
            _messages.add(
              const ChatMessage(
                text: "In Jeffrey's bay.",
                isUser: true,
              ),
            );
            _conversationStep = 3;
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    // Calculate responsive sizes
    final double bubbleFontSize = screenSize.width * 0.04;
    final double titleFontSize = screenSize.width * 0.05;
    final double microphoneSize = screenSize.width * 0.2;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black.withOpacity(0.9),
        child: Stack(
          children: [
            // Chat messages
            Positioned.fill(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenSize.width * 0.1,
                  vertical: screenSize.height * 0.1,
                ),
                child: ListView.builder(
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Align(
                        alignment: _messages[index].isUser
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: screenSize.width * 0.7,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 12.0,
                          ),
                          decoration: BoxDecoration(
                            color: _messages[index].isUser
                                ? const Color(0xFF2F5B75)
                                : const Color(0xFF011F33),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            _messages[index].text,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: bubbleFontSize,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // Indicator dots
            if (!_isConversationStarted)
              Positioned(
                top: screenSize.height * 0.28,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    4,
                    (index) => Container(
                      width: 8,
                      height: 8,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index == 0
                            ? Colors.white
                            : Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
              ),

            // Bottom section with microphone button and text
            Positioned(
              bottom: screenSize.height * 0.15,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  if (!_isConversationStarted)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: Text(
                        'Tap button to speak',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  GestureDetector(
                    onTap: _isConversationStarted ? null : _startConversation,
                    child: AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _isListening ? _pulseAnimation.value : 1.0,
                          child: Container(
                            width: microphoneSize,
                            height: microphoneSize,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFF011F33),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue.withOpacity(0.3),
                                  blurRadius: 10,
                                  spreadRadius: _isListening ? 5 : 0,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Icon(
                                Icons.mic,
                                color: Colors.white,
                                size: microphoneSize * 0.5,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Close button at top right
            Positioned(
              top: 24,
              right: 24,
              child: IconButton(
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 32,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),

            // Close button at bottom right
            Positioned(
              bottom: 24,
              right: 24,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.2),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 20,
                  ),
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Model class for chat messages
class ChatMessage {
  final String text;
  final bool isUser;

  const ChatMessage({
    required this.text,
    required this.isUser,
  });
}
