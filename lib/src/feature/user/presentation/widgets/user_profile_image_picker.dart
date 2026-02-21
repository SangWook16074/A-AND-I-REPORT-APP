import 'dart:typed_data';

import 'package:a_and_i_report_web_server/src/core/constants/api_url.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:a_and_i_report_web_server/src/feature/home/presentation/views/home_theme.dart';
import 'package:a_and_i_report_web_server/src/feature/user/presentation/widgets/user_profile_image_compression_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// 선택된 프로필 이미지 정보다.
class UserProfileImageSelection {
  const UserProfileImageSelection({
    required this.bytes,
    required this.mimeType,
    required this.fileName,
  });

  final Uint8List bytes;
  final String mimeType;
  final String fileName;
}

/// 사용자 프로필 이미지를 선택하고 미리보기하는 위젯이다.
class UserProfileImagePicker extends StatefulWidget {
  const UserProfileImagePicker({
    super.key,
    this.onImageChanged,
    this.profileImageUrl,
    this.enabled = true,
  });

  final ValueChanged<UserProfileImageSelection>? onImageChanged;
  final String? profileImageUrl;
  final bool enabled;

  @override
  State<UserProfileImagePicker> createState() => UserProfileImagePickerState();
}

class UserProfileImagePickerState extends State<UserProfileImagePicker> {
  final ImagePicker imagePicker = ImagePicker();
  Uint8List? selectedImageBytes;
  bool isPicking = false;

  /// 선택된 로컬 이미지를 초기화한다.
  void clearSelection() {
    if (!mounted) {
      return;
    }
    setState(() {
      selectedImageBytes = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: !widget.enabled || isPicking
              ? null
              : () async {
                  setState(() {
                    isPicking = true;
                  });

                  try {
                    final XFile? selectedImage = await imagePicker.pickImage(
                      source: ImageSource.gallery,
                    );

                    if (selectedImage == null) {
                      return;
                    }

                    final Uint8List originalBytes =
                        await selectedImage.readAsBytes();
                    final UserProfileImageCompressionResult compressedResult =
                        await UserProfileImageCompressionService
                            .compressWithinLimit(
                      originalBytes,
                    );

                    if (!mounted) {
                      return;
                    }

                    setState(() {
                      selectedImageBytes = compressedResult.bytes;
                    });
                    widget.onImageChanged?.call(
                      UserProfileImageSelection(
                        bytes: compressedResult.bytes,
                        mimeType: compressedResult.mimeType,
                        fileName: compressedResult.fileName,
                      ),
                    );
                  } catch (_) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            '이미지를 WebP(1MB 이하)로 처리하지 못했습니다. 다른 이미지를 선택해주세요.',
                          ),
                        ),
                      );
                    }
                  } finally {
                    if (mounted) {
                      setState(() {
                        isPicking = false;
                      });
                    }
                  }
                },
          borderRadius: BorderRadius.circular(999),
          child: Stack(
            children: [
              Container(
                width: 96,
                height: 96,
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(
                    color: Colors.black.withValues(alpha: 0.06),
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: UserProfileImageBody(
                  selectedImageBytes: selectedImageBytes,
                  profileImageUrl: widget.profileImageUrl,
                ),
              ),
              if (widget.enabled)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(
                        color: Colors.black.withValues(alpha: 0.10),
                      ),
                    ),
                    child: Icon(
                      Icons.photo_camera_outlined,
                      size: 16,
                      color: HomeTheme.textMuted.withValues(alpha: 0.8),
                    ),
                  ),
                ),
              if (isPicking)
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.65),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: const Center(
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

/// 프로필 이미지 본문 표시 위젯이다.
class UserProfileImageBody extends StatelessWidget {
  const UserProfileImageBody({
    super.key,
    required this.selectedImageBytes,
    required this.profileImageUrl,
  });

  final Uint8List? selectedImageBytes;
  final String? profileImageUrl;

  @override
  Widget build(BuildContext context) {
    if (selectedImageBytes != null) {
      return Image.memory(
        selectedImageBytes!,
        fit: BoxFit.cover,
      );
    }

    if (profileImageUrl != null && profileImageUrl!.isNotEmpty) {
      final resolvedImageUrl = _resolveProfileImageUrl(profileImageUrl!);
      return CachedNetworkImage(
        imageUrl: resolvedImageUrl,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          color: const Color(0xFFF1F5F9),
          child: const Center(
            child: SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
        ),
        errorWidget: (context, url, error) => const Icon(
          Icons.account_circle,
          size: 64,
          color: Color(0xFFCBD5E1),
        ),
      );
    }

    return const Icon(
      Icons.account_circle,
      size: 64,
      color: Color(0xFFCBD5E1),
    );
  }

  String _resolveProfileImageUrl(String imagePath) {
    final trimmedImagePath = imagePath.trim();
    if (trimmedImagePath.isEmpty) {
      return trimmedImagePath;
    }

    if (trimmedImagePath.startsWith('http://') ||
        trimmedImagePath.startsWith('https://') ||
        trimmedImagePath.startsWith('data:')) {
      return trimmedImagePath;
    }

    if (baseUrl.trim().isEmpty) {
      return trimmedImagePath;
    }

    return Uri.parse(baseUrl).resolve(trimmedImagePath).toString();
  }
}
