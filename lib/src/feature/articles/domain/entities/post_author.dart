/// 게시글 작성자 엔티티입니다.
class PostAuthor {
  /// 게시글 작성자 엔티티를 생성합니다.
  const PostAuthor({
    required this.id,
    required this.nickname,
    this.profileImage,
  });

  /// 작성자 ID(UUID)입니다.
  final String id;

  /// 작성자 닉네임입니다.
  final String nickname;

  /// 작성자 프로필 이미지 URL입니다.
  final String? profileImage;
}
