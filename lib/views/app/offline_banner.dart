import 'dart:async';
import 'package:flutter/material.dart';
import '../../core/network_utils.dart';

class OfflineBanner extends StatefulWidget {
  const OfflineBanner({super.key});

  @override
  State<OfflineBanner> createState() => _OfflineBannerState();
}

class _OfflineBannerState extends State<OfflineBanner> {
  bool _offline = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _check();
    _timer = Timer.periodic(const Duration(seconds: 5), (_) => _check());
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _check() async {
    final online = await hasNetwork();
    if (mounted) {
      setState(() {
        _offline = !online;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_offline) return const SizedBox.shrink();
    return Container(
      height: 24,
      color: Colors.red,
      alignment: Alignment.center,
      child: const Text(
        'Offline mode',
        style: TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }
}